INSERT INTO MAGISTRALE (nr_magistrala, statie_inceput, statie_sfarsit, culoare)
VALUES (1, 1, 2, 'Galben');

INSERT INTO MAGISTRALE (nr_magistrala, statie_inceput, statie_sfarsit, culoare)
VALUES (2, 3, 4, 'Albastru');

INSERT INTO MAGISTRALE (nr_magistrala, statie_inceput, statie_sfarsit, culoare)
VALUES (3, 5, 6, 'Rosu');

INSERT INTO MAGISTRALE (nr_magistrala, statie_inceput, statie_sfarsit, culoare)
VALUES (4, 7, 8, 'Verde');

INSERT INTO MAGISTRALE (nr_magistrala, statie_inceput, statie_sfarsit, culoare)
VALUES (5, 9, 10, 'Portocaliu');

--M1 (GALBEN)
INSERT INTO STATII (cod_statie, nume_statie, nr_iesiri, nr_magistrala1, nr_magistrala2, nr_ordine1, nr_ordine2, peron) VALUES
(1, 'Dristor 2', 3, 1, NULL, 1, NULL, 'S');
INSERT INTO STATII VALUES (2, 'Piata Muncii', 2, 1, NULL, 2, NULL, 'S');
INSERT INTO STATII VALUES (3, 'Piata Iancului', 3, 1, NULL, 3, NULL, 'S');
INSERT INTO STATII VALUES (4, 'Obor', 4, 1, NULL, 4, NULL, 'S');
INSERT INTO STATII VALUES (5, 'Stefan cel Mare', 2, 1, NULL, 5, NULL, 'S');
INSERT INTO STATII VALUES (6, 'Piata Victoriei', 5, 1, 2, 6, 4, 'D');
INSERT INTO STATII VALUES (7, 'Gara de Nord', 6, 1, 4, 7, 1, 'D');
INSERT INTO STATII VALUES (8, 'Basarab', 4, 1, 4, 8, 2, 'D');
INSERT INTO STATII VALUES (9, 'Crangasi', 3, 1, NULL, 9, NULL, 'S');
INSERT INTO STATII VALUES (10, 'Petrache Poenaru', 2, 1, NULL, 10, NULL, 'S');
INSERT INTO STATII VALUES (11, 'Grozaesti', 3, 1, NULL, 11, NULL, 'D');
INSERT INTO STATII VALUES (12, 'Eroilor 1', 5, 1, 3, 12, 6, 'D');
INSERT INTO STATII VALUES (13, 'Izvor', 3, 1, 3, 13, 7, 'D');
INSERT INTO STATII VALUES (14, 'Piata Unirii 1', 6, 1, 3, 14, 8, 'S');
INSERT INTO STATII VALUES (15, 'Timpuri Noi', 4, 1, 3, 15, 9, 'D');
INSERT INTO STATII VALUES (16, 'Mihai Bravu', 3, 1, 3, 16, 10, 'D');
INSERT INTO STATII VALUES (17, 'Dristor 1', 3, 1, 3, 17, 11, 'S');
INSERT INTO STATII VALUES (18, 'Nicolae Grigorescu', 3, 1, 3, 18, 12, 'D');
INSERT INTO STATII VALUES (19, 'Titan', 3, 1, NULL, 19, NULL, 'S');
INSERT INTO STATII VALUES (20, 'Costin Georgian', 2, 1, NULL, 20, NULL, 'S');
INSERT INTO STATII VALUES (21, 'Republica', 3, 1, NULL, 21, NULL, 'D');
INSERT INTO STATII VALUES (22, 'Pantelimon', 2, 1, NULL, 22, NULL, 'S');

