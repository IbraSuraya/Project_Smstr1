/*Project UAS Database Poliklinik*/
create database "POLIKLINIK KLMPK 13";
use "POLIKLINIK KLMPK 13";
==============================================================================================
						/*Primer*/
==============================================================================================
/*kAMAR RAWAT*/ /*Primer*/
CREATE TABLE Kamar_Rawat (
	No_Kamar INTEGER NOT NULL, 
	Nama_Kamar VARCHAR (15) NOT NULL, 
	Jenis_Kamar VARCHAR (20), 
	Biaya_per_Malam INTEGER, 
	Jumlah_Kasur INTEGER,
PRIMARY KEY (No_Kamar));

INSERT INTO Kamar_Rawat
values
(101,	'Melati 1',		'A',	350000,	1),
(102,	'Melati 2', 	'A',	350000,	1),
(103,	'Anggrek 1', 	'B',	200000,	2),
(104,	'Anggrek 2',	'B',	200000,	2),
(105,	'Lily 1',		'B',	200000,	2),
(106,	'Lily 2',		'B',	200000,	2),
(107,	'Amarilis 1',	'C',	150000,	3),
(108,	'Amarilis 2',	'C',	150000,	3),
(109,	'Kamboja 1', 	'VIP',	500000,	1),
(110,	'Kamboja 2', 	'VIP',	500000,	1);
--------------------------------------------------------
select Nama_Kamar, Jumlah_Kasur from Kamar_Rawat 
	where Nama_Kamar like '%2' and Jumlah_Kasur > 1;
--------------------------------------------------------
create view Nama_dan_Jumlah as
select Nama_Kamar, Jumlah_Kasur from Kamar_Rawat 
	where Nama_Kamar like '%2' and Jumlah_Kasur > 1;
select * from  Nama_dan_Jumlah;
--------------------------------------------------------
select * from Kamar_Rawat order by Biaya_per_Malam desc;
--------------------------------------------------------

select * from Kamar_Rawat;
drop table Kamar_Rawat;
==============================================================================================
/*Perawat*/ /*Primer*/
CREATE TABLE Perawat (
	ID_Perawat VARCHAR (10) NOT NULL, 
	Nama_Perawat VARCHAR (25) NOT NULL,
	Spesialis VARCHAR (10), 
	Alamat VARCHAR (30), 
	No_Handphone VARCHAR (15), 
	Shift VARCHAR(10),
PRIMARY KEY (ID_Perawat));

insert into Perawat
values
('PR_1','Nur','Anak',		'Jl. Soekarno No.1',	'6285260694444','Pagi'),
('PR_2','Dewi','Anak',		'Jl. Tomo No.6',		'6285270525222','Siang'),
('PR_3','Dian','Anak',		'Jl. Diponegoro No.8',	'6285358662011','Malam'),
('PR_4','Sri','Jiwa',		'Jl. Kartini No.12',	'6282168616925','Pagi'),
('PR_5','Sintia','Jiwa',	'Jl. Hasyim No.87',		'6281362442123','Siang'),
('PR_6','Ayu','Jiwa',		'Jl. Dewantara No.76',	'6285260527654','Malam'),
('PR_7','Agus','Medikal',	'Jl. Soedirman No.65',	'6281263231067','Pagi'),
('PR_8','Anton','Medikal',	'Jl. Hatta No.98',		'6285275347171','Siang'),
('PR_9','Jefri','Medikal',	'Jl. Dwi Sartika No.13','6281377204365','Sore'),
('PR_10','Mandra','Medikal','Jl. Hasanuddin No.14',	'6282164141099','Malam');
---------------------------------------------------------
select * from Perawat where No_Handphone not like '62821%' 
	and Shift = 'Malam';
---------------------------------------------------------
create view PR_Malam_Simpati as
select * from Perawat where No_Handphone not like '62821%' 
	and Shift = 'Malam';
select * from PR_Malam_Simpati;
---------------------------------------------------------
select * from Perawat order by Nama_Perawat asc;
---------------------------------------------------------

select * from Perawat;
drop table perawat;
==============================================================================================
/*Pasien*/ /*Primer*/
create table Pasien(
	No_Pasien integer NOT NULL,
	Nama_Pasien varchar (25) NOT NULL,
	Golongan_Darah VARCHAR (5),
	Status VARCHAR (10),
	Alamat varchar (30), 
	No_Handphone varchar (15),
PRIMARY KEY (No_Pasien));

insert into Pasien
values
(2012211,'Bambang',	'A','inap',		'Jl. Mangga No.12',	'6288112108969'),
(2012212,'Januar',	'B','inap',		'Jl. Manggis No.16','6281318798182'),
(2012311,'Rani',	'AB','inap',	'Jl. Durian No.17',	'6282133883017'),
(2012312,'Latifa',	'O','inap',		'Jl. Apel No.20',	'6285842388740'),
(2012313,'Yoga',	'O','inap',		'Jl. Anggur No.19',	'6281201062476'),
(2012411,'Malik',	'A','inap',		'Jl. Alpukat No.21','6208129343477'),
(2012511,'Jaka',	'B','tidak inap','Jl. Jambu No.34',	'6181218398182'),
(2012512,'Hanin',	'AB','tidak inap','Jl. Kelapa No.12','6281514188106'),
(2012513,'Putri',	'AB','tidak inap','Jl. Srikaya No.13','6281566602152'),
(2012611,'Silvi',	'B','tidak inap','Jl. Nangka No. 31','6281631014237');
--------------------------------------------------------------------
select * from Pasien where (Status = 'inap' and Golongan_Darah = 'A')
	or (Status = 'inap' and Golongan_Darah = 'O');
