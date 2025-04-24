CREATE OR REPLACE PACKAGE GestionareMetrorex AS

    TYPE TIP_COSTURI IS RECORD (
        luna DATE,
        cost_intretinere DECIMAL(10, 2),
        salarii DECIMAL(10, 2),
        venituri DECIMAL(10, 2)
    );
    TYPE LISTA_COSTURI IS TABLE OF TIP_COSTURI;

    FUNCTION CALCUL_COSTURI_LUNARE(
        luna DATE
    ) RETURN CLOB;

    FUNCTION VENITURI_DIN_BILETE(
        luna DATE
    ) RETURN DECIMAL;

    FUNCTION PROCENT_ACOPERIRE_COSTURI(
        luna DATE
    ) RETURN DECIMAL;

    FUNCTION CHELTUIELI_TOTALE(
        luna DATE
    ) RETURN DECIMAL;

    FUNCTION PROCENT_VALIDARI_NEREUSITE(
        luna DATE
    ) RETURN DECIMAL;

    PROCEDURE GENEREAZA_RAPORT_COSTURI(
        luna DATE
    );

    PROCEDURE PLATESTE_COSTURI(
        luna DATE
    );

    PROCEDURE ANALIZA_FINANCIARA(
        luna DATE
    );

    PROCEDURE RAPORT_VALIDARI_NEREUSITE(
        luna DATE
    );

END GestionareMetrorex;
/