--M2 (ALBASTRU)
INSERT INTO STATII VALUES (23, 'Pipera', 3, 2, NULL, 1, NULL, 'S');
INSERT INTO STATII VALUES (24, 'Aurel Vlaicu', 2, 2, NULL, 2, NULL, 'S');
INSERT INTO STATII VALUES (25, 'Aviatorilor', 3, 2, NULL, 3, NULL, 'S');
INSERT INTO STATII VALUES (26, 'Piata Romana', 4, 2, NULL, 5, NULL, 'D');
INSERT INTO STATII VALUES (27, 'Universitate', 4, 2, NULL, 6, NULL, 'S');
INSERT INTO STATII VALUES (28, 'Piata Unirii 2', 6, 2, NULL, 7, NULL, 'D');
INSERT INTO STATII VALUES (29, 'Tineretului', 2, 2, NULL, 8, NULL, 'S');
INSERT INTO STATII VALUES (30, 'Eroii Revolutiei', 3, 2, NULL, 9, NULL, 'D');
INSERT INTO STATII VALUES (31, 'Piata Sudului', 4, 2, NULL, 10, NULL, 'S');
INSERT INTO STATII VALUES (32, 'Aparatorii Patriei', 3, 2, NULL, 11, NULL, 'S');
INSERT INTO STATII VALUES (33, 'Dimitrie Leonida', 2, 2, NULL, 12, NULL, 'S');
INSERT INTO STATII VALUES (34, 'Berceni', 2, 2, NULL, 13, NULL, 'S');
INSERT INTO STATII VALUES (35, 'Tudor Arghezi', 2, 2, NULL, 14, NULL, 'D');

--M3 (ROSU)
INSERT INTO STATII VALUES (36, 'Preciziei', 2, 3, NULL, 1, NULL, 'S');
INSERT INTO STATII VALUES (37, 'Pacii', 3, 3, NULL, 2, NULL, 'S');
INSERT INTO STATII VALUES (38, 'Gorjului', 3, 3, NULL, 3, NULL, 'S');
INSERT INTO STATII VALUES (39, 'Lujerului', 2, 3, NULL, 4, NULL, 'S');
INSERT INTO STATII VALUES (40, 'Politehnica', 4, 3, NULL, 5, NULL, 'S');
INSERT INTO STATII VALUES (41, '1 Decembrie 1918', 2, 3, NULL, 13, NULL, 'S');
INSERT INTO STATII VALUES (42, 'Nicolae Teclu', 2, 3, NULL, 14, NULL, 'S');
INSERT INTO STATII VALUES (43, 'Anghel Saligny', 3, 3, NULL, 15, NULL, 'D');

--M4 (VERDE)
INSERT INTO STATII VALUES (44, 'Grivita', 3, 4, NULL, 3, NULL, 'S');
INSERT INTO STATII VALUES (45, '1 Mai', 3, 4, NULL, 4, NULL, 'S');
INSERT INTO STATII VALUES (46, 'Jiului', 2, 4, NULL, 5, NULL, 'S');
INSERT INTO STATII VALUES (47, 'Parc Bazilescu', 2, 4, NULL, 6, NULL, 'S');
INSERT INTO STATII VALUES (48, 'Laminorului', 3, 4, NULL, 7, NULL, 'D');
INSERT INTO STATII VALUES (49, 'Straulesti', 3, 4, NULL, 8, NULL, 'S');

--M5 (PORTOCALIU)
INSERT INTO STATII VALUES (50, 'Eroilor 2', 5, 5, NULL, 1, NULL, 'D');
INSERT INTO STATII VALUES (51, 'Academia Militara', 3, 5, NULL, 2, NULL, 'S');
INSERT INTO STATII VALUES (52, 'Orizont', 3, 5, NULL, 3, NULL, 'D');
INSERT INTO STATII VALUES (53, 'Favorit', 2, 5, NULL, 4, NULL, 'S');
INSERT INTO STATII VALUES (54, 'Tudor Vladimirescu', 2, 5, NULL, 5, NULL, 'S');
INSERT INTO STATII VALUES (55, 'Parc Drumul Taberei', 3, 5, NULL, 6, NULL, 'D');
INSERT INTO STATII VALUES (56, 'Romancierilor', 4, 5, NULL, 7, NULL, 'S');
INSERT INTO STATII VALUES (57, 'Constantin Brancusi', 3, 5, NULL, 8, NULL, 'D');
INSERT INTO STATII VALUES (58, 'Raul Doamnei', 2, 5, NULL, 9, NULL, 'S');