--------------------------------------------------------------------
create view Inap_A_O as
select * from Pasien where (Status = 'inap' and Golongan_Darah = 'A')
	or (Status = 'inap' and Golongan_Darah = 'O');
select * from Inap_A_O;
--------------------------------------------------------------------
select * from Pasien order by Golongan_Darah asc;
--------------------------------------------------------------------

select * from Pasien;
==============================================================================================
/*Dokter*/ /*Primer*/
CREATE TABLE Dokter(
	ID_Dokter VARCHAR (10) NOT NULL, 
	Nama_Dokter VARCHAR (25) NOT NULL, 
	Spesialis varchar (10), 
	Alamat varchar (25), 
	No_Handphone varchar (15), 
	Shift varchar (10),
PRIMARY KEY (ID_Dokter));

INSERT INTO Dokter
values
('NK_101','Dr. Jayanto','Anak',	'Jl. Padang No. 30',	'6281360900033','Pagi'),
('NK_102','Dr. Sondah',	'Anak',	'Jl. Makasar No.87',	'6285372489059','Malam'),
('MM_101','Dr. Aditya',	'Umum',	'Jl. Bandung No.12',	'6285261526170','Pagi'),
('MM_102','Dr. Veronica','Umum','Jl. Surabaya No.14',	'6285762161577','Malam'),
('BD_101','Dr. Fajar',	'Bedah','Jl. Solo No.76',		'6281265303070','Pagi'),
('BD_102','Dr. Bagas',	'Bedah','Jl. Malang No.12',		'6282163205192','Malam'),
('TH_101','Dr. Aryo',	'THT',	'Jl. Palembang No.54',	'6281260387606','Pagi'),
('TH_102','Dr. Yuda',	'THT',	'Jl. Bali No.51',		'6281376966902','Siang'),
('GG_101','Dr. Sarah',	'Gigi',	'Jl. Kalimantan No.14',	'6281311620217','Pagi'),
('GG_102','Dr. Anita',	'Gigi',	'Jl. Pontianak No.67',	'6282163572271','Siang');
------------------------------------------------------------------------
select * from Dokter where Alamat like 'Jl. M%' and Spesialis = 'Anak' ;
------------------------------------------------------------------------
create view Dokter_Anak_Malam as
select * from Dokter where Alamat like 'Jl. M%' and Spesialis = 'Anak' ;
select * from Dokter_Anak_Malam;
------------------------------------------------------------------------
select * from Dokter order by Nama_Dokter asc;
------------------------------------------------------------------------

select * from Dokter;
==============================================================================================
/*Obat*/ /*Primer*/
create table Obat(
	ID_Obat varchar (10) NOT NULL, 
	Nama_Obat varchar (20) NOT NULL, 
	Jenis_Obat varchar (20),
	Tanggal_Masuk date, 
	Tanggal_Kadarluasa date, 
	Stock integer, 
	Harga integer,
PRIMARY KEY (ID_Obat));

insert into Obat
values
('BS_01','Bodrex',	'Obat Bebas',			'2019-02-06','2022-01-29',40,5000),
('BS_02','Omegavit','Obat Bebas',			'2019-02-06','2022-06-25',45,18000),
('BS_03','Erphamol','Obat Bebas',			'2019-04-21','2022-06-22',30,6000),
('BS_04','Veroscan','Obat Bebas',			'2020-07-08','2022-07-03',40,10500),
('BT_01','Valtrex',	'Obat Bebas Terbatas',	'2019-09-27','2023-08-27',35,25000),
('BT_02','Alleron',	'Obat Bebas Terbatas',	'2019-10-05','2023-09-05',45,21000),
('BT_03','Zacoldine','Obat Bebas Terbatas',	'2019-10-05','2023-10-01',30,18000),
('BK_01','Ibuprofen','Obat Keras',			'2019-12-07','2023-10-31',15,45000),
('BK_02','Otopraf',	'Obat Keras',			'2020-01-11','2023-12-20',10,36000),
('BK_03','Avamys',	'Obat Keras',			'2020-01-11','2023-12-31',20,54000);
----------------------------------------------------
select * from Obat where (Harga > 10000 or Stock <35) 
	and Jenis_obat = 'Obat Bebas';
----------------------------------------------------
create view Obat_Bebas_dibawah_10000 as
select * from Obat where (Harga > 10000 or Stock <35) 
	and Jenis_obat = 'Obat Bebas';
select * from Obat_Bebas_dibawah_10000;
----------------------------------------------------
select * from Obat order by Tanggal_Kadarluasa;
----------------------------------------------------

select * from Obat;
==============================================================================================
/*Petugas*/ /*Primer*/
create table Petugas(
	ID_Petugas varchar (10) NOT NULL, 
	Nama_Petugas varchar (25) NOT NULL,
	Alamat varchar (25),
	No_Handphone varchar (15),
	Shift varchar (10),
	Posisi varchar (20),
PRIMARY KEY (ID_Petugas));

