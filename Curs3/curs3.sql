-- Trebuie să creați un script pentru crearea bazei de date: online_store
-- Acest script va șterge baza de date existentă dacă există.

DROP DATABASE IF EXISTS online_store;

CREATE DATABASE online_store;

USE online_store;

-- Trebuie creat un script pentru a crea tabelul computer_parts 
-- Acest tabel ar trebui să conțină informații despre
-- ID-ul dispozitivului
-- Cheie primară, se autoincrementează
CREATE TABLE computer_parts( id INT PRIMARY KEY AUTO_INCREMENT,
-- codul dispozitivului
-- este format din maxim 5 caractere
		cod VARCHAR(5),
-- tipul dispozitivului
-- default 'Electronic'
	   tip VARCHAR(255) default 'Electronic',
-- numele dispozitivului
-- unic , not null
        nume VARCHAR(255) UNIQUE NOT NULL,
-- prețul dispozitivului.
-- are maxim 7 cifre, și 2 după virgulă
		pret DECIMAL(9, 2));
        
INSERT INTO  computer_parts SET cod = "12345", nume="telefon", pret=1000;
SELECT * FROM computer_parts;





