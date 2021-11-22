-- ========== 2.1 NULL ===========
-- recenzje niepowiazane z książką (błędne wiersze)
SELECT * FROM recenzja  WHERE ksiazka_id IS NULL;

-- wszystkie recenzje gdzie jest ustawione id ksiazki
SELECT * FROM recenzja  WHERE ksiazka_id IS NOT NULL;

-- ============= 2.1 Ostrożnie z NULL ==============
SELECT * FROM recenzja;  -- 7 recenzji 
UPDATE recenzja SET ksiazka_id=NULL WHERE recenzja_id=1;

SELECT count(distinct ksiazka_id) FROM recenzja;  -- 5
SELECT count(distinct ksiazka_id) FROM recenzja WHERE ksiazka_id IS NOT NULL; -- mamy tyle samo wierszy co w poprzednim zapytaniu
SELECT distinct  ksiazka_id FROM recenzja; -- a tu niespodzianka o jeden wiecej wiersz! Count nie zlicza NULL

 

-- wynik takiego przyrównania jest też nullem
SELECT null =  10;
SELECT null = null  -- przyrównanie do NULL zawsze zwraca wartość nieznaną 
SELECT null OR true

-- ================== 2.2 JOIN ================
-- wyświetlenie książek z recenzjami
SELECT * FROM ksiazka k, recenzja r
 WHERE k.ksiazka_id = r.ksiazka_id;
 
-- równoważne z 
SELECT * FROM ksiazka k INNER JOIN 
 recenzja r ON k.ksiazka_id = r.ksiazka_id;

-- natural
SELECT * FROM ksiazka k NATURAL JOIN recenzja   

-- USING
SELECT ksiazka.tytul, recenzja.recenzja_tekst 
FROM ksiazka   JOIN recenzja  USING (ksiazka_id)

-- JOIN z dodatkowymi warunkami
SELECT *  FROM ksiazka k INNER JOIN  recenzja r ON 
k.ksiazka_id = r.ksiazka_id WHERE k.min_wiek>3

-- albo, równoważny zapis
SELECT * FROM ksiazka k INNER JOIN 
 recenzja r ON k.ksiazka_id = r.ksiazka_id AND min_wiek>3

-- złączenie może być wielokrotne
SELECT kl.imie, kl.nazwisko, ks.autor_imie, 
ks.autor_nazwisko, ks.tytul, ok.ocena 
FROM klient kl JOIN ocena_ksiazki ok ON kl.klient_id=ok.klient_id
JOIN ksiazka ks ON ks.ksiazka_id = ok.ksiazka_id;
-- albo
SELECT kl.imie, kl.nazwisko, ks.autor_imie, 
ks.autor_nazwisko, ks.tytul, ok.ocena 
FROM klient kl NATURAL JOIN ocena_ksiazki ok 
NATURAL JOIN ksiazka ks;

-- Ćwiczenia
-- Wyświetlić recenzje stworzone przez klientów tak żeby były
--  również informacje o kliencie i sama treść recenzji
 R:  
 SELECT *  FROM klient  JOIN recenzja USING (klient_id);
 albo 
 SELECT * FROM klient k JOIN recenzja r ON k.klient_id=r.klient_id

-- Wyświetlić recenzje klienta ale również żeby była statystykę klienta (tablica ze statystyką) tak żeby były informacje o kliencie w wierszu
R: 
 SELECT * FROM klient k JOIN recenzja r 
 ON k.klient_id=r.klient_id 
 JOIN statystyka_klienta sk ON k.klient_id = sk.klient_id
  
-- ============== 2.3 LEFT/RIGHT
-- Wyswietlenie książek z recenzjami (również tych z brakiem recenzji)
SELECT ksiazka.*, recenzja.*  FROM ksiazka
 LEFT JOIN recenzja USING (ksiazka_id);

-- albo
SELECT ksiazka.*, recenzja.*  FROM 
recenzja RIGHT JOIN ksiazka USING (ksiazka_id);

-- Ćwiczenia
-- Wyświetlić wszystkie recenzje wystawione przez klientów 
-- jeśli klient nie wystawił recenzji to powinnien być wiersz z danymi klienta
R: 
  SELECT klient.*, recenzja.* FROM klient 
  LEFT JOIN recenzja USING (klient_id)

-- ================== 2.4 AGREGUJACE =============
-- wyświetlenie ile jest książek danego autora
SELECT autor_imie,autor_nazwisko,COUNT(*) AS ilosc  
FROM ksiazka
GROUP BY autor_imie,autor_nazwisko;

