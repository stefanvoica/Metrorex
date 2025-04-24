CREATE TABLE MAGISTRALE
 (
 nr_magistrala NUMBER(10) PRIMARY KEY,
 statie_inceput NUMBER(10) NOT NULL,
 statie_sfarsit NUMBER(10) NOT NULL,
 culoare VARCHAR2(50) NOT NULL,
 CHECK (statie_inceput <> statie_sfarsit),
 UNIQUE (culoare)
 );

CREATE TABLE STATII
 (
 cod_statie NUMBER(10) PRIMARY KEY,
 nume_statie VARCHAR2(100) NOT NULL,
 nr_iesiri NUMBER(5) NOT NULL CHECK (nr_iesiri > 0),
 nr_magistrala1 NUMBER(10),
 nr_magistrala2 NUMBER(10),
 nr_ordine1 NUMBER(5) CHECK (nr_ordine1 > 0),
 nr_ordine2 NUMBER(5) CHECK (nr_ordine2 > 0),
 peron CHAR(1) NOT NULL CHECK (peron IN ('S', 'D')),
 UNIQUE (nume_statie)
 );
ALTER TABLE MAGISTRALE
ADD CONSTRAINT fk_statie_inceput FOREIGN KEY (statie_inceput)
REFERENCES STATII(cod_statie);

ALTER TABLE MAGISTRALE
ADD CONSTRAINT fk_statie_sfarsit FOREIGN KEY (statie_sfarsit)
REFERENCES STATII(cod_statie);
CREATE TABLE METROURI
 (
 cod_metrou NUMBER(10) PRIMARY KEY,
 nume VARCHAR2(50) NOT NULL,
 nr_magistrala NUMBER(10) NOT NULL,
 an_fabricatie NUMBER(4) NOT NULL,
 cost_intretinere DECIMAL(10, 2) NOT NULL CHECK (cost_intretinere >= 0),
 FOREIGN KEY (nr_magistrala) REFERENCES MAGISTRALE(nr_magistrala)
 );
CREATE TABLE CALATORI
 (
 cod_calator NUMBER(10) PRIMARY KEY,
 nume VARCHAR2(50) NOT NULL,
 prenume VARCHAR2(50) NOT NULL,
 data_nasterii DATE NOT NULL,
 telefon VARCHAR2(20) NOT NULL CHECK (LENGTH(telefon) >= 10),
 email VARCHAR2(100) NOT NULL CHECK (email LIKE '%@%')
 );

CREATE TABLE TIPURI_ABONAMENTE (
    tip_ab NUMBER(5) PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL,
    pret DECIMAL(10, 2) NOT NULL CHECK (pret >= 0),
    durata NUMBER(5) NOT NULL,  
    UNIQUE (nume)
);
CREATE TABLE ABONAMENTE (
 cod_abonament NUMBER(10) PRIMARY KEY,
 tip_abonament NUMBER(5) NOT NULL,
 cod_calator NUMBER(10) NOT NULL,
 cod_casier NUMBER(10) NOT NULL,
 data_activare DATE NOT NULL,
 data_expirare DATE NOT NULL,
 FOREIGN KEY (tip_abonament) REFERENCES TIPURI_ABONAMENTE(tip_ab),
 FOREIGN KEY (cod_calator) REFERENCES CALATORI(cod_calator),
 FOREIGN KEY (cod_casier) REFERENCES CASIERI(cod_angajat)
);
CREATE TABLE ANGAJATI
 (
 cod_angajat NUMBER(10) PRIMARY KEY,
 nume VARCHAR2(50) NOT NULL,
 prenume VARCHAR2(50) NOT NULL,
 data_nasterii DATE NOT NULL,
 salariu DECIMAL(10, 2) NOT NULL CHECK (salariu > 0),
 telefon VARCHAR2(20) NOT NULL CHECK (LENGTH(telefon) >= 10),
 email VARCHAR2(100) NOT NULL CHECK (email LIKE '%@%')
);
CREATE TABLE SOFERI
 (
 cod_angajat NUMBER(10) PRIMARY KEY,
 experienta NUMBER(3) NOT NULL CHECK (experienta >= 0),
 FOREIGN KEY (cod_angajat) REFERENCES ANGAJATI(cod_angajat)
 );
CREATE TABLE CASIERI
 (
 cod_angajat NUMBER(10) PRIMARY KEY,
 limba VARCHAR2(50) NOT NULL CHECK (limba IS NOT NULL AND TRIM(limba) <> '' AND LENGTH(TRIM(limba)) > 0),
 FOREIGN KEY (cod_angajat) REFERENCES ANGAJATI(cod_angajat)
 );
CREATE TABLE CURSE
 (
 cod_cursa NUMBER(10) PRIMARY KEY,
 cod_metrou NUMBER(10) NOT NULL,
 cod_sofer NUMBER(10) NOT NULL,
 data DATE NOT NULL,
 sens CHAR(1) NOT NULL CHECK (sens IN ('A', 'B')),
 FOREIGN KEY (cod_metrou) REFERENCES METROURI(cod_metrou),
 FOREIGN KEY (cod_sofer) REFERENCES SOFERI(cod_angajat)
 );
CREATE TABLE TRASEU
 (
 cod_cursa NUMBER(10) NOT NULL,
 cod_statie NUMBER(10) NOT NULL,
 ora DATE NOT NULL,
 PRIMARY KEY (cod_cursa, cod_statie),
 FOREIGN KEY (cod_cursa) REFERENCES CURSE(cod_cursa),
 FOREIGN KEY (cod_statie) REFERENCES STATII(cod_statie)
 );
CREATE TABLE VALIDARI
 (
  cod_abonament NUMBER(10) NOT NULL,
  cod_statie NUMBER(10) NOT NULL,
  cod_cursa NUMBER(10) NOT NULL,
  data DATE NOT NULL,
  validat NUMBER(1) NOT NULL CHECK (validat IN (0, 1)),
  PRIMARY KEY (cod_abonament, cod_statie, cod_cursa, data),
  FOREIGN KEY (cod_abonament) REFERENCES ABONAMENTE(cod_abonament),
  FOREIGN KEY (cod_statie) REFERENCES STATII(cod_statie),
  FOREIGN KEY (cod_cursa) REFERENCES CURSE(cod_cursa)
 );