INSERT INTO Petugas
values
('AP_101','Nova',	'Jl. Mada No.21',	'6281235056275',	'Pagi','Apoteker'),
('AP_201','Evita',	'Jl. Joyoboyo No.12','6281269802707',	'Siang','Apoteker'),
('AP_301','Bayu',	'Jl. Kutai No.76',	'6281361641039',	'Malam','Apoteker'),
('GD_102','David',	'Jl. Abdullah No.15','6282267675222',	'Pagi','Gudang'),
('GD_202','Indra',	'Jl. Cempaka No.14','6282166635779',	'Siang','Gudang'),
('GD_302','Cakra',	'Jl. Damai No.87',	'6281375773611',	'Siang','Gudang'),
('GD_402','Bintang','Jl. Duta No.54',	'6285281444522',	'Malam','Gudang'),
('GD_502','Anwar',	'Jl. Gading No.19',	'6281264154777',	'Malam','Gudang'),
('KS_103','Susana',	'Jl. Haji No.23',	'6282166742993',	'Pagi','Kasir'),
('KS_203','Melani',	'Jl. Imam No. 18',	'6281318639800',	'Siang','Kasir');
------------------------------------------------------------------------
select * from Petugas where ID_Petugas like '%_10%' or Posisi = 'Kasir';
------------------------------------------------------------------------
create view Petugas_Utama_Full_Kasir as
select * from Petugas where ID_Petugas like '%_10%' or Posisi = 'Kasir';
select * from Petugas_Utama_Full_Kasir;
------------------------------------------------------------------------
select * from Petugas order by Alamat desc ;
------------------------------------------------------------------------

select * from Petugas;
==============================================================================================
/*Supplier*/ /*Primer*/
create table Supplier(
	ID_Supplier varchar (10) NOT NULL, 
	Nama_Supplier varchar (25)	NOT NULL, 
	No_Telepon varchar (20),
	Jenis_Obat varchar (20),
	Tanggal_Pesan date, 
	Jumlah integer,
PRIMARY KEY (ID_Supplier));

INSERT INTO Supplier
values
('PT_001','PT.Amins',	'6281354216024','Obat Bebas',			'2019-01-25',	45),
('PT_002','PT.Burmi',	'6282329740911','Obat Bebas',			'2019-04-14',	30),
('PT_003','PT.ESTA',	'6283430851022','Obat Bebas',			NULL,			NULL),
('PT_004','PT.MIKAKO',	'6284541962133','Obat Bebas',			'2020-07-01',	28),
('PT_005','PT.Prima',	'6285652073244','Obat Bebas Terbatas',	NULL,			NULL),
('PT_006','PT.SejaObat','6281236512016','Obat Bebas Terbatas',	'2019-09-20',	25),
('PT_007','PT.Along',	'6282346167386','Obat Bebas Terbatas',	'2019-09-28',	20),
('PT_008','PT.Mustafa',	'6283457278497','Obat Keras',			NULL,			NULL),		
('PT_009','PT.Jarwi',	'6284568389564','Obat Keras',			'2019-11-30',	12),
('PT_010','PT.HafarC',	'6285642314561','Obat Keras',			'2019-12-04',	18);
-----------------------------------------------------------------
select * from Supplier where (Jenis_Obat = 'Obat Bebas Terbatas' 
	and Tanggal_Pesan is NOT NULL) or Tanggal_Pesan < '2019-07-1';
-----------------------------------------------------------------
create view Obat_Bebas_Terbatas_Diatas2020 as
select * from Supplier where (Jenis_Obat = 'Obat Bebas Terbatas' 
	and Tanggal_Pesan is NOT NULL) or Tanggal_Pesan < '2019-07-1';
select * from Obat_Bebas_Terbatas_Diatas2020;
-----------------------------------------------------------------
select * from Supplier order by Jumlah asc;
-----------------------------------------------------------------

select * from Supplier;
drop table Supplier;
==============================================================================================
/*Resep*/ /*Primer*/
CREATE TABLE Resep (
	No_Resep VARCHAR (15) NOT NULL,
	Tanggal DATE,
	Jml_Jenis_Obat INTEGER,
	Harga_Resep	INTEGER,
PRIMARY KEY (No_Resep));

INSERT INTO Resep
VALUES
('R_M1_01',	'2020-04-21',	3,	52000),
('R_T2_01',	'2020-08-13',	2,	180000),
('R_G1_01',	'2020-09-26',	2,	95000),
('R_M1_02',	'2020-10-10',	1,	54000),
('R_M2_02',	'2020-11-18',	1,	42000),
('R_M2_03',	'2020-12-04',	1,	10500);
-------------------------------------------------------------------------
select * from Resep where Jml_Jenis_Obat = 1 and Tanggal > '2020-10-10' ;
-------------------------------------------------------------------------
create view Resep_1Jenis_Diatas10Oktober as
select * from Resep where Jml_Jenis_Obat = 1 and Tanggal > '2020-10-10' ;
select * from Resep_1Jenis_Diatas10Oktober;
-------------------------------------------------------------------------
select * from Resep order by Harga_Resep desc;
-------------------------------------------------------------------------

select * from Resep;
drop table Resep;
==============================================================================================
					/*Relasi*/
==============================================================================================
/*Pembelian*/ /*Relasi*/
CREATE TABLE Pembelian (
	No_Pasien INTEGER NOT NULL,
	ID_Petugas VARCHAR (10) NOT NULL,
	ID_Obat VARCHAR (10) NOT NULL,
	Jumlah INTEGER,
	Harga_Total INTEGER,
FOREIGN KEY (No_Pasien) REFERENCES Pasien(No_Pasien),
FOREIGN KEY (ID_Obat) REFERENCES Obat(ID_Obat));

