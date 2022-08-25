create table TPlace(pid varchar(20) primary key,
Pname varchar(40),
State varchar(50),
km int(10));

tourist;
create table Tourist(
Id varchar(20) primary key,
Name varchar(50),
age int(10),
country varchar(50));

VISITD

create table Visited(pid varchar(20) references TPlace(pid),
ID varchar(20) references Tourist(Id),
vdate date,
primary key(pid,ID));

EMAIL

create table email(ID varchar(20) references Tourist(Id),
email varchar(20),
primary key(id,email));


mysql> show tables;
+-----------------------------+
| Tables_in_VP21MC002_Tourist |
+-----------------------------+
| TPlace                      |
| Tourist                     |
| Visited                     |
| email                       |
+-----------------------------+
4 rows in set (0.00 sec)

mysql> desc TPlace;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| pid   | varchar(20) | NO   | PRI | NULL    |       |
| Pname | varchar(40) | YES  |     | NULL    |       |
| State | varchar(50) | YES  |     | NULL    |       |
| km    | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> desc Tourist;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Id      | varchar(20) | NO   | PRI | NULL    |       |
| Name    | varchar(50) | YES  |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| country | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)



mysql> desc Visited;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| pid   | varchar(20) | NO   | PRI | NULL    |       |
| ID    | varchar(20) | NO   | PRI | NULL    |       |
| vdate | date        | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)


mysql> desc email;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| ID    | varchar(20) | NO   | PRI | NULL    |       |
| email | varchar(20) | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

insert into email values('T01','akash@gmail.com');
insert into email values('T02','chandan@gmail.com');
insert into email values('T03','mayur@gmail.com');
insert into email values('T04','prakash@gmail.com');
insert into email values('T05','suresh@gmail.com');

inserting datas;



insert into TPlace values('P01','Kokkada','Karnataka','280');
insert into TPlace values('P07','Bangalore','Karnataka','80');
insert into TPlace values('P02','Pondichery','Kerala','400');
insert into TPlace values('P03','puri','MP','680');
insert into TPlace values('P04','Mantralaya','AndraPradesh','500');
insert into TPlace values('P05','Coibattur','Tamilnadu','780');
insert into TPlace values('P06','Gateway','Delhi','90');


inserting to tourist


insert into Tourist values('T01','Akash','24','India');
insert into Tourist values('T02','Chandan','21','India');
insert into Tourist values('T03','Mayur','20','India');
insert into Tourist values('T04','Anu','24','India');
insert into Tourist values('T05','Prakash','20','India');
insert into Tourist values('T06','Suresh','24','Pakisthan');

inserting to visited;

insert into Visited values('P01','T01','2000-12-12');
insert into Visited values('P01','T01','2009-12-18');
insert into Visited values('P03','T02','2000-12-12');
insert into Visited values('P04','T03','2003-01-12');
insert into Visited values('P05','T04','2003-02-12');
insert into Visited values('P01','T04','2002-13-12');
insert into Visited values('P06','T02','2001-14-12');
insert into Visited values('P07','T01','2001-14-12');
alter table Visited add primary key(pid,ID,vdate); 
alter table Visited drop primary key; 




QUREYS
:
1)
select state,count(pid) from TPlace group by state order by count(pid) desc limit 1;
mysql> select state,count(pid) from TPlace group by state order by count(pid) desc limit 1;
+-----------+------------+
| state     | count(pid) |
+-----------+------------+
| Karnataka |          2 |
+-----------+------------+
1 row in set (0.01 sec)


select tp.pid,tp.Pname,tp.state,count(v.ID)from TPlace tp,Visited v where v.pid=tp.pid group by v.pid order by count(v.pid)desc limit 1;

mysql> select tp.pid,tp.Pname,tp.state,count(v.ID)from TPlace tp,Visited v where v.pid=tp.pid group by v.pid order by count(v.pid)desc limit 1;
+-----+---------+-----------+-------------+
| pid | Pname   | state     | count(v.ID) |
+-----+---------+-----------+-------------+
| P01 | Kokkada | Karnataka |           3 |
+-----+---------+-----------+-------------+
1 row in set (0.00 sec)

select  * from Tourist where Id in(select ID from Visited where pid in(select pid from TPlace where state='Karnataka'));
mysql> select  * from Tourist where Id in(select ID from Visited where pid in(select pid from TPlace where state='Karnataka'));
+-----+-------+------+---------+
| Id  | Name  | age  | country |
+-----+-------+------+---------+
| T01 | Akash |   24 | India   |
+-----+-------+------+---------+
1 row in set (0.00 sec)

