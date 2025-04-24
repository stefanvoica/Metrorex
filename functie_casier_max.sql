--Să se creeze o funcție stocată care determină casierul care a obținut cele mai mari încasări din vânzarea abonamentelor într-o zi specificată. Funcția primește ca parametru data vânzării 
--și returnează numele și prenumele casierului. În cazul în care mai mulți casieri au aceeași sumă maximă de încasări, funcția va genera o eroare. Funcția trebuie să trateze următoarele cazuri:
--1.	Data de vânzare este în viitor 
--2.	Nu există înregistrări pentru data specificată.
--3.	Mai mulți casieri cu aceeași sumă maximă.
    
CREATE OR REPLACE FUNCTION casier_max_profit(data_vanzare IN DATE)
RETURN VARCHAR2 IS
    rezultat VARCHAR2(100);
    max_suma NUMBER;
BEGIN
    IF data_vanzare > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20007, 'Data de vanzare este in viitor.');
    END IF;

    SELECT MAX(total_profit)
    INTO max_suma
    FROM (
        SELECT SUM(ta.pret) AS total_profit
        FROM abonamente ab
        JOIN tipuri_abonamente ta ON ab.tip_abonament = ta.tip_ab
        JOIN angajati ang ON ab.cod_casier = ang.cod_angajat
        WHERE TRUNC(ab.data_activare) = TRUNC(data_vanzare)
        GROUP BY ang.nume, ang.prenume
    );

    SELECT nume || ' ' || prenume
    INTO rezultat
    FROM (
        SELECT ang.nume, ang.prenume, SUM(ta.pret) AS total_profit
        FROM abonamente ab
        JOIN tipuri_abonamente ta ON ab.tip_abonament = ta.tip_ab
        JOIN angajati ang ON ab.cod_casier = ang.cod_angajat
        WHERE TRUNC(ab.data_activare) = TRUNC(data_vanzare)
        GROUP BY ang.nume, ang.prenume
        HAVING SUM(ta.pret) = max_suma
    );

    RETURN rezultat;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'Nu exista inregistrari pentru casieri sau abonamente.');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Exista mai multi casieri cu aceeasi suma maxima.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'A aparut o eroare neasteptata: ' || SQLERRM);
END;
/


SELECT ang.cod_angajat AS cod_casier, ang.nume || ' ' || ang.prenume AS casier, SUM(ta.pret) AS total_incasari
FROM abonamente ab
JOIN tipuri_abonamente ta ON ab.tip_abonament = ta.tip_ab
JOIN angajati ang ON ab.cod_casier = ang.cod_angajat
WHERE TRUNC(ab.data_activare) = TO_DATE('2025-01-01', 'YYYY-MM-DD')
GROUP BY ang.cod_angajat, ang.nume, ang.prenume
ORDER BY total_incasari DESC;

INSERT INTO ABONAMENTE(cod_abonament, tip_abonament, cod_calator, cod_casier, data_activare, data_expirare)
VALUES (601, 5, 1, 27, TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'));

INSERT INTO ABONAMENTE(cod_abonament, tip_abonament, cod_calator, cod_casier, data_activare, data_expirare)
VALUES (602, 5, 1, 103, TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'));
SELECT casier_max_profit(TO_DATE('2024-12-25', 'YYYY-MM-DD')) AS casier_maxim FROM DUAL;
SELECT casier_max_profit(TO_DATE('2024-12-27', 'YYYY-MM-DD')) AS casier_maxim FROM DUAL;