INSERT INTO Pembelian
values
(2012511,'KS_203', 	'BS_01',1,5000),
(2012511,'KS_203', 	'BS_03',3,18000),
(2012512,'KS_103', 	'BS_02',2,36000),
(2012512,'KS_103', 	'BS_04',3,31500),
(2012513,'KS_103', 	'BS_04',2,21000),
(2012513,'KS_103', 	'BS_01',1,5000),
(2012611,'KS_203', 	'BS_02',1,18000),
(2012611,'KS_203', 	'BS_03',1,6000);
------------------------------------------------------------------
select * from Pembelian where No_Pasien like '%513' or Jumlah = 2;
------------------------------------------------------------------
create view Kasir_103 as 
select * from Pembelian where No_Pasien like '%513' or Jumlah = 2;
select * from Kasir_103;
------------------------------------------------------------------
select No_Pasien, count(No_Pasien) as Total_Pembelian from 
	Pembelian Group by No_Pasien;
------------------------------------------------------------------
create view Total_Pembelian as 
select No_Pasien, count(No_Pasien) as Total_Pembelian from 
	Pembelian Group by No_Pasien;
select * from Total_Pembelian;
------------------------------------------------------------------

select * from Pembelian;
==============================================================================================
/*Penyimpanan*/ /*Relasi*/
create table Penyimpanan (
	No_Gudang varchar(6) NOT NULL,
	ID_Petugas varchar (10) NOT NULL, 
	ID_Supplier varchar (10) NOT NULL, 
	ID_Obat varchar (10) NOT NULL, 
	Stock integer, 
	Tgl_Masuk date,
FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier),
FOREIGN KEY (ID_Obat) REFERENCES Obat(ID_Obat));

insert into Penyimpanan
values
('GDBS','GD_102','PT_001',	'BS_01',20,	'2019-02-06'),
('GDBS','GD_102','PT_001',	'BS_02',25,	'2019-02-06'),
('GDBS','GD_102','PT_002',	'BS_03',30,	'2019-04-21'),
('GDBS','GD_202','PT_004',	'BS_04',28,	'2020-07-08'),
('GDBT','GD_202','PT_006',	'BT_01',25,	'2019-09-27'),
('GDBT','GD_402','PT_007',	'BT_02',11,	'2019-10-05'),
('GDBT','GD_402','PT_007',	'BT_03',9,	'2019-10-05'),
('GDBK','GD_402','PT_009',	'BK_01',12,	'2019-12-07'),
('GDBK','GD_502','PT_010',	'BK_02',10,	'2020-01-11'),
('GDBK','GD_502','PT_010',	'BK_03',8,	'2020-01-11');
------------------------------------------------------------
select * from Penyimpanan where Tgl_Masuk like '2020%' 
	and ID_Supplier != 'PT_010' ;
------------------------------------------------------------
create view Tanggal_Masuk_2020 as
select * from Penyimpanan where Tgl_Masuk like '2020%' 
	and ID_Supplier != 'PT_010' ;
select * from Tanggal_Masuk_2020 ;
------------------------------------------------------------
select No_Gudang, sum(Stock) as Total_Stock from Penyimpanan 
	group by No_Gudang order by Total_Stock asc;
------------------------------------------------------------
create view Total_Stock as
select No_Gudang, sum(Stock) as Total_Stock from Penyimpanan 
	group by No_Gudang;
select * from Total_Stock ;
------------------------------------------------------------

select * from Penyimpanan;
drop table Penyimpanan;
==============================================================================================
/*Perawatan*/ /*Relasi*/
create table Perawatan (
	No_Kamar integer NOT NULL,
	ID_Dokter VARCHAR (10) NOT NULL,
	ID_Perawat VARCHAR (10) NOT NULL,
	No_Pasien INTEGER NOT NULL,
	Tgl_Masuk date,
	Tgl_Keluar date,
	Nama_Wali VARCHAR (15),
	No_Hp_Wali VARCHAR (20),
FOREIGN KEY (No_Kamar) REFERENCES Kamar_Rawat(No_Kamar),
FOREIGN KEY (ID_Dokter) REFERENCES Dokter(ID_Dokter),
FOREIGN KEY (ID_Perawat) REFERENCES Perawat(ID_Perawat),
FOREIGN KEY (No_Pasien) REFERENCES Pasien(No_Pasien));

INSERT INTO Perawatan
VALUES
(109,'MM_101','PR_1',2012211,	'2020-04-22','2020-05-02','Danny',	'6285261347208'),
(109,'MM_101','PR_7',2012211,  	'2020-04-22','2020-05-02','Danny',  '6285261347208'),
(109,'MM_102','PR_7',2012211,  	'2020-04-22','2020-05-02','Danny',  '6285261347208'),
(103,'TH_101','PR_9',2012212,  	'2020-08-14','2020-08-21','Andin',	'6281377154828'),
(103,'TH_102','PR_8',2012212,  	'2020-08-14','2020-08-21','Andin',	'6281377154828'),
(103,'GG_101','PR_10',2012311, 	'2020-09-27','2020-09-20','Sutyoso','6285370049999'),
(103,'BD_102','PR_10',2012311, 	'2020-09-27','2020-09-30','Sutyoso','6285370049999'),
(107,'NK_101','PR_2', 2012312,  '2020-10-11','2020-10-13','Ulfa',	'6285373605191'),
(107,'NK_102','PR_2', 2012313,  '2020-11-19','2020-11-26','Aprlia',	'6282367333755'),
(101,'MM_102','PR_8', 2012411,  '2020-12-05','2020-12-10','Joko',	'6281377441914');
-------------------------------------------------------------------------
select * from Perawatan where (No_Kamar = 103 or No_Hp_Wali like '62853%')
	and Tgl_Keluar > '2020-10-01';
