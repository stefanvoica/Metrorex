--Se dorește să se determine numărul total de curse care au avut loc într-o perioadă specificată pe metrourile unei magistrale. Pentru fiecare magistrală, să se afișeze:
--1.	Numărul magistralei și culoarea.
--2.	Numărul total de curse din perioada specificată.
--3.	Lista metrourilor care au efectuat curse și numărul lor de curse.

CREATE OR REPLACE PROCEDURE analiza_curse(
    p_data_inceput DATE,
    p_data_sfarsit DATE
) AS
    CURSOR curs_magistrale IS
        SELECT nr_magistrala, culoare,
               CURSOR (
                   SELECT c.cod_metrou, COUNT(c.cod_cursa) AS nr_curse
                   FROM curse c
                   JOIN metrouri m ON c.cod_metrou = m.cod_metrou
                   WHERE m.nr_magistrala = mag.nr_magistrala
                     AND c.data BETWEEN p_data_inceput AND p_data_sfarsit
                   GROUP BY c.cod_metrou
               ) AS metrou_cursor
        FROM magistrale mag;

    v_magistrala magistrale%ROWTYPE;
    v_metrou_cursor SYS_REFCURSOR;
    v_metrou metrouri%ROWTYPE;
    v_nr_curse NUMBER;
    v_total_curse NUMBER;
BEGIN
    OPEN curs_magistrale;
    LOOP
        FETCH curs_magistrale INTO v_magistrala.nr_magistrala, v_magistrala.culoare, v_metrou_cursor;
        EXIT WHEN curs_magistrale%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Magistrala: ' || v_magistrala.nr_magistrala || ', Culoare: ' || v_magistrala.culoare);
        DBMS_OUTPUT.PUT_LINE('Curse detaliate pe metrouri:');

        v_total_curse := 0;

        LOOP
            FETCH v_metrou_cursor INTO v_metrou.cod_metrou, v_nr_curse;
            EXIT WHEN v_metrou_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('- Metrou: ' || v_metrou.cod_metrou || ', Curse efectuate: ' || v_nr_curse);
            v_total_curse := v_total_curse + v_nr_curse;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Total curse pe magistrala: ' || v_total_curse);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
    END LOOP;
    CLOSE curs_magistrale;
END;
/

BEGIN
    analiza_curse(TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
END;
/
