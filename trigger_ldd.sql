--Definiți un trigger de tip LDD (AFTER DROP OR ALTER ON DATABASE) care să 
--monitorizeze operațiile de tip DROP sau ALTER asupra obiectelor din baza de date.

CREATE TABLE CURSE_TEMP AS SELECT * FROM CURSE;

CREATE TABLE audit_ldd (
    utilizator VARCHAR2(30),
    eveniment VARCHAR2(20),
    nume_obiect VARCHAR2(100),
    data DATE
);
CREATE OR REPLACE TRIGGER trg_ldd
AFTER DROP OR ALTER ON DATABASE
DECLARE
    v_event VARCHAR2(20);
    v_object_name VARCHAR2(100);
BEGIN
    v_event := ORA_SYSEVENT;
    v_object_name := ORA_DICT_OBJ_NAME;

    IF v_object_name = 'CURSE_TEMP' THEN
        DBMS_OUTPUT.PUT_LINE('Operatie LDD detectata pe CURSE_TEMP: ' || v_event);

        INSERT INTO audit_ldd (utilizator, eveniment, nume_obiect, data)
        VALUES (
            SYS_CONTEXT('USERENV', 'SESSION_USER'),
            v_event,
            v_object_name,
            SYSDATE
        );
    END IF;
END;
/
DROP TABLE CURSE_TEMP;
SELECT * FROM audit_ldd;