-------------------------------------------------------------------------
create view tanggal_keluar_2020 as
select * from Perawatan where (No_Kamar = 103 or No_Hp_Wali like '62853%')
	and Tgl_Keluar > '2020-10-01';
select * from tanggal_keluar_2020;
-------------------------------------------------------------------------
select No_Kamar, count(distinct(No_Pasien)) as Total_Pasien from Perawatan 
	group by No_Kamar;
-------------------------------------------------------------------------
create view Total_Pasien as
select No_Kamar, count(distinct(No_Pasien)) as Total_Pasien from Perawatan 
	group by No_Kamar;
select * from Total_Pasien;
-------------------------------------------------------------------------

select * from Perawatan;
==============================================================================================
/*Pemeriksaan*/ /*Relasi*/
CREATE TABLE Pemeriksaan (
	ID_Dokter VARCHAR (10) NOT NULL,
	No_Pasien INTEGER NOT NULL,
	Penyakit VARCHAR (20),
	No_Resep VARCHAR (15) NOT NULL,
	ID_Obat VARCHAR (10) NOT NULL,
	Jumlah INTEGER,
	Biaya_Periksa INTEGER NOT NULL,
	Tgl_Periksa DATE NOT NULL,
FOREIGN KEY (ID_Dokter) REFERENCES Dokter(ID_Dokter),
FOREIGN KEY (No_Pasien) REFERENCES Pasien(No_Pasien),
FOREIGN KEY (No_Resep) REFERENCES Resep(No_Resep),
FOREIGN KEY (ID_Obat) REFERENCES Obat(ID_Obat));

insert into Pemeriksaan
values
('MM_101',2012211,'Demam',			'R_M1_01','BS_03',2,25000,	'2020-04-21'),
('MM_101',2012211,'Herpes',			'R_M1_01','BT_01',1,300000,	'2020-04-21'),
('MM_101',2012211,'Tipes',			'R_M1_01','BS_01',3,125000,	'2020-04-21'),
('TH_102',2012212,'Sinus',			'R_T2_01','BK_02',2,150000,	'2020-08-13'),
('TH_102',2012212,'Laringitis',		'R_T2_01','BK_03',2,200000,	'2020-08-13'),
('GG_101',2012311,'Gigi Berlubang',	'R_G1_01','BS_01',1,100000,	'2020-09-26'),
('GG_101',2012311,'Kista Gusi',		'R_G1_01','BK_01',2,150000,	'2020-09-26'),
('MM_101',2012312,'Flu', 			'R_M1_02','BT_03',3,50000,	'2020-10-10'),
('MM_102',2012313,'Alergi',			'R_M2_02','BT_02',2,55000,	'2020-11-18'),
('MM_102',2012411,'Anemia',			'R_M2_03','BS_04',1,40000,	'2020-12-04');
--------------------------------------------------------------------
select No_Pasien, Tgl_Periksa from Pemeriksaan where 
	ID_Dokter = 'MM_101' and ID_Obat = 'BS_03';
--------------------------------------------------------------------
create view Tgl_2012211 as
select No_Pasien, Tgl_Periksa from Pemeriksaan where 
	ID_Dokter = 'MM_101' and ID_Obat = 'BS_03';
select * from Tgl_2012211;
--------------------------------------------------------------------
select No_Resep, sum(Biaya_Periksa) as Total_Biaya_Periksa 
	from Pemeriksaan group by No_Resep order by Total_Biaya_Periksa;
--------------------------------------------------------------------
create view Total_Biaya_Periksa as
select No_Resep, sum(Biaya_Periksa) as Total_Biaya_Periksa 
	from Pemeriksaan group by No_Resep ;
select * from Total_Biaya_Periksa;
--------------------------------------------------------------------

select * from Pemeriksaan;
==============================================================================================
/*Pembayaran*/ /*Relasi*/
CREATE TABLE Pembayaran (
	No_Pasien INTEGER NOT NULL,
	No_Kamar INTEGER NOT NULL,
	ID_Petugas VARCHAR (10) NOT NULL,
	No_Resep VARCHAR (15) NOT NULL,
	Nama_Pasien VARCHAR (15),
	Tgl_Bayar DATE NOT NULL,
	Lama_Inap INTEGER,
	Total_Harga_Kamar INTEGER NOT NULL,
	Harga_Resep INTEGER NOT NULL,
	Harga_Total_Pemeriksaan INTEGER NOT NULL,
FOREIGN KEY (No_Pasien) REFERENCES Pasien(No_Pasien),
FOREIGN KEY (No_Kamar) REFERENCES Kamar_Rawat(No_Kamar),
FOREIGN KEY (ID_Petugas) REFERENCES Petugas(ID_Petugas),
FOREIGN KEY (No_Resep) REFERENCES Resep(No_Resep));

