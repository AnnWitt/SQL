-- Przed wykonaniem tego skryptu nalezy zalozyc baze danych
--  CREATE TABLE kurs
-- i po zalozeniu tej bazy do niej sie polaczyc

SET NAMES 'utf8';
SET CHARACTER SET utf8;

DROP TABLE IF EXISTS recenzja CASCADE; 
DROP TABLE IF EXISTS statystyka_klienta CASCADE;
DROP TABLE IF EXISTS ocena_ksiazki CASCADE;
DROP TABLE IF EXISTS klient CASCADE;
DROP TABLE IF EXISTS ksiazka CASCADE;
DROP TABLE IF EXISTS rodzaj_ksiazki CASCADE;
DROP TABLE IF EXISTS klient_archiwalny CASCADE; 


CREATE TABLE klient (
	klient_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	imie                CHAR(100),
	nazwisko            CHAR(100),
	rok_urodzenia       DATE,
	plec                CHAR(1),
	data_zalozenia      DATE,
	id_polecony_przez	BIGINT,
	FOREIGN KEY (id_polecony_przez) REFERENCES klient(klient_id)
);

CREATE TABLE klient_archiwalny (
	klient_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	imie                CHAR(100),
	nazwisko            CHAR(100)
);

CREATE TABLE rodzaj_ksiazki (
	rodzaj  VARCHAR(100) PRIMARY KEY
);


CREATE TABLE ksiazka (
	ksiazka_id        BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rodzaj            VARCHAR(100),	
	autor_imie        CHAR(100),
	autor_nazwisko    CHAR(100), 
	tytul             CHAR(200) NOT NULL,
	min_wiek          INT,
	FOREIGN KEY (rodzaj) REFERENCES rodzaj_ksiazki(rodzaj)
);

CREATE TABLE statystyka_klienta (
	klient_id						INT8 NOT NULL,				
	liczba_przeczytanych_ksiazek	INT,
    FOREIGN KEY (klient_id) REFERENCES klient(klient_id)
);

CREATE TABLE recenzja (
	recenzja_id		BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ksiazka_id 		INT8,
	recenzja_tekst	VARCHAR(300), 
	klient_id   	INT8  NOT NULL,
    FOREIGN KEY (ksiazka_id) REFERENCES ksiazka(ksiazka_id),
    FOREIGN KEY (klient_id) REFERENCES klient (klient_id)
    
);

CREATE TABLE ocena_ksiazki (
	ksiazka_id  INT8 NOT NULL,
	klient_id   INT8 NOT NULL,
	ocena       INT,
	FOREIGN KEY (ksiazka_id) REFERENCES ksiazka (ksiazka_id),
    FOREIGN KEY (klient_id) REFERENCES klient (klient_id)
);

ALTER TABLE ocena_ksiazki
  ADD CONSTRAINT ocena_ksiazki_pkey PRIMARY KEY(ksiazka_id,klient_id);

-- DANE
INSERT INTO klient (imie, nazwisko, rok_urodzenia, plec, data_zalozenia, id_polecony_przez) VALUES 
('Jacek',     'Szyma??ski', '1970-01-01', 'M', '2014-01-01', NULL),
('Jan',        'Kowalski',  '1980-01-01', 'M', '2014-01-10', 1),
('Franciszek', 'Kowalczyk', '1981-01-01', 'M', '2014-01-10', 1),
('Joanna',     'Nowak',     '2000-02-01', 'K', '2014-01-10', 1),
('Tadeusz',    'Nowak',     '1972-01-01', 'M', '2014-01-10', 2),
('Jacek',     'Szyma??ski', '1950-01-01', 'M', '2014-01-01', 2);	

INSERT INTO klient_archiwalny (imie, nazwisko) VALUES
('Jan', 'Kowalski'),
('Tymon', 'Adamowicz'),
('Francziszek', 'Adamczyk')
;


INSERT INTO rodzaj_ksiazki (rodzaj) VALUES
('Historyczna'),
('SF'),
('Biografia'),
('Bajki');

