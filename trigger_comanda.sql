--Definiți un un trigger la nivel de comandă pe tabelul CURSE care să nu permit adaugărea sau modificarea unor curse în afara orelor de program. 
--Metroul funcționează de la 6 la ora 22:59. În cazul în care există curse invalide, să se apeleze o excepție.

CREATE OR REPLACE TRIGGER trg_comanda
AFTER INSERT OR UPDATE ON CURSE
DECLARE
    v_nr_invalid NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_nr_invalid
    FROM CURSE
    WHERE TO_CHAR(data, 'HH24:MI') NOT BETWEEN '06:00' AND '22:59';

    IF v_nr_invalid > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cursele sunt permise doar intre orele 6:00 si 22:59.');
    END IF;
END;
/

INSERT INTO CURSE (cod_cursa, cod_metrou, cod_sofer, data, sens)
VALUES (2000, 5, 10, TO_DATE('2025-01-22 23:30', 'YYYY-MM-DD HH24:MI'), 'B');
