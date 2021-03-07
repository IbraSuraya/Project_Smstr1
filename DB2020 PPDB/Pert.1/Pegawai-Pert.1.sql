create table Pegawai (
	No integer,
	Nama_Karyawan varchar(20),
	Golongan integer,
	Alamat varchar(20),
	Status varchar(10),
	Jumlah_Anak decimal(5)
);
=======================================================================
insert into Pegawai(No,Nama_Karyawan,Golongan,Alamat,Status,Jumlah_Anak)
values
(1,'ANDRI',		1,'Jl.Apel',	'Kawin',3),
(2,'KEVIN',		2,'Jl.Dukuh',	'Kawin',2),
(3,'AKBAR',		1,'Jl.Merkis',	'Belum',0),
(4,'RADIT',		3,'Jl.Durian',	'Kawin',2),
(5,'SULTAN',	1,'Jl.Kita',	'Belum',0),
(6,'FREDY',		2,'Jl.Sama',	'Belum',0),
(7,'AHMAD',		2,'Jl.Jeruk',	'Belum',0),
(8,'ALFONS',	2,'Jl.Singgah',	'Belum',0),
(9,'FIKRI',		1,'Jl.Sana',	'Kawin',1),
(10,'ROMMY',	1,'Jl.Sini',	'Kawin',2),
(11,'HANDRI',	3,'Jl.Mana',	'Belum',0),
(12,'ROLAN',	3,'Jl.Ajah',	'Kawin',3),
(13,'ANWAR',	2,'Jl.Dukuh',	'Kawin',3),
(14,'RISKIYAH',	3,'Jl.Apel',	'Kawin',2),
(15,'NISSA',	2,'Jl.Merkis',	'Kawin',4),
(16,'KUSUMAWATI',		1,'Jl.Kita',	'Belum',0),
(17,'EDI MARUDI',		3,'Jl.Lama',	'Kawin',2),
(18,'RICKIWIYANSYAH',	2,'Jl.Durian',	'Belum',0),
(19,'PANJAITAN',		1,'Jl.Singgah',	'Kawin',2),
(20,'ZINEDINE',			3,'Jl.Kita',	'Kawin',1);
================================================================
select * from Pegawai;
================================================================
/*avg*/
Use "DB2020 PPDB"
select avg(Jumlah_Anak) as Rata from Pegawai;

/*SUM*/
select sum(Jumlah_Anak) as Total_Anak from Pegawai;

/*Count*/
select count(No) as Total_Pegawai from Pegawai;
================================================================