INSERT INTO Pembayaran
VALUES
(2012211,109,'KS_103','R_M1_01','Bambang',	'2020-05-02',10,5000000,52000,	450000),
(2012212,103,'KS_103','R_T2_01','Januar',	'2020-08-21',7,1400000,	180000, 350000),
(2012311,103,'KS_203','R_G1_01','Rani',		'2020-09-30',3,600000,	95000,	250000),
(2012312,107,'KS_103','R_M1_02','Latifa',	'2020-10-13',2,300000,	54000,	50000),
(2012313,107,'KS_103','R_M2_02','Yoga',		'2020-11-26',7,1050000, 42000,	55000),
(2012411,101,'KS_203','R_M2_03','Malik',	'2020-12-10',5,1750000, 10500,	40000);
----------------------------------------------------------------------------
select No_Pasien, Lama_Inap, Total_Harga_Kamar, Harga_Total_Pemeriksaan from 
	Pembayaran where (Lama_Inap < 8 or Total_Harga_Kamar < 1400000) 
	and Harga_Total_Pemeriksaan < 55000;
----------------------------------------------------------------------------
create view Total_Pemeriksaan as
select No_Pasien, Lama_Inap, Total_Harga_Kamar, Harga_Total_Pemeriksaan from 
	Pembayaran where (Lama_Inap < 8 or Total_Harga_Kamar < 1400000) 
	and Harga_Total_Pemeriksaan < 55000;
select * from Total_Pemeriksaan ;
----------------------------------------------------------------------------
select ID_Petugas, count(No_Pasien) as Total_Pasien from Pembayaran
	group by ID_Petugas;
----------------------------------------------------------------------------
create view Total_Pasien2 as
select ID_Petugas, count(No_Pasien) as Total_Pasien from Pembayaran
	group by ID_Petugas;
select * from Total_Pasien2 ;
----------------------------------------------------------------------------
select * from Pembayaran;

select * from Pembayaran;
==============================================================================================
/*Meracik*/ /*Relasi*/
CREATE TABLE Meracik (
	No_Resep VARCHAR (15) NOT NULL,
	ID_Petugas VARCHAR (10) NOT NULL,
	ID_Obat VARCHAR (10) NOT NULL,
	Jumlah_Obat INTEGER,
FOREIGN KEY (No_Resep) REFERENCES Resep(No_Resep),
FOREIGN KEY (ID_Petugas) REFERENCES Petugas(ID_Petugas),
FOREIGN KEY (ID_Obat) REFERENCES Obat(ID_Obat));

INSERT INTO Meracik
VALUES
('R_M1_01',	'AP_101',	'BS_03',	2),
('R_M1_01',	'AP_101',	'BT_01',	1),
('R_M1_01',	'AP_101',	'BS_01',	3),
('R_T2_01',	'AP_301',	'BK_02',	2),
('R_T2_01',	'AP_301',	'BK_03',	2),
('R_G1_01',	'AP_201',	'BS_01',	1),
('R_G1_01',	'AP_201',	'BK_01',	2),
('R_M1_02',	'AP_301',	'BT_03',	3),
('R_M2_02',	'AP_301',	'BT_02',	2),
('R_M2_03',	'AP_301',	'BS_04',	1);
------------------------------------------------------------------------
select * from Meracik where (ID_Petugas = 'AP_301' and ID_Obat = 'BK_02') 
	or (ID_Petugas = 'AP_301' and ID_Obat = 'BT_02');
------------------------------------------------------------------------
create view Jumlah_Obat_AP_301 as
select * from Meracik where (ID_Petugas = 'AP_301' and ID_Obat = 'BK_02') 
	or (ID_Petugas = 'AP_301' and ID_Obat = 'BT_02');
select * from Jumlah_Obat_AP_301;
------------------------------------------------------------------------
select ID_Petugas, count(ID_Obat) as Total_Racikan from Meracik
	group by ID_Petugas;
------------------------------------------------------------------------
create view Total_Racikan as
select ID_Petugas, count(ID_Obat) as Total_Racikan from Meracik
	group by ID_Petugas;
select * from Total_Racikan;
------------------------------------------------------------------------
select * from Meracik;

select * from Meracik;
==============================================================================================
						/*Keluarga Join*/
/*Pembayaran*/
select Pembayaran.Nama_Pasien, Petugas.Nama_Petugas, Pembayaran.Tgl_Bayar
from Petugas left Join Pembayaran
on Petugas.ID_Petugas = Pembayaran.ID_Petugas where Nama_Pasien is NOT NULL;

/*Perawatan*/
select distinct Kamar_Rawat.No_Kamar, Kamar_Rawat.Nama_Kamar, 
Perawatan.No_Pasien 
from Kamar_Rawat right outer join Perawatan 
on Kamar_Rawat.No_Kamar = Perawatan.No_Kamar;

select distinct Kamar_Rawat.No_Kamar, Kamar_Rawat.Nama_Kamar, 
Perawatan.No_Pasien 
from Kamar_Rawat left join Perawatan 
on Kamar_Rawat.No_Kamar = Perawatan.No_Kamar where No_Pasien is NULL;

/*Meracik*/
select distinct Resep.No_Resep, Resep.Harga_Resep, Meracik.ID_Petugas 
from Resep inner join Meracik 
on Resep.No_Resep = Meracik.No_Resep;

/*pemeriksaan*/
select Dokter.ID_Dokter, Dokter.Nama_Dokter, 
Pemeriksaan.Penyakit, Pemeriksaan.Tgl_Periksa
from Dokter right join Pemeriksaan
on Dokter.ID_Dokter = Pemeriksaan.ID_Dokter;