INSERT INTO ksiazka (ksiazka_id, rodzaj, autor_imie, autor_nazwisko, tytul, min_wiek) VALUES 
(1, 'Historyczna',  'W??adys??aw', 'Bartoszewski', '1859 dni Warszawy', 12),
(2, 'Historyczna',  'W??adys??aw', 'Bartoszewski', 'M??j Auschwitz', 12),
(3, 'Historyczna',  'W??adys??aw', 'Bartoszewski', 'Powstanie Warszawskie', 12),
(4, 'Bajki', 'Adam', 'Mickiewicz', 'Bajki', 3),
(5, 'Bajki', 'Jan', 'Brzechwa', 'Bajki', 3),
(6, 'Bajki', 'Marta', 'Berowska', 'Bajki polskie', 3),
(7, 'SF', 'Stanis??aw', 'Lem', 'Bajki robot??w', 12),
(8, 'SF', 'Janusz', 'Zajdel', 'Paradyzja', 18),
(9, 'SF', 'Janusz', 'Zajdel', 'Limes inferior', 18),
(10,'Biografia', 'Gustaw', 'Helling-Grudzi??ski', 'Inny ??wiat',12),
(11,'Biografia', 'Walter',  'Isaacson', 'Steve Jobs', 12),
(12,'Biografia', 'Stanis??aw', 'Grzesiuk', 'Na marginesie ??ycia', 18),
(13,'Biografia', 'Stanis??aw', 'Grzesiuk', 'Pi???? lat kacetu',18),
(14,'Biografia', 'J??zef', 'Hen', 'Najpi??kniejsze lata',12);



INSERT INTO ocena_ksiazki ( ksiazka_id, klient_id, ocena ) 
VALUES 
(2,1,4), (3,1,10), (4,1,5), (5,1,10),

(2,2,4), (3,2,5), (6,2,5), (10,2,10),

(2,3,4),(3,3,3),(6,3,4),(10,3,5),

(1,4,4),(3,4,5),(4,4,6),(8,4,7),(11,4,8),(12,4,0),

(1,5,3),(2,5,2),(3,5,3),(4,5,5),(5,5,5),(6,5,3),(7,5,4),(8,5,5),(9,5,6),(10,5,8),(11,5,7),(12,5,8);

INSERT INTO  recenzja (	ksiazka_id, recenzja_tekst, klient_id) 
VALUES
(1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas tempor pulvinar. Etiam a pulvinar ipsum. Praesent aliquet neque luctus nibh luctus faucibus. Morbi venenatis et libero in dictum. Viva', 1),
(1,'Senectus et netus et malesuada fames ac turpis egestas. Aliquam vehicula, diam ut porttitor eleifend, libero sapien aliquet felis, sed volutpat erat lorem sit amet orci. Nulla velit nulla, tincidunt id nunc non, adipiscing dictum velit. Vestibulum dapibus turpis ac nibh blandit, int', 1),
(2,'Duis vitae convallis neque, nec sollicitudin dolor. Vestibulum id sodales nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam interdum aliquet purus, et porttitor ligula faucibus et. Phasellus vitae libero blandit, euis',2),
(2,'A ac dictum congue, neque justo tincidunt lacus, at malesuada nulla tellus vitae magna. In in eros rhoncus, viverra mauris a, blandi',2),
(3,'Neque justo tincidunt lacus, at malesuada nulla tellus vitae magna. In in eros rhoncus, viverra mauris a, blandi',2),
(4,'Duis vitae convallis neque, nec sollicitudin dolor. Vestibulum id sodales nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam interdum aliquet purus, et porttitor ligula faucibus et. Phasellus vitae libero blandit, euismod m',3),
(5,'??wietna!',2);

INSERT INTO statystyka_klienta ( klient_id,	liczba_przeczytanych_ksiazek) VALUES
(1,100),
(2,20),
(3,23),
(4,44),
(5,55),
(6,35);