INSERT INTO TIPURI_ABONAMENTE VALUES (1, 'Abonament 24 ore', 12, 1);
INSERT INTO TIPURI_ABONAMENTE VALUES (2, 'Abonament 72 ore', 35, 3);
INSERT INTO TIPURI_ABONAMENTE VALUES (3, 'Abonament saptamanal', 45, 7);
INSERT INTO TIPURI_ABONAMENTE VALUES (4, 'Abonament lunar', 100, 30);
INSERT INTO TIPURI_ABONAMENTE VALUES (5, 'Abonament anual', 900, 365);

CREATE OR REPLACE FUNCTION generare_prenume
RETURN VARCHAR2 AS 
    PRENUME VARCHAR2(20);  
    TYPE STRINGARRAY IS VARRAY(25) OF VARCHAR2(20);
    LISTA_PRENUME STRINGARRAY := STRINGARRAY(
        'Andrei', 'Maria', 'Ion', 'Elena', 'Mihai',
        'Ana', 'Gabriel', 'Ioana', 'George', 'Raluca',
        'Cristian', 'Alexandra', 'Daniel', 'Alina', 'Florin',
        'Diana', 'Adrian', 'Larisa', 'Victor', 'Roxana',
        'Stefan', 'Claudia', 'Alexandru', 'Bianca', 'Vlad'
    );
BEGIN
    PRENUME := LISTA_PRENUME(TRUNC(DBMS_RANDOM.VALUE(1, LISTA_PRENUME.COUNT + 1)));
    RETURN PRENUME;
END;
/
CREATE OR REPLACE FUNCTION generare_nume
RETURN VARCHAR2 AS 
    NUME VARCHAR2(20);  
    TYPE STRINGARRAY IS VARRAY(30) OF VARCHAR2(20);
    LISTA_NUME STRINGARRAY := STRINGARRAY(
        'Popescu', 'Ionescu', 'Georgescu', 'Dumitrescu', 'Stan',
        'Popa', 'Radu', 'Marin', 'Tudor', 'Diaconu',
        'Stoica', 'Petrescu', 'Nicolae', 'Florea', 'Vasile',
        'Ciobanu', 'Munteanu', 'Stefan', 'Sandu', 'Dragomir',
        'Matei', 'Ilie', 'Nistor', 'Badea', 'Constantin',
        'Dobre', 'Grigore', 'Barbu', 'Roman', 'Enache'
    );
BEGIN
    NUME := LISTA_NUME(TRUNC(DBMS_RANDOM.VALUE(1, LISTA_NUME.COUNT + 1)));
    RETURN NUME;
END;
/
CREATE OR REPLACE PROCEDURE genereaza_calatori IS
    v_nume VARCHAR2(50);
    v_prenume VARCHAR2(50);
    v_email VARCHAR2(100);
    v_telefon VARCHAR2(10);
    v_data_nasterii DATE;
BEGIN
    FOR i IN 1..100 LOOP
        v_nume := generare_nume;
        v_prenume := generare_prenume;
        v_email := LOWER(v_nume || '.' || v_prenume || '@gmail.com');
        v_telefon := '07' || LPAD(TRUNC(DBMS_RANDOM.VALUE(0, 99999999)), 8, '0');
        v_data_nasterii := TO_DATE(
            TRUNC(DBMS_RANDOM.VALUE(1970, 2011)) || '-' || 
            LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 13)), 2, '0') || '-' || 
            LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 29)), 2, '0'),
            'YYYY-MM-DD'
        );

        INSERT INTO CALATORI (cod_calator, nume, prenume, email, telefon, data_nasterii)
        VALUES (i, v_nume, v_prenume, v_email, v_telefon, v_data_nasterii);
    END LOOP;

    COMMIT;
END;
/

