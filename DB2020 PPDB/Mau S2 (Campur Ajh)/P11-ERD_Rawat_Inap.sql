--------------------------------------------------
create table PERAWAT (
	"Kode Perawat" varchar(10) not null, 
	"Nama Perawat" varchar(20),
primary key("Kode Perawat"));

insert into PERAWAT values
('2001001','Herawati'),
('2001002','Susan'),
('2011001','Devi'),
('2011002','Agung');

select * from PERAWAT;
drop table PERAWAT;
-------------------------------------------------
create table DOKTER (
	"Kode Dokter" varchar(10) not null, 
	"Nama Dokter" varchar(20),
	"Telp Dokter" varchar(15),
primary key("Kode Dokter"));

insert into DOKTER values
('PPDARD','Dr.ARNOLD', '7656971'),
('PPDMAS','Dr.MAAS',   '7778891'),
('PPJRYN','Dr.RYAN',   '7656688');

select * from DOKTER;
drop table DOKTER;
----------------------------------------------------
create table PASIEN (
	"Kode Pasien" varchar(10) not null, 
	"Nama Pasien" varchar(20),
	"Alamat" varchar(15),
	"Telp Pasien" varchar(15),
primary key("Kode Pasien"));

insert into PASIEN values
('196612','Firman',		'Cinere',	'7656578'),
('197918','Wahyu',		'Pd Labu',	'7658989'),
('200222','Alvaro',		'Pd Labu',	'7658990'),
('200705','Callista',	'Cinere',	'7654444'),
('199709','Boy',		'Pd Cabe',	'7446784');

select * from PASIEN;
drop table PASIEN;
------------------------------------------------------
create table RUANGAN (
	"Kode Ruangan" varchar(10) not null, 
	"Nama Ruangan" varchar(20),
primary key("Kode Ruangan"));

insert into RUANGAN values
('MLT01','Melati kelas 1'),
('MLT02','Melati Kelas 2'),
('MLT03','Melati kelas 3'),
('MLT00','Melati VIP'),
('LLY01','Lily kelas 1'),
('LLY02','Lily kelas 2'),
('LLY03','Lily kelas 3'),
('LLY00','Lily VIP');

select * from RUANGAN;
drop table RUANGAN;
-------------------------------------------------------
create table RAWAT (
	"Kode Pasien" varchar(10) not null,
	"Nama Pasien" varchar(20),
	"Kode Dokter" varchar(10) not null,
	"Nama Dokter" varchar(20),
	"Kode Perawat" varchar(10) not null, 
	"Nama Perawat" varchar(20),
foreign key("Kode Perawat") references PERAWAT,
foreign key("Kode Dokter") references DOKTER,
foreign key("Kode Pasien") references PASIEN);

insert into RAWAT values
('196612','Firman',		'PPDARD','Dr.ARNOLD',	'2011002','Agung'),
('196612','Firman',		'PPJRYN','Dr.RYAN',		'2011002','Agung'),
('197918','Wahyu',		'PPDMAS','Dr.MAAS',		'2001001','Herawati'),
('200222','Alvaro',		'PPDMAS','Dr.MAAS',		'2001002','Susan'),
('200705','Callista',	'PPJRYN','Dr.RYAN',		'2011001','Devi'),
('199709','Boy',		'PPJRYN','Dr.RYAN',		'2001001','Herawati');

select * from RAWAT;
drop table RAWAT;
-------------------------------------------------------
create table PERAWATAN (
	"Kode Pasien" varchar(10) not null,
	"Kode Ruangan" varchar(10) not null,
	"Kode Dokter" varchar(10) not null, 
	"Kode Perawat" varchar(10) not null, 
	"TGL Masuk" date,
	"TGL Keluar" date,
	Penyakit varchar(20),
foreign key("Kode Perawat") references PERAWAT,
foreign key("Kode Dokter") references DOKTER,
foreign key("Kode Pasien") references PASIEN,
foreign key("Kode Ruangan") references RUANGAN,);

insert into PERAWATAN values
('196612','MLT00',	'PPDARD','2011002','2020-03-03','2020-04-02','stroke'),
('196612','MLT00',	'PPJRYN','2011002','2020-03-03','2020-04-02','stroke'),
('197918','LLY01',	'PPDMAS','2001001','2020-07-06','2020-07-09','infeksi lambung'),
('200222','LLY02',	'PPDMAS','2001002','2020-08-18','2020-09-01','usus buntu'),
('200705','MLT00',	'PPJRYN','2011001','2020-09-06','2020-09-20','jantung'),
('199709','MLT00',	'PPJRYN','2001001','2020-09-06','2020-09-09','jantung');

select * from PERAWATAN;
drop table PERAWATAN;
-------------------------------------------------------
SELECT CONVERT(VARCHAR(12), SYSDATETIME(), 107) AS [Mon DD, YYYY];
SELECT * FROM PERAWATAN INNER JOIN DOKTER
	ON PERAWATAN."Kode Dokter" = DOKTER."Kode Dokter";