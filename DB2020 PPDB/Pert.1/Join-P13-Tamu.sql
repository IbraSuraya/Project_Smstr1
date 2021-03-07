create database "DB2020 PPDB";
=========================================================
create table A131 (x varchar(255) primary key);
create table B131 (y varchar(255) primary key);
=========================================================
insert into A131 values 
	('Amy'), ('John'), ('Lisa'), ('Marco'), ('Phil');
insert into B131 values
	('Lisa'), ('Marco'), ('Phil'), ('Tim'), ('Vincent');
=========================================================
select * from A131;
select * from B131;

/*Right*/
select * from A131 right join B131 on x=y; Sama select * from A131 right join B131 on y=x; 
select * from B131 right join A131 on x=y; Sama select * from B131 right join A131 on y=x;		//Left Join yang dibalik
select * from A131 right join B131 on x=x;		select * from B131 right join A131 on x=x;
select * from A131 right join B131 on y=y;		select * from B131 right join A131 on y=y;
select * from A131 right join A131 on x=y;	/*Gagal*/

/*Full*/
select * from A131 full join B131 on x=y;	Sama	select * from A131 full join B131 on y=x;
select * from B131 full join A131 on x=y;	Sama	select * from B131 full join A131 on y=x;
select * from A131 full join A131 on x=y;	/*Gagal*/

/*Left*/
select * from A131 left join B131 on x=y; Sama	select * from A131 left join B131 on y=x; 
select * from B131 left join A131 on x=y; Sama	select * from B131 left join A131 on y=x;		//Right Join yang dibalik
select * from A131 left join B131 on x=x;		select * from B131 left join A131 on x=x;
select * from A131 left join B131 on y=y;		select * from B131 left join A131 on y=y;
select * from A131 left join A131 on x=y;		/*Gagal*/
select * from A131 left join B131 on x=y UNION; /*Gagal*/

/*Inner*/
select * from A131 join B131 on x=y;	Sama	select * from A131 join B131 on y=x;
select * from B131 join A131 on x=y;	Sama	select * from B131 join A131 on y=x;
select * from A131 join B131 on x=x;			select * from A131 join B131 on y=y;
select * from A131 join A131 on x=y;	/*Gagal*/
select * from A131 inner join B131 on x=y;

/*Kombinasi*/
select * from A131 left join B131 on x=y UNION
select * from A131 right join B131 on x=y;

select * from A131 right join B131 on x=y UNION
select * from A131 left join B131 on x=y;