-- wyświetlenie ile jest książek danego autora, ale wyświetlaj tylko tych autorów którzy mają więcej niż jedną książke
SELECT autor_imie,autor_nazwisko,COUNT(*) FROM ksiazka
GROUP BY autor_imie,autor_nazwisko 
HAVING COUNT(*)>1;

-- średnia wszystkich ocen 
SELECT AVG(ocena) FROM ocena_ksiazki;

-- minimalna ocena 
SELECT MIN(ocena) FROM ocena_ksiazki;

-- maksymalna ocena 
SELECT MAX(ocena) FROM ocena_ksiazki;

-- count 
SELECT count(*) FROM klient WHERE plec='M'

-- ćwiczenia
-- wyświetlić ilość książek w dla każdego rodzaju 
R:
 SELECT rodzaj, count(*) FROM ksiazka GROUP BY rodzaj;

-- wyświetlić klientów z informacją o ilości wystawionych
--  ocen

R:
 SELECT k.klient_id,imie, nazwisko, count(*) as ILOSC
 FROM klient k LEFT JOIN  ocena_ksiazki o  
 ON k.klient_id=o.klient_id 
 GROUP BY k.klient_id

-- potencjalnie mozna tez tak ale niestety będzie błąd bo mamy dwóch 
-- klientów o nazwisku Jacek Szymański
 SELECT imie, nazwisko, count(*) as ILOSC
 FROM klient k LEFT JOIN  ocena_ksiazki o  
 ON k.klient_id=o.klient_id 
 GROUP BY imie, nazwisko

-- ============ 2.5 Podzapytanie (WHERE) ================
-- Wyświetlenie klientów którzy przeczytali więcej niż 50 książek
SELECT * FROM klient 
WHERE klient_id IN 
     (SELECT  klient_id FROM statystyka_klienta
     WHERE liczba_przeczytanych_ksiazek>50);


-- Wyświetlenie klientów którzy przeczytali więcej niż 50 książek 
-- i wystawili chociaż jedną ocenę większą od 5
SELECT * FROM klient 
WHERE klient_id IN 
 (SELECT  klient_id FROM statystyka_klienta WHERE 
   liczba_przeczytanych_ksiazek>50)
AND 
  klient_id IN (SELECT klient_id FROM ocena_ksiazki WHERE ocena>5);

-- Ćwiczenia
-- wyświetlić książki które mają przynajmniej jedną recenzje z użyciem
-- podzapytania
R:
  SELECT * FROM ksiazka WHERE ksiazka_id IN 
  (SELECT ksiazka_id FROM recenzja);

-- Wyświetlić książkę (jest jedna) które ma recenzję z tekstem 'Świetna!'
R:
 SELECT * FROM ksiazka WHERE ksiazka_id IN
 (SELECT ksiazka_id FROM recenzja WHERE recenzja_tekst='Świetna!');

-- ============ 2.6 Podzapytanie (w SELECT) ================
-- wyswietlenie dane klienta  i w dodatkowej kolumnie wyswietlenie
-- ilosci przeczytanych ksiazek dla klienta o ID=2 (uzyc subquery)

SELECT *, (SELECT liczba_przeczytanych_ksiazek FROM statystyka_klienta
 WHERE klient_id=2) as statystyka  FROM klient;

SELECT klient.* FROM klient;

-- wyswietlenie dane klienta  i w dodatkowej kolumnie wyswietlenie 
-- ilosc wystawionych ocen
SELECT k.*, (SELECT count(*) FROM ocena_ksiazki o WHERE
  k.klient_id=o.klient_id) FROM klient k;

-- ćwiczenia
-- wyświetlić imie,nazwisko autora i tytul a w ostatniej kolumnie 
-- ilość wystawionych recenzji (uzyc podzapytanie)
R:
SELECT k.autor_imie, k.autor_nazwisko, k.tytul, 
(SELECT count(*) FROM recenzja r WHERE r.ksiazka_id=k.ksiazka_id) 
FROM ksiazka k;


-- Wyświetlić wszystkie oceny ksiazki 'Powstanie Warszawskie' (użyć join)
-- w ostatniej kolumnie maksymalną ocenę jaka dostała książka 

R:
SELECT *, (SELECT max(o.ocena) FROM ocena_ksiazki o WHERE o.ksiazka_id=k.ksiazka_id) 
FROM ksiazka k JOIN ocena_ksiazki o ON o.ksiazka_id=k.ksiazka_id
WHERE 
 k.tytul='Powstanie Warszawskie'


-- ================= Ćwiczenia - Podsumowanie SQL ======================
-- =============> cwiczenie8_ksiazki_opcjonalne.sql