/*Pembelian*/
select Pasien.Nama_Pasien, Sum (Pembelian.Harga_Total) as Harga_Total_Pasien
from Pasien right join Pembelian
on Pasien.No_Pasien = Pembelian.No_Pasien group by Nama_Pasien;

/*Penyimpanan*/
select Supplier.ID_Supplier, Supplier.Nama_Supplier, Penyimpanan.ID_Obat 
from Supplier full join Penyimpanan 
on Supplier.ID_Supplier = Penyimpanan.ID_Supplier;

select penyimpanan.No_Gudang, penyimpanan.ID_Obat, .supplier.Nama_Supplier
from penyimpanan inner join supplier 
on supplier.id_supplier = penyimpanan.id_supplier;
==============================================================================================


10.0 (Final)
Note:
id = ID
no = No
semua dibikin kapital
tanggal tunggal gw bikin 0x, biar rapi



==============================================================================================
select *, (Total_Harga_Kamar + Harga_Resep + Harga_Total_Pemeriksaan) 
as total from Pembayaran;
---------------------------------------------------------------------------------
/*sampah*/
(No_Kamar, Nama_Kamar, Jenis_Kamar, Biaya_/_Malam, Jumlah_Kasur)
(ID_Perawat, Nama_Perawat, Spesialis, Alamat, No_Handphone, Shift)
(no_pasien, nama_pasien, alamat, no_handphone)
(id_dokter, nama_dokter, spesialis, alamat, no_handphone, shift)
(id_obat, nama_obat, jenis_obat, tanggal_masuk, tanggal_kadarluasa, stock, harga)
(id_petugas, nama_petugas, alamat, no_handphone, shift, posisi)
(id_petugas, id_supplier, id_obat, stock, tgl_masuk)
(id_supplier, nama_supplier, no_telepon, jenis_obat, tanggal_pesan, jumlah)
select * from Obat where (Harga > 7000 or Stock >20) and Nama_Obat like 'A%'; (tidak dipakai)
select Tgl_Bayar from Pembayaran where ID_Petugas = 'KS_103' and No_Kamar = 107;
select ID_Dokter, No_Pasien, ID_Obat from Pemeriksaan where 
	ID_Obat = 'BS_01' or ID_Obat = 'BT_01';
select * from Perawatan where ID_Dokter = 'MM_102' and No_Pasien = 2012211 ;
select * from Penyimpanan where Stock < 10 or ID_Supplier = 'PT_007' ;
select * from Pembelian where Jumlah = 1 and Harga_Total <= 6000;
select * from Resep where No_Resep like 'R_M1%' or Harga_Resep < 50000 ;
select * from Supplier where Jenis_Obat = 'Obat Bebas' and Tanggal_Pesan is NULL ;
select * from Petugas where ID_Petugas like '%02' and Shift = 'Siang';
select * from Obat where ID_Obat not like 'BT%' and Tanggal_Masuk like '%-01-%';
select * from Dokter where No_Handphone like '%7' or Spesialis = 'Umum' ;
select * from Dokter where ID_Dokter like '%102' and Shift = 'Siang' ;
select * from Pasien where Golongan_Darah = 'A' and Alamat like 'Jl. M%' ;
select * from Pasien where No_Handphone like '%7' and Status = 'inap' ;
select * from Pasien where Golongan_Darah = 'B' or Status = 'tidak inap' ;
select * from Pasien where Golongan_Darah = 'A' or Alamat like '%No.12' ;
select * from Perawat where Alamat like 'Jl. H%' or Shift = 'Siang';
select * from Perawat where Nama_Perawat like 'A%' or Spesialis = 'Medikal';
select * from Perawat where Shift = 'Malam' or Spesialis = 'Medikal';
select * from Perawat where No_Handphone like '62852%' and Shift = 'Malam';
Select * from Kamar_Rawat where Biaya_per_Malam > 350000 or Jumlah_Kasur < 2;
select * from Kamar_Rawat where Nama_Kamar like 'M%' and Jumlah_Kasur = 1;
select * from Kamar_Rawat where Nama_Kamar like 'A%' and Jumlah_Kasur = 2;
select sum (Total_Harga_Kamar + Harga_Resep + Harga_Total_Pemeriksaan)
as Total_Bayar from Pembayaran where No_Pasien
= 2012211 , No_Pasien = 2012212 , No_Pasien = 2012311;

create view Bebe as
	select sum (Total_Harga_Kamar + Harga_Resep + Harga_Total_Pemeriksaan)
	as Total_Bayar from Pembayaran where No_Pasien = 2012211;
select * from Bebe;

-----------------------------------------------------------------
				/*Keluarga Besar Join Right dan Left*/
-----------------------------------------------------------------

(di perawatan, pengen tahu nama kamar tiap pasien inap)

select Kamar_Rawat.No_Kamar, Kamar_Rawat.Nama_Kamar, Perawatan.No_Pasien 
from Kamar_Rawat full join Perawatan 
on Kamar_Rawat.No_Kamar = Perawatan.No_Kamar;
(di perawatan pengen tau nama kamar apa yg gk dipake)

select Kamar_Rawat.No_Kamar, Kamar_Rawat.Nama_Kamar, Perawatan.No_Pasien 
from Kamar_Rawat join Perawatan 
on Kamar_Rawat.No_Kamar = Perawatan.No_Kamar; (Sama right join)
(di perawatan pengen tau nama kamar apa yg gk dipake)

select Dokter.ID_Dokter, Dokter.Nama_Dokter, Perawatan.No_Pasien 
from Dokter right join Perawatan 
on Dokter.ID_Dokter = Perawatan.ID_Dokter;
(di perawatan pengen tau nama dokter tiap pasien)