BEGIN
    genereaza_calatori;
END;
/
CREATE OR REPLACE PROCEDURE genereaza_angajati IS
    v_cod_angajat NUMBER;
    v_nume VARCHAR2(50);
    v_prenume VARCHAR2(50);
    v_email VARCHAR2(100);
    v_telefon VARCHAR2(20);
    v_data_nasterii DATE;
    v_salariu DECIMAL(10, 2);
BEGIN
    FOR i IN 1..120 LOOP
        v_cod_angajat := i;
        v_nume := generare_nume;
        v_prenume := generare_prenume;
        v_email := LOWER(v_nume || '.' || v_prenume || '@gmail.com');
        v_telefon := '07' || LPAD(TRUNC(DBMS_RANDOM.VALUE(0, 99999999)), 8, '0');
        v_data_nasterii := TO_DATE(
            TRUNC(DBMS_RANDOM.VALUE(1970, 2000)) || '-' ||
            LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 13)), 2, '0') || '-' ||
            LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 29)), 2, '0'),
            'YYYY-MM-DD');
        v_salariu := ROUND(DBMS_RANDOM.VALUE(3000, 15000), 2);

        INSERT INTO ANGAJATI (cod_angajat, nume, prenume, data_nasterii, salariu, telefon, email)
        VALUES (v_cod_angajat, v_nume, v_prenume, v_data_nasterii, v_salariu, v_telefon, v_email);
    END LOOP;

    COMMIT;
END;
/

BEGIN
    genereaza_angajati;
END;
/
CREATE OR REPLACE PROCEDURE genereaza_soferi IS
    v_cod_angajat NUMBER;
    v_experienta NUMBER;
    CURSOR c_angajati IS
        SELECT cod_angajat FROM ANGAJATI ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 60 ROWS ONLY;
BEGIN
    FOR r_angajat IN c_angajati LOOP
        v_cod_angajat := r_angajat.cod_angajat;
        v_experienta := TRUNC(DBMS_RANDOM.VALUE(2, 31));  

        INSERT INTO SOFERI (cod_angajat, experienta)
        VALUES (v_cod_angajat, v_experienta);
    END LOOP;

    COMMIT;
END;
/

BEGIN
    genereaza_soferi;
    DBMS_OUTPUT.PUT_LINE('Au fost adugati soferii!');
END;
/

CREATE OR REPLACE PROCEDURE genereaza_casieri IS
    v_cod_angajat NUMBER;
    v_limba VARCHAR2(50);
    CURSOR c_angajati IS
        SELECT cod_angajat 
        FROM ANGAJATI 
        WHERE cod_angajat NOT IN (SELECT cod_angajat FROM SOFERI);
BEGIN
    FOR r_angajat IN c_angajati LOOP
        v_cod_angajat := r_angajat.cod_angajat;

        CASE TRUNC(DBMS_RANDOM.VALUE(1, 6))
            WHEN 1 THEN v_limba := 'Engleza';
            WHEN 2 THEN v_limba := 'Germana';
            WHEN 3 THEN v_limba := 'Franceza';
            WHEN 4 THEN v_limba := 'Spaniola';
            WHEN 5 THEN v_limba := 'Italiana';
        END CASE;

        INSERT INTO CASIERI (cod_angajat, limba)
        VALUES (v_cod_angajat, v_limba);
    END LOOP;

    COMMIT;
END;
/

BEGIN
    genereaza_casieri;
    DBMS_OUTPUT.PUT_LINE('Au fost adaugati casierii!');
END;
/

