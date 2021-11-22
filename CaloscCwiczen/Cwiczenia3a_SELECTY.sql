-- Operacje SELECT
-- 1. Wyswietl wszystkie kolumny i wszystkie wiersze z tabeli klient_archiwalny
Select * from klient_archiwalny;
-- 2. Wyswietl kolumne imie dla wszystkich wierszy z tabeli klient_archiwalny
Select imie from klient_archiwalny;
-- 3. Wyswietl kolumne imie dla wszystkich wierszy z tabeli klient_archiwalny
--  ale zmien nazwe kolumne imie na imie_klienta
Select imie as imie_klienta from klient_archiwalny;

-- 4. Wyswietl kolumne imie i nazwisko z tabeli klient i posortuj wiersze po 
--    nazwisko, imie w kolejnosci alfabetycznej

Select imie, nazwisko from klient order by nazwisko,imie asc;

-- 4. Wyswietl kolumne imie i nazwisko z tabeli klient i posortuj wiersze po 
--    nazwisko, imie ale nazwisko w kolejnosci alfabetycznej a imie odwrotnej kolejnosci
--    alfabetycznej

Select imie, nazwisko from klient order by nazwisko asc ,imie desc;

-- 5. Wyswietl liste klientow ktorzy sa mezczyznami

Select * from klient where plec="M";

-- 6. Wyswietl liste klientow ktorzy urodzili sie po 1980-01-01
Select * from klient where rok_urodzenia>"1980-01-01";
-- 7. Wyswietl liste klientow ktorzy urodzili sie po 1980-01-01 o ktorzy sa mezczyznami
Select * from klient where rok_urodzenia>"1980-01-01" and plec="M";
-- 8. Wyswietl liste klientow gdzie nazwisko zaczyna sie od 'Kow' 
Select * from klient where nazwisko like "Kow%";
-- 9. Wyswietl liste klientow gdzie nazwisko zaczyna sie od 'Kow' i urodzilo sie po 
-- 1980-01-01
 Select * from klient where rok_urodzenia>"1980-01-01" and nazwisko like "Kow%";
-- 10. Wyswietl liste klient ktorych nazwisko zaczyna sie od 'Kow%' lub 'Now%' 
 Select * from klient where
 (nazwisko like "Kow%" or nazwisko like "Now%");
-- 11. Wyswietl liste klient ktorych nazwisko nie zaczyna sie od 'Kow%' 
  Select * from klient where (nazwisko not like "Kow%" and nazwisko not like  "Now%");
-- 12. Wyswietl liste klientow ktorych nazwisko jest 'Kowalski' lub 'Kowalczyk' z uzyciem
-- konstrukcja IN
Select * from klient where nazwisko in ("Kowalski","Kowalczyk");
 
-- 13. Wyswietl wszystkie nazwiska z tablicy klient usuwajac duplikaty
 
 Select distinct nazwisko from klient;
 -- 14. Wyswietl wszystkich uzytkownikow z wystawionymi ocenami (z uzyciem JOIN)
 Select distinct k.imie, k.nazwisko from klient k join ocena_ksiazki o on 
 (k.klient_id=o.klient_id);
 
 -- 15. Wyswietl oceny wystawione przez uzytkownika Franciszek Kowalczyk
Select k.klient_id, k.imie, k.nazwisko,  ok.ocena
from klient k, ocena_ksiazki ok where k.klient_id=ok.klient_id
and k.imie="Franciszek" and k.nazwisko="Kowalczyk";
-- 16. Sprawdz liczbe klientow

select count(*) from klient;
-- 17. Policz ile jest mezczyzn i ile kobiet i ile mezczyzn w tablicy klient (z uzyciem GROUP BY)
select plec, count(*) as liczba from klient
group by plec;
-- 18. Policz ile bylo wystawionych recenzji przez kazdego klienta
select k.klient_id, k.imie, k.nazwisko, count(*) as liczba from recenzja r , klient k 
where k.klient_id=r.klient_id
group by k.klient_id;

-- ================ TWORZENIE i MODYFIKOWANIE =====================

-- Tworzenie tabel i modyfikacja danych
-- 1. Prosze utworzyć tabelę ksiazka_przeczytana 
--   zawierajaca dwie kolumny: pierwsza o nazwie id, typu INTEGER, druga
--    o nazwie tytul_ksiazki, typu VARCHAR(30).

-- 3. Prosze utworzyć tabelę ksiazka_przeczytana_1 
--   zawierajaca trzy kolumny: 
--     -  id o typie calkowitym
--     -  cena o typie pozwalajacym przechowywac wartosc z 2 miejscami po przecinku
--     -  data_przeczytania 

-- 4. Prosze utworzyc tabele ksiazka_przeczytana_2 z kluczem glownym na polu id i dodatkowo
--    dodac pole nazwa o typie pozwalajacym przechowac ciag tekstowy max. 100 znakow

-- 5. W oparciu o tabele z punktu 4 stworzyc tabele ksiazka_przeczytana_3 
-- z kluczem glownym zlozonym z pola  id oraz nazwa

