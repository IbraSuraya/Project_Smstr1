create database UTS_PDBGANJIL20 ;

create table Obat (
	"Kode Obat" varchar(8),
	"Nama Obat" varchar(20),
	"Jenis Obat" varchar(15),
);

insert into Obat(
	"Kode Obat",
	"Nama Obat",
	"Jenis Obat")
values
	('PN001','PANADOL EKSTRA','ANALGESIC'),
	('PN002','PANADOL FLU & PILEK','ANALGESIC'),
	('SG001','SANGOBION KAPLET','VITAMIN'),
	('SG002','SANGOBION SYRUP','VITAMIN'),
	('CL001','BEDAK CALADYN','POWDER');

alter table Obat add 
"TGL KADALUARSA" varchar(20);

Update Obat set "TGL KADALUARSA"='30-Nov-2020' 
where	"Kode Obat"='PN001' or 
		"Kode Obat"='PN002';

Update Obat set "TGL KADALUARSA"='15-Dec-2020' 
where	"Kode Obat"='SG001' or 
		"Kode Obat"='SG002';

Update Obat set "TGL KADALUARSA"='28-Dec-2020' 
where	"Kode Obat"='CL001';


select count("Kode Obat") as "Total Obat" from Obat;

Select * from obat order by "Kode Obat";

select "Kode Obat" from Obat GROUP BY "Kode Obat";

select * from Obat;

select "Kode Obat", "TGL KADALUARSA" from Obat;