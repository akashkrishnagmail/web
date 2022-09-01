create table constituency (cons_id varchar(20) primary key,
csname varchar(50),
state varchar(50),
nofvote number(10));


insert into constituency values('c01','manjeshwara','kerala',36000);
insert into constituency values('c02','puttur','karnataka',76000);
insert into constituency values('c03','kadaba','karnataka',66000);
insert into constituency values('c04','manthralaya','Andrapradesh',716000);
insert into constituency values('c05','sethankoli','telangana',16000);

create table Party(pid varchar(20) primary key,
pname varchar(20),
Symbol varchar(20));
insert into Party values('p01','bjp','flower');
insert into Party values('p02','congress','hand');
insert into Party values('p03','AAp','bromstick');
insert into Party values('p04','jds','women');



create table Candidate( canid varchar(20) primary key,
name varchar(20),
phone int(10),
age int(10),
state varchar(50),
pid varchar(20) references Party(pid));

insert into Candidate values('cno1','akash',990032278,20,'karnataka','p01');
insert into Candidate values('cno2','chandan',990932278,25,'kerala','p02');
insert into Candidate values('cno3','mayur',999032278,23,'ap','p03');
insert into Candidate values('cno4','suresh',990032278,29,'telangana','p04');




create table Voter(vid varchar(20) primary key,
name varchar(50),
age int(10),
address varchar(40),
cons_id varchar(20) references constituency(cons_id),
candidate varchar(20) references Candidate(canid));

insert into Voter values('v01','akash',21,'kokkada','co01','cno1');
insert into Voter values('v02','prakash',20,'kasaragoad','co02','cno2');
insert into Voter values('v03','suresh',29,'vitla','co03','cno3');
insert into Voter values('v04','ramesh',30,'koibattur','co04','cno4');
insert into Voter values('v05','ramesh',21,'kokkada','co01','cno1');
insert into Voter values('v06','mayyanna',21,'kokkada','co02','cno1');






create table counts(cons_id varchar(20) references constituency(cons_id),
candid varchar(20) references candidate(canid),
primary key(cons_id,candid));

insert into counts values('c01','cn01');
insert into counts values('c02','cn01');
insert into counts values('c01','cn04');
insert into counts values('c03','cn01');
insert into counts values('c01','cn03');





mysql> select * from constituency;
+---------+-------------+--------------+---------+
| cons_id | csname      | state        | nofvote |
+---------+-------------+--------------+---------+
| c01     | manjeshwara | kerala       |   36000 |
| c02     | puttur      | karnataka    |   76000 |
| c03     | kadaba      | karnataka    |   66000 |
| c04     | manthralaya | Andrapradesh |  716000 |
| c05     | sethankoli  | telangana    |   16000 |
+---------+-------------+--------------+---------+
5 rows in set (0.00 sec)
mysql> select * from Party;
+-----+----------+-----------+
| pid | pname    | Symbol    |
+-----+----------+-----------+
| p01 | bjp      | flower    |
| p02 | congress | hand      |
| p03 | AAp      | bromstick |
| p04 | jds      | women     |
+-----+----------+-----------+
4 rows in set (0.00 sec)

+-------+---------+-----------+------+-----------+------+
| canid | name    | phone     | age  | state     | pid  |
+-------+---------+-----------+------+-----------+------+
| cno1  | akash   | 990032278 |   20 | karnataka | p01  |
| cno2  | chandan | 990932278 |   25 | kerala    | p02  |
| cno3  | mayur   | 999032278 |   23 | ap        | p03  |
| cno4  | suresh  | 990032278 |   29 | telangana | p04  |
+-------+---------+-----------+------+-----------+------+
4 rows in set (0.01 sec)

mysql> select * from Voter;
+-----+----------+------+------------+---------+-----------+
| vid | name     | age  | address    | cons_id | candidate |
+-----+----------+------+------------+---------+-----------+
| v01 | akash    |   21 | kokkada    | co01    | cno1      |
| v02 | prakash  |   20 | kasaragoad | co02    | cno2      |
| v03 | suresh   |   29 | vitla      | co03    | cno3      |
| v04 | ramesh   |   30 | koibattur  | co04    | cno4      |
| v05 | ramesh   |   21 | kokkada    | co01    | cno1      |
| v06 | mayyanna |   21 | kokkada    | co02    | cno1      |
+-----+----------+------+------------+---------+-----------+
6 rows in set (0.00 sec)


mysql> select * from counts;
+---------+--------+
| cons_id | candid |
+---------+--------+
| c01     | cn01   |
| c01     | cn03   |
| c01     | cn04   |
| c01     | cno1   |
| c02     | cn01   |
| c02     | cn02   |
| c03     | cn01   |
| c03     | cn03   |
| c03     | cn04   |
| c04     | cn01   |
| c04     | cn04   |
| c05     | cn03   |
| c05     | cn05   |
+---------+--------+
13 rows in set (0.00 sec)


