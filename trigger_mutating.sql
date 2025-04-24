--Definiți un trigger care să limiteze numărul maxim de metrouri pe o magistrală la 5.

CREATE OR REPLACE TRIGGER trg_mutating_metrouri
BEFORE UPDATE OR INSERT ON METROURI
FOR EACH ROW
DECLARE
    v_total_metrouri NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total_metrouri
    FROM METROURI
    WHERE nr_magistrala = :NEW.nr_magistrala;

    IF v_total_metrouri > 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nu pot exista mai mult de 5 metrouri pe o magistrala!');
    END IF;
END;
/

UPDATE METROURI
SET nr_magistrala = 2
WHERE cod_metrou = 1000;

--Rezolvare eroare:
--Definiți un pachet și două declanșatoare care să limiteze numărul maxim de metrouri pe o magistrală la 5. 
--Declanșatorul la nivel de comandă actualizează o colecție din pachet, iar cel la nivel de linie verifică și blochează modificările care încalcă această regulă.



CREATE OR REPLACE PACKAGE pkg_validari_metrouri AS
    TYPE rec_magistrala IS RECORD (
        nr_magistrala MAGISTRALE.nr_magistrala%TYPE,
        nr_metrouri NUMBER
    );
    TYPE tab_magistrala IS TABLE OF rec_magistrala INDEX BY PLS_INTEGER;
    t_magistrale tab_magistrala;
END;
/

CREATE OR REPLACE TRIGGER trigg_comanda_metrouri
AFTER INSERT OR UPDATE OR DELETE ON METROURI
BEGIN
    SELECT nr_magistrala, COUNT(*) 
    BULK COLLECT INTO pkg_validari_metrouri.t_magistrale
    FROM METROURI
    GROUP BY nr_magistrala;
END;
/

CREATE OR REPLACE TRIGGER trigg_linie_metrouri
BEFORE INSERT OR UPDATE OF nr_magistrala ON METROURI
FOR EACH ROW
DECLARE
    v_nr_metrouri NUMBER := 0;
BEGIN
    FOR i IN 1..pkg_validari_metrouri.t_magistrale.COUNT LOOP
        IF :NEW.nr_magistrala = pkg_validari_metrouri.t_magistrale(i).nr_magistrala THEN
            v_nr_metrouri := pkg_validari_metrouri.t_magistrale(i).nr_metrouri + 1;
            EXIT;
        END IF;
    END LOOP;

    IF v_nr_metrouri > 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numărul de metrouri pe magistrală a depășit limita de 5.');
    END IF;
END;
/
INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (1002, 'MetrouTest', 1, 2022, 1500);

INSERT INTO METROURI (cod_metrou, nume, nr_magistrala, an_fabricatie, cost_intretinere)
VALUES (1009, 'MetrouTest', 1, 2022, 1500);
UPDATE METROURI
SET nr_magistrala = 2
WHERE cod_metrou = 1001;
rollback;
select * from metrouri;
