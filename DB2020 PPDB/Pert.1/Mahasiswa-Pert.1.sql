create table Mahasiswa(
	NIM integer,
	NAMA varchar(15),
	TGLLAHIR varchar(15),
	Domisili varchar (15),
	Keterangan varchar(15));
===============================================================
insert into Mahasiswa(NIM,NAMA,TGLLAHIR,Domisili,Keterangan)
values
(2010511001,'Ibra','18Nov','jakarta','Sehat'),
(2010511002,'Abri','17Apr','Bandung','Sehat');
===============================================================
select * from Mahasiswa;
==============================================================
/*AT add = Nambah Kolom*/
alter table Mahasiswa add Asal_SMA char(15);
update Mahasiswa set Asal_SMA='51' where NIM=2010511001;
update Mahasiswa set Asal_SMA=66 where NIM=2010511002;

/*AT drop = apus kolom*/
alter table Mahasiswa drop column Asal_SMA;

/*AT modify = ubah tipe data*/
alter table Mahasiswa modify Asal_SMA varchar(5);	/*gk bisa di soft ini*/
alter table Mahasiswa alter column Asal_SMA integer;

/*AT change = ganti nama kolom*/
ALTER TABLE Mahasiswa change COLUMN Domisili TO Lokasi;		/*Gagal*/
ALTER TABLE Mahasiswa rename COLUMN Domisili TO Lokasi;		/*Gagal*/

/*AT ditengah-tengah*/
ALTER TABLE Mahasiswa ADD Status varchar(10) next Domisili;	/*Gagal*/
ALTER TABLE Mahasiswa ADD Status varchar(10) after Domisili;/*Gagal*/

/*AT rename = ganti nama tabel*/	/*Keknya karna ini server*/
ALTER TABLE Mahasiswa RENAME TO Mahasiswa1;		/*Gagal*/
ALTER TABLE Mahasiswa change TO Mahasiswa1;		/*Gagal*/
=========================================================================
/*Drop Table = Apus Table*/
DROP TABLE Mahasiswa;

/*Drop database = Apus database*/
DROP DATABASE blablaba;
=========================================================================