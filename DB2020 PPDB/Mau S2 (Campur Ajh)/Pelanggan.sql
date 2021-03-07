create table Pelanggan(
	ID integer, 
	NAME varchar(15), 
	AGE integer,
	ADDRESS varchar(15),
	SALARY decimal(10,2));

insert into Pelanggan values
(1,'Ramesh',	32,'Ahmedabad',	'2000.00'),
(2,'Khilan',	25,'Delhi',		'1500.00'),
(3,'Kaushik',	23,'Kota',		'2000.00'),
(4,'Chaitali',	25,'Mumbai',	'6500.00'),
(5,'Hardik',	27,'Bhipal',	'8500.00'),
(6,'Komal',		22,'MP',		'4500.00'),
(7,'Muffy',		24,'Indore',	'10000.00');

(9,'Kaushik',32,'Mumbai','6500');
(8,'Ramesh',32,'Delhi','1500');

select * from Pelanggan;
drop table Pelanggan;
delete from Pelanggan;

select NAME, SUM(SALARY) as salary from Pelanggan GROUP BY NAME;
select NAME, SUM(SALARY) as Totalsalary from Pelanggan GROUP BY NAME;
select NAME, MIN(SALARY) as Minsalary from Pelanggan GROUP BY NAME;

select * from Pelanggan where AGE>25;
select * from Pelanggan where SALARY>=3500.00;

alter table Pelanggan add Gender char(15);
update Pelanggan set Gender='Men' where ID=1 or ID=2 or ID=5 or ID=6;
update Pelanggan set Gender='Woman' where ID=3 or ID=4 or ID=7;
update Pelanggan set Gender='Aneh';

update Pelanggan set AGE=25 where ID=8;
delete Pelanggan where ID=9;
select NAME, SUM(SALARY) as salary from Pelanggan GROUP BY NAME;
select NAME, SUM(AGE) as id from Pelanggan GROUP BY NAME;
----------------------------------------------------------------------------
create table ORDER2 (
	OID integer,
	DATE datetime,
	CUSTOMER_ID integer,
	AMOUNT integer);

insert into ORDER2(OID,DATE,CUSTOMER_ID,AMOUNT)
values
(102,'2009-10-08 00:00:00',3,3000),
(100,'2009-10-08 00:00:00',3,1500),
(101,'2009-11-20 00:00:00',2,1560),
(103,'2008-05-20 00:00:00',4,2060);

drop table ORDERS;

select * from ORDER2;
select * from ORDER2 where AMOUNT<2500;