CREATE OR REPLACE PROCEDURE genereaza_abonamente IS
BEGIN
    FOR i IN 1..250 LOOP
        DECLARE
            v_tip_abonament NUMBER(5);
            v_durata NUMBER(5);
            v_data_activare DATE;
            v_cod_casier NUMBER(10);
        BEGIN
            v_tip_abonament := TRUNC(DBMS_RANDOM.VALUE(1, 6));

            SELECT durata INTO v_durata
            FROM TIPURI_ABONAMENTE
            WHERE tip_ab = v_tip_abonament;

            v_data_activare := TO_DATE('2024-12-15', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 32));
            SELECT cod_angajat INTO v_cod_casier
            FROM (
                SELECT cod_angajat
                FROM CASIERI
                ORDER BY DBMS_RANDOM.VALUE
            ) 
            WHERE ROWNUM = 1;

            INSERT INTO ABONAMENTE (cod_abonament, tip_abonament, cod_calator, cod_casier, data_activare, data_expirare)
            VALUES (
                i,
                v_tip_abonament,
                TRUNC(DBMS_RANDOM.VALUE(1, 101)),
                v_cod_casier,
                v_data_activare,
                v_data_activare + v_durata
            );
        END;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('S-au generat abonamentele!');
END;
/

BEGIN
    genereaza_abonamente;