select Perawat.ID_Perawat, Perawat.Nama_Perawat, Perawatan.No_Pasien 
from Perawat right join Perawatan 
on Perawat.ID_Perawat = Perawatan.ID_Perawat;
(di perawatan pengen tau nama perawat tiap pasien)

select Pasien.No_Pasien, Pasien.Nama_Pasien, Perawatan.No_Pasien 
from Pasien right join Perawatan 
on Pasien.No_Pasien = Perawatan.No_Pasien;
(di perawatan pengen tau nama pasien tiap pasien)
---------------------------------------------------------------------
/*Shift*/
select Perawat.Shift, Perawat.Nama_Perawat, 
Dokter.Shift, Dokter.Nama_Dokter
from Perawat inner join Dokter 
on Perawat.Shift = Dokter.Shift;
(perawat dan dokter yg shift sama) (Panjang)
----------------------------------------------------------------------
/*Meracik*/ (1)

(Di meracik, pengen tahu harga racikan tiap resep)

select Distinct Petugas.Posisi, Petugas.Nama_Petugas, Meracik.No_Resep 
from Petugas right join Meracik 
on Petugas.ID_Petugas = Meracik.ID_Petugas;
(Di meracik, pengen tahu nama petugas dan posisi)

select Meracik.ID_Petugas, Obat.ID_Obat, Obat.Nama_Obat
from Obat right join Meracik 
on Obat.ID_Obat = Meracik.ID_Obat;
(Di meracik, pengen tahu nama obat yg diracik tiap apoteker)
----------------------------------------------------------------
/*Supplier*/ (Gk Guna)
select distinct Supplier.ID_Supplier, Supplier.Nama_Supplier, Obat.Jenis_obat 
from Supplier right join Obat 
on Obat.Jenis_obat = Supplier.Jenis_Obat;
(Di penyimpanan, pengen tahu nama-nama petugas dan ID_Obatnya)
----------------------------------------------------------------
/*Penyimpnan*/ (2)
select Petugas.ID_Petugas, Petugas.Nama_Petugas, Penyimpanan.ID_Obat 
from Petugas right join Penyimpanan 
on Petugas.ID_Petugas = Penyimpanan.ID_Petugas;
(Di penyimpanan, pengen tahu nama-nama petugas dan ID_Obatnya)


(di penyimpanan, pengen tau nama perusahaan supplier)

select Penyimpanan.No_Gudang, Obat.ID_Obat, Obat.Nama_Obat, Penyimpanan.Stock
from Obat right join Penyimpanan 
on Obat.ID_Obat = Penyimpanan.ID_Obat;
(di penyimpanan, pengen tau nama obat tiap gudang)
----------------------------------------------------------------
/*Pembelian*/ (1)

(di pembelian, pegen tahu nama pasien dan harga obatnya)

select Petugas.Nama_Petugas,  sum (Pembelian.Harga_Total)
from Petugas right join Pembelian
on Petugas.ID_Petugas = Pembelian.ID_Petugas group by Nama_Petugas;
(di pembelian, pengen tahu berapa banyak uang trasaksi tiap kasir)
(catatan sama) Petugas.ID_Petugas

select Obat.ID_Obat, Obat.Nama_Obat, Pembelian.Harga_Total
from Obat right join Pembelian
on Obat.ID_Obat = Pembelian.ID_Obat;
(dipembelian, pengen tahu berapa harga tiap obat yg dibeli pasien tidak inap)
----------------------------------------------------------------
/*Pemeriksaan*/

(di pemeriksaan, pengen tahu nama dokter nemu penyakit dan tgl tugas)

select Pasien.Nama_Pasien, Pemeriksaan.Penyakit, Pemeriksaan.Biaya_Periksa
from Pasien right join Pemeriksaan
on Pasien.No_Pasien = Pemeriksaan.No_Pasien;
(di pemeriksaan, pengen tahu harga tiap penyakit yg diperiksa)
-----------------------------------------------------------------
/*Pembayaran*/
select Pembayaran.Nama_Pasien, Kamar_Rawat.Nama_Kamar, 
Kamar_Rawat.Jenis_Kamar, Pembayaran.Tgl_Bayar, 
Pembayaran.Lama_Inap, Pembayaran.Total_Harga_Kamar
from Kamar_Rawat right join Pembayaran
on Kamar_Rawat.No_Kamar = Pembayaran.No_Kamar;
(di Pembayaran, mencari info lengkap kamar tiap pasien inap)


(di pembayaran, pengen tahu nama kasirnya dan kapan bayar)
-----------------------------------------------------------------

/*Join Laras Opsi*/
Select distinct Pemeriksaan.ID_Dokter, Pemeriksaan.No_Resep, Resep.Harga_Resep 
from Pemeriksaan right join Resep 
on Pemeriksaan.No_Resep=Resep.No_Resep;

/*Nafi Join Opsi*/
select Obat.ID_Obat, Obat.Nama_obat,  Obat.Jenis_obat, supplier.jumlah 
from obat inner join supplier
on obat.jenis_obat = supplier.jenis_obat;

/*Laras Opsi*/
Select Petugas.Nama_Petugas, Petugas.Posisi, Penyimpanan.No_Gudang 
from Petugas full outer join Penyimpanan 
on Petugas.ID_Petugas = Penyimpanan.ID_Petugas ;














