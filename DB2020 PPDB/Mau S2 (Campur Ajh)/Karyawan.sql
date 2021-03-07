create table Karyawan (
	KODE varchar(5), 
	NAMA varchar(10), 
	JABATAN varchar(11), 
	ALAMAT varchar(10),
	PENDIDIKAN varchar(5), 
	GOL varchar(5), 
	GAJI decimal(14,2));

insert into karyawan values
('OA1','ANDI',	'DIREKTUR',		'JAKARTA',	'S3','3A',25000000.00),
('OA3','ANTON',	'SEKRETARIS',	'SURABAYA',	'S2','A2',20000000.00),
('OA2','DEWI',	'HUMAS',		'SEMARANG',	'S1','1A',15000000.00),
('OA1','SINTA',	'PERSONALIA',	'BOGOR',	'D3','3B',10000000.00),
('OA3','RUDI',	'PEMBANTU',		'DEPOK',	'SMK','3C',5000000.00),
('OA4','BUDI',	'PRODUKSI',		'SUKABUMI',	'S1','1A',15000000.00),
('OA2','NOVI',	'FINISHING',	'CILACAP',	'D3','3B',10000000.00),
('OA5','CITRA',	'PACKING',		'BANTEN',	'SMK','3B',5000000.00);

select * from Karyawan;
drop table Karyawan;

select * from Karyawan order by KODE asc;
select * from Karyawan order by PENDIDIKAN;
select PENDIDIKAN, SUM(GAJI) as UPAH from Karyawan GROUP BY PENDIDIKAN;
select PENDIDIKAN from Karyawan GROUP BY PENDIDIKAN;