END;
/
INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (1, 'Bucuresti', 1, 1998, 15000.50);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (2, 'Londra', 1, 2010, 16500.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (3, 'Paris', 1, 2005, 12000.80);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (4, 'Madrid', 1, 2020, 18000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (5, 'Roma', 2, 1999, 14000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (6, 'Berlin', 2, 2015, 19000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (7, 'Lisabona', 2, 2003, 13000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (8, 'Bruxelles', 2, 2018, 17500.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (9, 'Moscova', 3, 1997, 11000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (10, 'Viena', 3, 2006, 14500.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (11, 'Budapesta', 3, 2011, 17000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (12, 'Varsovia', 3, 2023, 15500.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (13, 'Praga', 4, 2000, 12000.90);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (14, 'Atena', 4, 2017, 16000.70);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (15, 'Sofia', 4, 1996, 10000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (16, 'Zagreb', 4, 2021, 18500.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (17, 'Helsinki', 5, 1995, 11000.00);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (18, 'Oslo', 5, 2012, 12500.05);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (19, 'Stockholm', 5, 2008, 17000.09);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (20, 'Copenhaga', 5, 2024, 19500.00);


CREATE OR REPLACE PROCEDURE genereaza_curse IS
    v_cod_cursa NUMBER;
    v_cod_metrou NUMBER;
    v_cod_sofer NUMBER;
    v_data DATE;
    v_sens CHAR(1);
BEGIN
    FOR i IN 1..200 LOOP
        v_cod_cursa := i;

        v_cod_metrou := TRUNC(DBMS_RANDOM.VALUE(1, 21));

        SELECT cod_angajat INTO v_cod_sofer
        FROM (
            SELECT cod_angajat FROM SOFERI ORDER BY DBMS_RANDOM.VALUE
        ) WHERE ROWNUM = 1;

        v_data := TO_DATE('2024-12-18', 'YYYY-MM-DD')
                  + TRUNC(DBMS_RANDOM.VALUE(0, 30))
                  + (DBMS_RANDOM.VALUE(0, 1));

        v_sens := CASE WHEN MOD(i, 2) = 0 THEN 'A' ELSE 'B' END;

        INSERT INTO CURSE (cod_cursa, cod_metrou, cod_sofer, data, sens)
        VALUES (v_cod_cursa, v_cod_metrou, v_cod_sofer, v_data, v_sens);
    END LOOP;

    COMMIT;
END;
/

BEGIN
    genereaza_curse;
    DBMS_OUTPUT.PUT_LINE('Au fost adugate cursele!');
END;
/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE genereaza_trasee IS
    v_nr_magistrala NUMBER;
    v_nr_statii NUMBER;
    v_sens CHAR(1);
    v_nr_ordine NUMBER;
    v_cod_cursa NUMBER;
    v_cod_metrou NUMBER;
    v_data DATE;
BEGIN
    FOR cursa IN (
        SELECT cod_cursa, cod_metrou, data, sens
        FROM CURSE) LOOP
        SELECT nr_magistrala
        INTO v_nr_magistrala
        FROM METROURI
        WHERE cod_metrou = cursa.cod_metrou;

        SELECT COUNT(*)
        INTO v_nr_statii
        FROM STATII
        WHERE nr_magistrala1 = v_nr_magistrala OR nr_magistrala2 = v_nr_magistrala;

        FOR statie IN (
            SELECT cod_statie, 
                   CASE 
                       WHEN nr_magistrala1 = v_nr_magistrala THEN nr_ordine1
                       WHEN nr_magistrala2 = v_nr_magistrala THEN nr_ordine2
                   END AS nr_ordine
            FROM STATII
            WHERE nr_magistrala1 = v_nr_magistrala OR nr_magistrala2 = v_nr_magistrala
            ORDER BY 
                CASE 
                    WHEN cursa.sens = 'A' AND nr_magistrala1 = v_nr_magistrala THEN nr_ordine1
                    WHEN cursa.sens = 'A' AND nr_magistrala2 = v_nr_magistrala THEN nr_ordine2
                    WHEN cursa.sens = 'B' AND nr_magistrala1 = v_nr_magistrala THEN -nr_ordine1 
                    WHEN cursa.sens = 'B' AND nr_magistrala2 = v_nr_magistrala THEN -nr_ordine2 
                END
        ) LOOP

            INSERT INTO TRASEU (cod_cursa, cod_statie, ora)
            VALUES (
                cursa.cod_cursa, 
                statie.cod_statie, 
                cursa.data + 
                CASE 
                    WHEN cursa.sens = 'A' THEN (v_nr_statii - statie.nr_ordine) / (24 * 60)
                    ELSE (statie.nr_ordine - 1) / (24 * 60)
                END
            );
        END LOOP;
    END LOOP;

    COMMIT;
END;
/


BEGIN
    genereaza_trasee;
END;
/

CREATE OR REPLACE PROCEDURE genereaza_validari IS
BEGIN
    FOR i IN 1..600 LOOP
        DECLARE
            v_cod_abonament NUMBER(10);
            v_cod_statie NUMBER(10);
            v_cod_cursa NUMBER(10);
            v_data DATE;
            v_validat NUMBER(1);
            v_data_expirare DATE;
            v_nr_magistrala NUMBER(10);
        BEGIN
            SELECT cod_abonament, data_expirare INTO v_cod_abonament, v_data_expirare
            FROM (
                SELECT cod_abonament, data_expirare
                FROM ABONAMENTE
                ORDER BY DBMS_RANDOM.VALUE
            ) WHERE ROWNUM = 1;

            SELECT cod_statie, 
                   CASE 
                       WHEN nr_magistrala2 IS NOT NULL THEN 
                           CASE 
                               WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN nr_magistrala1
                               ELSE nr_magistrala2
                           END
                       ELSE nr_magistrala1
                   END INTO v_cod_statie, v_nr_magistrala
            FROM (
                SELECT cod_statie, nr_magistrala1, nr_magistrala2
                FROM STATII
                ORDER BY DBMS_RANDOM.VALUE
            ) WHERE ROWNUM = 1;

            SELECT cod_cursa INTO v_cod_cursa
            FROM (
                SELECT c.cod_cursa
                FROM CURSE c
                JOIN METROURI m ON c.cod_metrou = m.cod_metrou
                WHERE m.nr_magistrala = v_nr_magistrala
                ORDER BY DBMS_RANDOM.VALUE
            ) WHERE ROWNUM = 1;

            v_data := TO_DATE('2024-12-18', 'YYYY-MM-DD') + TRUNC(DBMS_RANDOM.VALUE(0, 30));

            IF v_data <= v_data_expirare THEN
                v_validat := 1;
            ELSE
                v_validat := 0;
            END IF;

            INSERT INTO VALIDARI (cod_abonament, cod_statie, cod_cursa, data, validat)
            VALUES (
                v_cod_abonament,
                v_cod_statie,
                v_cod_cursa,
                v_data,
                v_validat
            );
        END;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('S-au generat validarile!');
END;
/

BEGIN
    genereaza_validari;
END;
/