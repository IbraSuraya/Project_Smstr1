create table Gaji (
	Golongan integer,
	"Gaji Pokok" decimal(15),
	"Tunjangan Istri" decimal(15),
	"Tunjangan Anak" decimal(15),
	"Tunjangan Transport" decimal(15),
	"Tunjangan Makan" decimal(10)
);
========================================================
insert into Gaji(
	Golongan,
	"Gaji Pokok",
	"Tunjangan Istri",
	"Tunjangan Anak",
	"Tunjangan Transport",
	"Tunjangan Makan")
values
(1,1500000,	100000,	75000,	80000,	150000),
(2,1750000,	100000,	75000,	80000,	150000),
(3,2000000,	100000,	75000,	80000,	150000);
=========================================================
select * from Gaji;
drop table Gaji;
=========================================================
/*Max x Min*/
select 
	MAX("Gaji Pokok") as "Pokok Tertinggi", 
	MIN("Gaji Pokok") as "Pokok Terendah" 
from Gaji;

/*Catatan Kombinasi*/
select MAX("Gaji Pokok") as "Pokok Tertinggi" from Gaji;
select MIN("Gaji Pokok") as "Pokok Terendah" from Gaji;
select sum("Gaji Pokok") as "Total Pokok" from Gaji;
select sum("Tunjangan Anak") as "Total Anak" from Gaji;
select sum("Tunjangan Istri") as "Total Istri" from Gaji;
select sum("Tunjangan Makan") as "Total Makan" from Gaji;
select sum("Tunjangan Transport") as "Total Transport" from Gaji;

/*Catatan Kombinasi*/
select 
	sum("Gaji Pokok")*6 as "Total Pokok",
	sum("Tunjangan Istri")*6 as "Total Istri",
	sum("Tunjangan Anak")*6 as "Total Anak",
	sum("Tunjangan Makan")*6 as "Total Makan",
	sum("Tunjangan Transport")*6 as "Total Transport",
	sum("Tunjangan Istri"+
		"Tunjangan Anak"+
		"Tunjangan Makan"+
		"Tunjangan Transport")*6 as "Total Tunjangan",
	sum("Gaji Pokok"+
		"Tunjangan Istri"+
		"Tunjangan Anak"+
		"Tunjangan Makan"+
		"Tunjangan Transport")*6 as "Total Penguluaran Perusahaan"
from Gaji where golongan=3;