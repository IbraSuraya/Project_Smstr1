BAHANNYA

create table Pekerja (
	ID integer,
	NAME varchar(15),
	AGE integer,
	ADDRESS varchar(15),
	SALARY integer,
	GENDER varchar(2));

insert into Pekerja values
(01,'Ibra',		24,'Bogor',		500000,'L'),
(02,'Maulana',	35,'Jogjakarta',200000,'P'),
(03,'Teddy',	26,'Tangerang',	250000,'P'),
(04,'Raditya',	37,'Jakarta',	500000,'L'),
(05,'Irwo',		23,'Condet',	410000,'L'),
(06,'Inanda',	26,'Bogor',		390000,'P'),
(07,'Catty',	20,'Jakarta',	490000,'P');

select * from Pekerja ;
drop table Pekerja;
---------------------------------------------------
create table FASILITAS (
	"ID Fasilitas" integer,
	Barang varchar(15),
	QTY integer);

insert into FASILITAS values
	(2001,'Mobil',5),
	(2002,'Laptop',30),
	(2003,'PC',45),
	(2004,'Apartement',10),
	(2005,'BUS',3);

select * from FASILITAS;
drop table FASILITAS;
--------------------------------------------------
create table MAKANAN (
	"ID Makan" integer,
	Lauk varchar(15),
	Porsi integer);

insert into MAKANAN values
	(1010,'SATE',30),
	(2020,'SATE',30),
	(3030,'SOTO',45),
	(4040,'BIHUN GRNG',30),
	(5050,'SOP BUAH',40),
	(6060,'BIHUN GRNG',30),
	(7070,'BIHUN GRNG',30);
select * from MAKANAN;
drop table MAKANAN;
====================================================
select * from Pekerja ;
select * from FASILITAS;
select * from MAKANAN;
----------------------------------------------------
1. COUNT
select GENDER, count(ID) as "Gender" 
from Pekerja group by gender;

SELECT ADDRESS, COUNT(ADDRESS) 
	as Jumlah
	FROM Pekerja
	GROUP BY ADDRESS
HAVING COUNT(ADDRESS)>1;
-------------------------------------------------
2. AVG
select avg(SALARY) as "Rata Gaji" from Pekerja;
-------------------------------------------------
3. SUM
select sum(SALARY) as "Total Pengeluaran" 
from Pekerja;
-------------------------------------------------
4. MIN
select MIN(SALARY) as "Gaji Terkecil" 
from Pekerja;
------------------------------------------------
5. MAX
select MAX(SALARY) as "Gaji Terbesar" 
from Pekerja;
-----------------------------------------------
6. OR
SELECT NAME, ADDRESS
	FROM Pekerja
	WHERE ADDRESS='Jakarta' OR ADDRESS='Bogor';
-----------------------------------------------
7. NOT
SELECT NAME, ADDRESS
    FROM Pekerja 	
    WHERE NOT ADDRESS='Jakarta' 
	OR ADDRESS='Bogor';
------------------------------------------------
8. BETWEEN - AND
SELECT ID, NAME
    FROM Pekerja	
    WHERE ID BETWEEN 02 AND 04;
-----------------------------------------------
9. IN
SELECT ID, ADDRESS
	FROM Pekerja	
    WHERE ADDRESS IN 
	('Bogor','Tangerang','Jakarta');
----------------------------------------------
10. LIKE
SELECT NAME
	FROM Pekerja
	WHERE NAME LIKE 'I%';
---------------------------------------------
11. Inner Join
SELECT	FASILITAS.Barang, 
		FASILITAS.QTY, 
		Pekerja. NAME, 
		Pekerja. GENDER
FROM FASILITAS INNER JOIN Pekerja
ON FASILITAS."ID Fasilitas" = FASILITAS."ID Fasilitas";
----------------------------------------------
12. RIGHT JOIN
SELECT	FASILITAS.Barang, 
		FASILITAS.QTY, 
		Pekerja. NAME, 
		Pekerja. GENDER
FROM FASILITAS RIGHT JOIN Pekerja
ON FASILITAS."ID Fasilitas" = FASILITAS."ID Fasilitas";
-------------------------------------------------------
12. LEFT JOIN
SELECT	FASILITAS.Barang, 
		FASILITAS.QTY, 
		Pekerja. NAME, 
		Pekerja. GENDER
FROM FASILITAS LEFT JOIN Pekerja
ON FASILITAS."ID Fasilitas" = FASILITAS."ID Fasilitas";
-------------------------------------------------------
13. DISTINCT
SELECT DISTINCT Lauk, Porsi FROM MAKANAN;
------------------------------------------------------
