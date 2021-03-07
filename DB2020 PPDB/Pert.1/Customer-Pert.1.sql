create table Customer (
	ID integer,
	NAME varchar(15),
	AGE integer,
	ADDRESS varchar(15),
	SALARY varchar(15));
================================================
insert into Customer(ID,NAME,AGE,ADDRESS,SALARY)
values
(01,'Ibra',		24,'Tegal',		'5000.00'),
(02,'Maulina',	35,'Jogjakarta','2000.00'),
(03,'Teddy',	26,'Tangerang',	'2500.00'),
(04,'Raditya',	37,'Jakarat',	'5000.00'),
(05,'Jarwo',	23,'CondetRaya','4100.00'),
(06,'Ananda',	26,'Bogor',		'3900.00'),
(07,'Catty',	20,'Jakarta',	'4900.00');
================================================
select * from Customer ;
================================================
/*Fungsi Agregat*/

/*SUM = Total/Penjumlahan*/
use "DB2020 PPDB"
select sum(AGE) as Total from Customer where ID=1 or ID=2;
select sum(AGE) as Total from Customer;

/*Count = Frekuensi*/
select count(ID) as jumlah from Customer where ADDRESS='Jakarta';
select count(ID) as jumlah from Customer;

/*Avg*/
select avg(Age) as peserta from Customer;

/*Maksimal*/
select MAX(AGE) as maks from Customer;

/*Minimal*/
select MIN(AGE) as min from Customer;

/*Kombinasi*/
select	MAX(ID) as Maksimum,
		MIN(ID) as Minimun,
		AVG(ID) as Rata
from customer;
========================================================
/*Select*/
select * from Customer where ADDRESS='Jakarat';
select * from Customer where SALARY>='4900.00';
select * from Customer where AGE>25;

/*Update*/
update Customer set ADDRESS='Jakarta' where ID=1 or ID=4;
update Customer set NAME='MauMau', AGE=50, ADDRESS='PantiJom' where ID=2;
update Customer set AGE=12, SALARY = 1000.00
where ID = 7 or NAME = 'Jarwo';
update Customer set AGE=100, SALARY = 999.00
where ID = 7 and NAME = 'Catty';

/*Alter Table*/
alter table Customer add Keterangan varchar(15);
update Customer set keterangan='Aktif' where ID=1 or ID=2 or ID=7;
update Customer set keterangan='Non Aktif' where ID=3 or ID=4 or ID=5 or ID=6;

/*Delete Table*/
delete from Customer;