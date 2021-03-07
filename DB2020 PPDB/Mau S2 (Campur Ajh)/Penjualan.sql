create table BARANG (
	KODEBARANG varchar(4) not null, 
	NAMABARANG varchar(20),
primary key(KODEBARANG));

drop table BARANG;
----------------------------------------------------------
create table SUPPLIER (
	KODESUPPLIER varchar(4) not null, 
	NAMASUPPLIER varchar(5), 
	KODEBARANG varchar(4) not null,
primary key(KODESUPPLIER),
foreign key(KODEBARANG) references BARANG);

drop table SUPPLIER;
----------------------------------------------------------
create table SUPPLIER_2 (
	KODESUPPLIER varchar(4) not null, 
	NAMASUPPLIER varchar(5), 
primary key(KODESUPPLIER));

drop table SUPPLIER_2;
---------------------------------------------------------
create table PEMBELIAN (
	KODESUPPLIER varchar(4) not null, 
	NAMASUPPLIER varchar(5), 
	KODEBARANG varchar(4) not null,
	NAMABARANG varchar(20),
	QUANTITY integer,
	TanggalTransaksi date,
	NOMORTransaksi integer
foreign key(KODESUPPLIER) references SUPPLIER,
foreign key(KODEBARANG) references BARANG);

drop table PEMBELIAN;
-------------------------------------------------------
create table PEMBELIAN_2 (
	KODESUPPLIER varchar(4) not null, 
	NAMASUPPLIER varchar(5), 
	KODEBARANG varchar(4) not null,
	NAMABARANG varchar(20),
	QUANTITY integer,
	TanggalTransaksi date,
	NOMORTransaksi integer
foreign key(KODESUPPLIER) references SUPPLIER_2,
foreign key(KODEBARANG) references BARANG);

drop table PEMBELIAN_2;
----------------------------------------------------------
insert into BARANG values
('A001','AC Spliti/2 PK'),
('A002','AC Spliti 1 PK');
select * from BARANG;
---------------------------------------------------------
insert into SUPPLIER values
('5001','ABC','A001');
select * from SUPPLIER;
-----------------------------------------------------------
insert into SUPPLIER_2 values
('5001','ABC');
select * from SUPPLIER_2;
---------------------------------------------------------------
Insert into PEMBELIAN_2 values
('5001','ABC','A001','AC split 1/2 PK',10,'10/12/05',100);
select * from PEMBELIAN_2;
--------------------------------------------------------------------------