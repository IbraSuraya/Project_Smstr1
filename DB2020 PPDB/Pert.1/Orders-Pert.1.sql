create table Orders(
	OID integer,
	DATE datetime,
	CUSTOMER_ID integer,
	AMOUNT Integer);
======================================================
insert into Orders(OID,DATE,CUSTOMER_ID,AMOUNT)
values
(102,'2019-10-08 01:01:01',3,3000),
(100,'2019-10-08 02:02:02',3,1500),
(101,'2019-11-09 03:03:03',4,4560),
(103,'2019-12-23 04:04:04',8,10500);
======================================================
select * from Orders;