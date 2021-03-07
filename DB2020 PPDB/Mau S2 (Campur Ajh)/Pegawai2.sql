create table Pegawai2 (
	NIM integer not null,
	Nama varchar(20) not null,
	Alamat varchar(20) not null);

create UNIQUE INDEX ID_Pegawai on Pegawai2(NIM);		//Bingung cara tampilin

insert into Pegawai2 values
(20101,'Ibra',	'Dana'),
(20102,'Hasan',	'Warga'),
(20103,'Suraya','Darwar');
(20104,'Maul',	'Pusdikes'),
(20105,'Radit',	'Batu');

select * from Pegawai2;
select Alamat from Pegawai2 where NIM=20103;
select Nama from Pegawai2;
select * from Pegawai2 where NIM=20104;
create view "Data 104" as
	select * from Pegawai2 where NIM=20104;
select * from  "Data 104";

ALTER TABLE Pegawai2 ADD Goldar VARCHAR(3) NULL, Angka INT NULL ;
ALTER TABLE Pegawai2 DROP COLUMN Goldar, Angka;
/*Solusi
- Langsung sisip di tengah
- butuh variable tampung
- mindahin posisi tiap tiap kolom
- biarin berantaka, nanti tinggal di view*/

Update Pegawai2 set Alamat='Karya' where NIM=20103;
delete from Pegawai2 where NIM=20103;
delete from Pegawai2;
drop table Pegawai2;