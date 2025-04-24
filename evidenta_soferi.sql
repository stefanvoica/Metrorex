--Să se calculeze și să se afișeze numele șoferilor care au condus curse de metrou printr-o anumită stație la o dată specificată.

CREATE OR REPLACE PROCEDURE evidenta_soferi(
    nume_st IN VARCHAR2,
    data_cautare IN DATE
)IS
    exceptie_statie_inexistenta EXCEPTION;
    exceptie_nu_exista_soferi EXCEPTION;
    exceptie_data_invalida EXCEPTION;
    exceptie_nume_statie_invalid EXCEPTION;
    v_count INTEGER;
    CURSOR cursor_soferi IS
        SELECT DISTINCT a.nume, a.prenume
        FROM curse c
        JOIN soferi s ON c.cod_sofer = s.cod_angajat
        JOIN angajati a ON s.cod_angajat = a.cod_angajat
        JOIN traseu t ON c.cod_cursa = t.cod_cursa
        JOIN statii st ON t.cod_statie = st.cod_statie
        WHERE LOWER(st.nume_statie) = LOWER(nume_st)
          AND TRUNC(c.data) = TRUNC(data_cautare);
    r_soferi cursor_soferi%ROWTYPE;
BEGIN
    IF NOT REGEXP_LIKE(nume_st, '^[a-zA-Z]+( [a-zA-Z0-9]+)*$') THEN
        RAISE exceptie_nume_statie_invalid;
    END IF;

    IF data_cautare > SYSDATE THEN
        RAISE exceptie_data_invalida;
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM statii
    WHERE LOWER(statii.nume_statie) = LOWER(nume_st);
    IF v_count = 0 THEN
        RAISE exceptie_statie_inexistenta;
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM curse c
    JOIN traseu t ON c.cod_cursa = t.cod_cursa
    JOIN statii st ON t.cod_statie = st.cod_statie
    WHERE LOWER(st.nume_statie) = LOWER(nume_st)
      AND TRUNC(c.data) = TRUNC(data_cautare);

    IF v_count = 0 THEN
        RAISE exceptie_nu_exista_soferi;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Soferii care au condus pe statia ' || nume_st || ' la data ' || data_cautare || ':');
    OPEN cursor_soferi;
    LOOP
        FETCH cursor_soferi INTO r_soferi;
        EXIT WHEN cursor_soferi%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Sofer: ' || r_soferi.nume || ' ' || r_soferi.prenume);
    END LOOP;
    CLOSE cursor_soferi;
EXCEPTION
    WHEN exceptie_statie_inexistenta THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Statia specificata nu exista.');
    WHEN exceptie_nu_exista_soferi THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Nu exista soferi care sa fi condus metrouri pe aceasta statie la data specificata.');
    WHEN exceptie_data_invalida THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Data introdusa este in viitor si nu poate fi procesata.');
    WHEN exceptie_nume_statie_invalid THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Numele statiei contine caractere invalide.');
    WHEN CURSOR_ALREADY_OPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor deja deschis: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
BEGIN
    evidenta_soferi('Lujerului@123', TO_DATE('2025-01-01', 'YYYY-MM-DD'));
END;
/
BEGIN
    evidenta_soferi('Aviatorilor', TO_DATE('2024-12-15', 'YYYY-MM-DD'));
END;
/
BEGIN
    evidenta_soferi('Universitate', TO_DATE('2025-02-01', 'YYYY-MM-DD'));
END;
/
BEGIN
    evidenta_soferi('IMGB', TO_DATE('2025-01-01', 'YYYY-MM-DD'));
END;
/
BEGIN
    evidenta_soferi('Izvor', TO_DATE('2025-01-08', 'YYYY-MM-DD'));
END;
/
