# 🚇 Sistem de Gestiune al Rețelei de Metrou din București

Acest proiect are ca scop dezvoltarea unei aplicații pentru simularea sistemului de metrou din București, folosind tehnologii Oracle SQL și PL/SQL. Proiectul modelează cu fidelitate infrastructura urbană a transportului subteran, incluzând magistrale, stații, metrouri, curse, angajați și călători, dar și procesele administrative și operaționale aferente acestora.

---

## 📌 Obiectivele proiectului

- Reprezentarea realistă a rețelei de metrou bucureștene, incluzând traseele, stațiile și mijloacele de transport.
- Gestionarea eficientă a datelor legate de personalul METROREX (șoferi și casieri), precum și de călători.
- Administrarea tipurilor de abonamente și a validărilor aferente acestora.
- Automatizarea procesului de populare a bazei de date cu date sintetice, dar realiste.
- Ilustrarea aplicabilității conceptelor avansate din PL/SQL: colecții, cursoare, funcții, proceduri, triggere și pachete.

---

## 🧩 Funcționalități cheie

- 📊 **Model de date relațional solid**, bazat pe constrângeri de integritate și relații bine definite.
- 🔀 **Generarea automata a datelor** pentru simularea utilizatorilor, traseelor și validărilor.
- 🧠 **Colecții PL/SQL** utilizate pentru analize detaliate: VARRAY, TABLE, TABLE imbricate.
- 🔎 **Cursoare avansate**, inclusiv parametrizate, pentru procesarea datelor agregate.
- ⚙️ **Subprograme stocate** pentru analiză operațională și decizională.
- 🔒 **Gestionarea excepțiilor** standard și personalizate pentru controlul erorilor.
- 🚨 **Triggere** pentru impunerea regulilor de business (ex: restricții orare, număr maxim de metrouri).
- 🛆 **Pachetul `GestionareMetrorex`**, care centralizează logica financiară și operațională a sistemului.

---

## 💠 Tehnologii utilizate

- **SQL & PL/SQL**  
- **Oracle 19c**  
- **Windows 11**

---

## 🧪 Exemple de funcționalități implementate

- `casier_max_profit(data)`: identifică casierul cu cele mai mari încasări într-o anumită zi.
- `utilizare_abonamente(magistrala, interval)`: determină cel mai puțin utilizat tip de abonament într-un interval.
- `analiza_curse(data_start, data_sfarsit)`: oferă o privire de ansamblu asupra curselor efectuate pe magistrale.
- `evidenta_soferi(statie, data)`: afișează lista șoferilor care au condus printr-o anumită stație.
- Pachetul `GestionareMetrorex`: include funcții pentru raportări financiare și statistici operaționale.

---

## 🧐 Competențe dezvoltate prin proiect

- Conceperea și implementarea unei baze de date relaționale complexe.
- Utilizarea eficientă a limbajului PL/SQL pentru automatizare, validare și analiză.
- Integrarea colecțiilor și cursoarelor pentru operații avansate pe date.
- Simularea unui sistem real printr-un design modular, scalabil și realist.

---

## 👤 Autor

**Ștefan-Alexandru Voica**  
Seria 25, Grupa 251  
An universitar: 2024–2025