CREATE OR REPLACE PACKAGE BODY GestionareMetrorex AS

    FUNCTION CALCUL_COSTURI_LUNARE(
        luna DATE
    ) RETURN CLOB AS
        costuri_json CLOB;
        cost_intretinere_total DECIMAL(10, 2) := 0;
        salarii_total DECIMAL(10, 2) := 0;
        venituri_total DECIMAL(10, 2);
    BEGIN
        SELECT SUM(cost_intretinere) INTO cost_intretinere_total
        FROM METROURI
        WHERE TO_CHAR(SYSDATE, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY');

        SELECT SUM(salariu) INTO salarii_total
        FROM ANGAJATI;

        venituri_total := VENITURI_DIN_BILETE(luna);

        SELECT JSON_OBJECT(
            'luna' VALUE TO_CHAR(luna, 'MM-YYYY'),
            'cost_intretinere' VALUE cost_intretinere_total,
            'salarii' VALUE salarii_total,
            'venituri' VALUE venituri_total
        ) INTO costuri_json
        FROM DUAL;

        RETURN costuri_json;
    END;

    FUNCTION VENITURI_DIN_BILETE(
        luna DATE
    ) RETURN DECIMAL AS
        venituri DECIMAL(10, 2) := 0;
    BEGIN
        SELECT SUM(pret) INTO venituri
        FROM ABONAMENTE a
        JOIN TIPURI_ABONAMENTE t ON a.tip_abonament = t.tip_ab
        WHERE TO_CHAR(a.data_activare, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY');

        RETURN venituri;
    END;

    FUNCTION PROCENT_ACOPERIRE_COSTURI(
        luna DATE
    ) RETURN DECIMAL AS
        venituri DECIMAL(10, 2);
        cheltuieli DECIMAL(10, 2);
    BEGIN
        venituri := VENITURI_DIN_BILETE(luna);
        cheltuieli := CHELTUIELI_TOTALE(luna);

        RETURN (venituri / cheltuieli) * 100;
    END;

    FUNCTION CHELTUIELI_TOTALE(
        luna DATE
    ) RETURN DECIMAL AS
        cost_intretinere_total DECIMAL(10, 2);
        salarii_total DECIMAL(10, 2);
    BEGIN
        SELECT SUM(cost_intretinere) INTO cost_intretinere_total
        FROM METROURI
        WHERE TO_CHAR(SYSDATE, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY');

        SELECT SUM(salariu) INTO salarii_total
        FROM ANGAJATI;

        RETURN cost_intretinere_total + salarii_total;
    END;

    FUNCTION PROCENT_VALIDARI_NEREUSITE(
        luna DATE
    ) RETURN DECIMAL AS
        total_validari NUMBER;
        validari_nereusite NUMBER;
    BEGIN
        SELECT COUNT(*) INTO total_validari
        FROM VALIDARI
        WHERE TO_CHAR(data, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY');

        SELECT COUNT(*) INTO validari_nereusite
        FROM VALIDARI
        WHERE validat = 0 AND TO_CHAR(data, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY');

        RETURN (validari_nereusite / total_validari) * 100;
    END;

    PROCEDURE GENEREAZA_RAPORT_COSTURI(
        luna DATE
    ) AS
        raport_json CLOB;
    BEGIN
        raport_json := CALCUL_COSTURI_LUNARE(luna);
        DBMS_OUTPUT.PUT_LINE('Raport costuri pentru luna ' || TO_CHAR(luna, 'MM-YYYY') || ': ' || raport_json);
    END;

    PROCEDURE PLATESTE_COSTURI(
        luna DATE
    ) AS
        costuri JSON_OBJECT_T;
        venituri DECIMAL(10, 2);
        cheltuieli DECIMAL(10, 2);
    BEGIN
        costuri := JSON_OBJECT_T(CALCUL_COSTURI_LUNARE(luna));
        venituri := costuri.get_number('venituri');
        cheltuieli := costuri.get_number('cost_intretinere') + costuri.get_number('salarii');

        IF venituri >= cheltuieli THEN
            DBMS_OUTPUT.PUT_LINE('Costurile pentru luna ' || TO_CHAR(luna, 'MM-YYYY') || ' au fost acoperite cu succes.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Atentie! Veniturile pentru luna ' || TO_CHAR(luna, 'MM-YYYY') || ' nu acopera costurile.');
        END IF;
    END;

    PROCEDURE ANALIZA_FINANCIARA(
        luna DATE
    ) AS
        procent_acoperire DECIMAL(10, 2);
    BEGIN
        procent_acoperire := PROCENT_ACOPERIRE_COSTURI(luna);
        DBMS_OUTPUT.PUT_LINE('Procentul de acoperire a costurilor pentru luna ' || TO_CHAR(luna, 'MM-YYYY') || ' este: ' || procent_acoperire || '%');

        IF procent_acoperire < 100 THEN
            DBMS_OUTPUT.PUT_LINE('Atentie: Costurile nu sunt acoperite complet!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Costurile sunt acoperite cu succes.');
        END IF;
    END;

    PROCEDURE RAPORT_VALIDARI_NEREUSITE(
        luna DATE
    ) AS
    BEGIN
        FOR r IN (
            SELECT s.nume_statie, COUNT(*) AS nr_validari_nereusite
            FROM VALIDARI v
            JOIN STATII s ON v.cod_statie = s.cod_statie
            WHERE v.validat = 0 AND TO_CHAR(v.data, 'MM-YYYY') = TO_CHAR(luna, 'MM-YYYY')
            GROUP BY s.nume_statie
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Statia: ' || r.nume_statie || ', Validari nereusite: ' || r.nr_validari_nereusite);
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Procentul total de validari nereusite: ' || PROCENT_VALIDARI_NEREUSITE(luna) || '%');
    END;

END GestionareMetrorex;
/

DECLARE
    raport CLOB;
BEGIN
    raport := GestionareMetrorex.CALCUL_COSTURI_LUNARE(TO_DATE('01-01-2025', 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Raport costuri lunare: ' || raport);
END;
/


DECLARE
    venituri DECIMAL(10, 2);
BEGIN
    venituri := GestionareMetrorex.VENITURI_DIN_BILETE(TO_DATE('01-01-2025', 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Venituri din bilete: ' || venituri);
END;
/


BEGIN
    GestionareMetrorex.ANALIZA_FINANCIARA(TO_DATE('01-01-2025', 'DD-MM-YYYY'));
END;
/

BEGIN
    GestionareMetrorex.RAPORT_VALIDARI_NEREUSITE(TO_DATE('01-01-2025', 'DD-MM-YYYY'));
END;
/

BEGIN
    GestionareMetrorex.PLATESTE_COSTURI(TO_DATE('01-01-2025', 'DD-MM-YYYY'));
END;
/