-- 5. W oparciu o tabele z punktu 5 stworzyc tabele ksiazka_przeczytana_4 
-- ale dodać warunek aby pole nazwa nie moglo zawierac wartosci NULL

-- 6.  Prosze stworzyc tabele ksiazka_przeczytana_5 z dwoma polami 
--    id typu int ale ktorego wartosc ulega zwiekszeniu przy kazdym insertcie 
--    nazwa - ciag znakowy max. 100 znakow
--    pled  - ciag znakowy max.1 znak

-- 7. Do tabeli z punktu 7 prosze dodac indeks o nazwie idx_nazwa na polu nazwa

-- 8. Do tabeli z punktu 7 prosze dodac indeks o nazwie idx_nazwa_plec na polach
--   nazwa + plec

-- 9. Prosze usunac indeks idx_nazwa_plec z tabeli ksiazka_przeczytana_5

-- 10. Prosze dodac kolumne 'isbn_1' oraz 'isbn_2'  o typie ciagu znakowego max.10 znakow do juz
-- istniejacej tablicy ksiazka_przeczytana_5  (z uzyciem komendy ALTER)

-- 11. Prosze usunac kolumne 'isbn_1' z tablicy ksiazka_przeczytana_5

-- 12. Prosze zmienic nazwe kolumny 'isbn_2' na 'isbn'

-- 13. Prosze dodac do tablicy 'klient' wiersz z swoimi danymi 

-- 14. Zmien imie klientow (bo jest dwoch) Jacek Szymański na Jan .

-- 15. Skasuj wiersz 'Jan' 'Kowalski' z tabeli klient_archiwalny


-- ================= Zapytanie złożone SQL  na bazie  !!!! ksiazki !!!! =====================

-- 1. Przepisać poniższe zapytanie bez LEFT JOIN (ale UNION)
SELECT autor_imie, autor_nazwisko,tytul FROM 
ksiazka LEFT JOIN recenzja USING (ksiazka_id);

SELECT autor_imie, autor_nazwisko,tytul,null as recenzja_tekst FROM ksiazka k
where k.ksiazka_id not in (select r.ksiazka_id from recenzja r)
union
SELECT autor_imie, autor_nazwisko,tytul,recenzja_tekst FROM ksiazka k, recenzja r
where k.ksiazka_id=r.klient_id;

-- 2. Wynik poprzedniego zadania posortować po recenzji
select * from (SELECT autor_imie, autor_nazwisko,tytul,null as recenzja_tekst FROM ksiazka k
where k.ksiazka_id not in (select r.ksiazka_id from recenzja r)
union
SELECT autor_imie, autor_nazwisko,tytul,recenzja_tekst FROM ksiazka k, recenzja r
where k.ksiazka_id=r.klient_id) t order by recenzja_tekst;

-- 3.  Wyświetlić przy każdej książce średnią ocenę dla danej książki z 
-- informacją ile  było ocen. Z użyciem funkcji agregujacej i grupowania.

select k.tytul, avg(o.ocena), count(*) from ksiazka k, ocena_ksiazki o
where k.ksiazka_id=o.ksiazka_id
group by k.tytul;

-- 4. Wyświetlić średnią ocenę ocen średnich wszystkich książek
select avg(t.srednia) from (select k.tytul, avg(o.ocena) as srednia, 
count(*) from ksiazka k, ocena_ksiazki o
where k.ksiazka_id=o.ksiazka_id
group by k.tytul) t;

-- 5. Wyświetlić wszystkie oceny dla książki dla których ocena jest większa od średniej oceny dla wszyskich książek  (nie pomylić ze średnia wszystkich ocen) 

select o.ocena from ocena_ksiazki o
where o.ocena>(select avg(t.srednia) from (select k.tytul, avg(o.ocena) as srednia, 
count(*) from ksiazka k, ocena_ksiazki o
where k.ksiazka_id=o.ksiazka_id
group by k.tytul) t);

-- 6. Wyświetlić wszystkie oceny dla ksiażek dla których ocena jest większa
--  od średniej oceny dla wszyskich książek
-- (nie pomylić ze średnia wszystkich ocen) i przy ocenie wyświetlić
--  średnią ocenę dla wszystkich książek

 -- 7. I nieco trudniejsze zadanie wyświetlić wszystkie ksiażki dla
 -- których średnia ocena jest większa od średniej oceny 
 -- dla wszyskich książek (nie pomylić ze średnia wszystkich ocen) 
 -- i przy ocenie wyświetlić średnią ocenę dla książki 
 -- i dla wszystkich książek

-- Można to zrobić też na widokach albo dodać dodatkową tabelę ze statystykami - w zależności od sytuacji
-- Inny wynik jakbysmy wzieli srednia wszystkich ocen SELECT k.autor_imie, k.autor_nazwisko, k.tytul, ocena FROM ksiazka k JOIN ocena_ksiazki og USING (ksiazka_id) 
-- WHERE ocena>( SELECT AVG(ocena) FROM ocena_ksiazki)
 