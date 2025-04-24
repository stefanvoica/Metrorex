--Scrieți un subprogram stocat (procedură) care să determine pentru o magistrală specificată și un interval de timp dat:
--1.	Tipul de abonament cel mai puțin utilizat în stațiile asociate magistralei respective în perioada specificată.
--2.	Numărul total de utilizări ale fiecărui tip de abonament.
--3.	Lista clienților care au utilizat fiecare tip de abonament.


CREATE OR REPLACE PROCEDURE utilizare_abonamente (
    p_nr_magistrala IN MAGISTRALE.nr_magistrala%TYPE,
    p_data_inceput IN DATE,
    p_data_sfarsit IN DATE
) IS
    TYPE VarrayTipuriAbonamente IS VARRAY(5) OF VARCHAR2(20);
    TYPE TableNrUtilizari IS TABLE OF NUMBER;
    TYPE TableClienti IS TABLE OF VARCHAR2(100);
    TYPE TableClientiImbricate IS TABLE OF TableClienti;

    tipuri_abonamente VarrayTipuriAbonamente := VarrayTipuriAbonamente(
        'Abonament 24 ore', 
        'Abonament 72 ore', 
        'Abonament saptamanal', 
        'Abonament lunar', 
        'Abonament anual'
    );
    utilizari_abonamente TableNrUtilizari := TableNrUtilizari();
    clienti_tip TableClientiImbricate := TableClientiImbricate();
    clienti_aux TableClienti := TableClienti();
    min_utilizari NUMBER := NULL;

BEGIN
    utilizari_abonamente.EXTEND(tipuri_abonamente.COUNT);
    clienti_tip.EXTEND(tipuri_abonamente.COUNT);

    FOR i IN 1..tipuri_abonamente.COUNT LOOP
        utilizari_abonamente(i) := 0;
        clienti_tip(i) := TableClienti();
    END LOOP;

    FOR i IN 1..tipuri_abonamente.COUNT LOOP
        SELECT COUNT(*)
        INTO utilizari_abonamente(i)
        FROM VALIDARI v
        JOIN ABONAMENTE a ON v.cod_abonament = a.cod_abonament
        JOIN TIPURI_ABONAMENTE t ON a.tip_abonament = t.tip_ab
        WHERE t.nume = tipuri_abonamente(i)
          AND v.cod_statie IN (
              SELECT cod_statie
              FROM STATII
              WHERE nr_magistrala1 = p_nr_magistrala OR nr_magistrala2 = p_nr_magistrala
          )
          AND v.data BETWEEN p_data_inceput AND p_data_sfarsit;

        IF min_utilizari IS NULL OR utilizari_abonamente(i) < min_utilizari THEN
            min_utilizari := utilizari_abonamente(i);
        END IF;

        SELECT DISTINCT c.nume || ' ' || c.prenume
        BULK COLLECT INTO clienti_aux
        FROM VALIDARI v
        JOIN ABONAMENTE a ON v.cod_abonament = a.cod_abonament
        JOIN CALATORI c ON a.cod_calator = c.cod_calator
        JOIN TIPURI_ABONAMENTE t ON a.tip_abonament = t.tip_ab
        WHERE t.nume = tipuri_abonamente(i)
          AND v.cod_statie IN (
              SELECT cod_statie
              FROM STATII
              WHERE nr_magistrala1 = p_nr_magistrala OR nr_magistrala2 = p_nr_magistrala
          )
          AND v.data BETWEEN p_data_inceput AND p_data_sfarsit;

        clienti_tip(i) := clienti_aux;
    END LOOP;

    FOR i IN 1..tipuri_abonamente.COUNT LOOP
        IF utilizari_abonamente(i) = min_utilizari THEN
            DBMS_OUTPUT.PUT_LINE('Tip abonament: ' || tipuri_abonamente(i));
            DBMS_OUTPUT.PUT_LINE('Numar utilizari: ' || utilizari_abonamente(i));
            DBMS_OUTPUT.PUT_LINE('Clienti:');
            FOR j IN 1..clienti_tip(i).COUNT LOOP
                DBMS_OUTPUT.PUT_LINE(' - ' || clienti_tip(i)(j));
            END LOOP;
        END IF;
    END LOOP;
END;
/
BEGIN
    utilizare_abonamente(
        p_nr_magistrala => 2,
        p_data_inceput => TO_DATE('2024-12-30', 'YYYY-MM-DD'),
        p_data_sfarsit => TO_DATE('2025-01-02', 'YYYY-MM-DD')
    );
END;
/
