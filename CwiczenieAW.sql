SET @dd=0;
SELECT (@dd:=@dd + 1) AS num, 
s.klient_id,(s.liczba_przeczytanych_ksiazek) as 'suma' from statystyka_klienta s;

-- wyświetlić klientów z informacją o ilości wystawionych ocen
Select k.klient_id, k.imie, k.nazwisko, count(o.ocena) as ilosc from klient k, ocena_ksiazki o
where k.klient_id=o.klient_id
group by k.klient_id;

Select k.klient_id, k.imie, k.nazwisko, count(o.ocena) as ilosc from klient k 
natural join ocena_ksiazki o
group by k.klient_id;

Select k.klient_id, k.imie, k.nazwisko, count(o.ocena) as ilosc from klient k 
inner join ocena_ksiazki o on k.klient_id=o.klient_id
group by k.klient_id;

Select k.klient_id, k.imie, k.nazwisko, count(o.ocena) as ilosc from klient k 
join ocena_ksiazki o on k.klient_id=o.klient_id
group by k.klient_id;

-----------------------------------------------------------------------------
-- wyświetlić ilość książek w dla każdego rodzaju 
Select  k.rodzaj, count(*) from ksiazka k
group by k.rodzaj;

-- ćwiczenia
-- wyświetlić książki które mają przynajmniej jedną recenzje z użyciem subquery

Select T.ksiazka,T.x from (Select k.ksiazka_id, r.ksiazka_id, 
r.recenzja_tekst,count(*) as x from ksiazka k, recenzja r 
where k.ksiazka_id=r.ksiazka_id
group by k.ksiazka_id) T ;

Select * from ksiazka where ksiazka_id in (Select ksiazka_id from recenzja);

-- wyświetlić książkę (jest jedna) które ma recenzję z tekstem 'Świetna!'

Select * from ksiazka where ksiazka_id in (Select ksiazka_id from 
recenzja where recenzja_tekst='Świetna!'); -- bo moze byc wiecej niz 1

Select * from ksiazka where ksiazka_id = (Select ksiazka_id from 
recenzja where recenzja_tekst='Świetna!'); -- bo jedna


