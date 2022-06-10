create table employee2
 (
 Ssn varchar(8),
 Fname varchar(10),
 Lname varchar(10),
 Address varchar(10),
 Sex varchar(1),
 Salary int,
 Sup_Ssn varchar(8),
 primary key(Ssn),
 foreign key(Sup_Ssn)references EMPLOYEE2(Ssn)
 );

Table created.

create table DEPARTMENT1
(
Dno int,
Dname varchar(20),
MgrSsn varchar(8),
Mgr_sdate date,
primary key(Dno),
foreign key(mgrSsn)references EMPLOYEE2(Ssn)
);

Table created.

ALTER TABLE EMPLOYEE2 ADD Dno INT REFERENCES DEPARTMENT1(Dno);

Table altered.

create table DLOCATION1
(
Dno int,
Dloc varchar(20),
primary key(Dno,Dloc),
foreign key(Dno) references DEPARTMENT1(Dno)
);

Table created.

create table project1
(
Pno int,
Pname varchar(20),
plocation varchar(20),
Dno int,
primary key(Pno),
foreign key(Dno)references DEPARTMENT1(Dno)
);

Table created.

create table WORKS_ON1
(
Pno int,
Ssn varchar(8),
Hours int,
primary key(Ssn,Pno),
foreign key(Ssn)references EMPLOYEE2(Ssn),
foreign key(PNO)references PROJECT1(Pno)
);

Table created.

insert into EMPLOYEE2 values('ali01','jo','s','bangalore','m',2000000,null,null); 
insert into EMPLOYEE2 values('ali02','ja','sm','mangalore','m',1500000,'ali01',null); 
insert into EMPLOYEE2 values('ali03','w','b','bangalore','m',1500000,'ali01',null); 
insert into EMPLOYEE2 values('ali04','el','s','mysore','m',1500000,'ali01',null); 
insert into EMPLOYEE2 values('ali05','p','h','mangalore','m',700000,'ali02',null); 
insert into EMPLOYEE2 values('ali06','g','j','brazil','m',1000000,'ali03',null); 
insert into EMPLOYEE2 values('ali07','n','sa','korea','f',600500,'ali02',null); 
insert into EMPLOYEE2 values('ali08','as','h','mangalore','f',800000,'ali04',null); 
insert into EMPLOYEE2 values('ali09','san','ku','china','m',500000,'ali02',null); 
insert into EMPLOYEE2 values('ali10','my','m','nkorea','f',300000,'ali02',null); 
insert into EMPLOYEE2 values('ali11','na','ta','bangalore','m',900000,'ali04',null); 
insert into EMPLOYEE2 values('ali12','v','gg','bangalore','m',650000,'ali02',null); 
insert into EMPLOYEE2 values('ali13','ka','k','mangalore','f',750000,'ali01',null); 

insert into DEPARTMENT1 values(1,'accounts','ali02','07-jan-01');
insert into DEPARTMENT1 values(2,'mar','ali03','17-aug-16');
insert into DEPARTMENT1 values(3,'it','ali04','27-mar-08');
insert into DEPARTMENT1 values(4,'pro','ali08','7-aug-12');
insert into DEPARTMENT1 values(5,'sup','ali01','05-mar-10');

update EMPLOYEE2 set Dno=5 where Ssn='ali01';
update EMPLOYEE2 set Dno=1 where Ssn='ali02';
update EMPLOYEE2 set Dno=2 where Ssn='ali03';
update EMPLOYEE2 set Dno=3 where Ssn='ali04';
update EMPLOYEE2 set Dno=1 where Ssn='ali05';
update EMPLOYEE2 set Dno=2 where Ssn='ali06';
update EMPLOYEE2 set Dno=1 where Ssn='ali07';
update EMPLOYEE2 set Dno=4 where Ssn='ali08';
update EMPLOYEE2 set Dno=1 where Ssn='ali09';
update EMPLOYEE2 set Dno=1 where Ssn='ali10';
update EMPLOYEE2 set Dno=3 where Ssn='ali11';
update EMPLOYEE2 set Dno=1 where Ssn='ali12';
update EMPLOYEE2 set Dno=5 where Ssn='ali13';

insert into DLOCATION1 VALUES(1,'bangalore');
insert into DLOCATION1 VALUES(2,'bangalore');
insert into DLOCATION1 VALUES(3,'bangalore');
insert into DLOCATION1 VALUES(1,'mangalore');
insert into DLOCATION1 VALUES(3,'mangalore');
insert into DLOCATION1 VALUES(4,'mysore');
insert into DLOCATION1 VALUES(5,'brazil');

insert into PROJECT1 values(700,'gs',1,'bangalore');
insert into PROJECT1 values(701,'st',1,'bangalore');
insert into PROJECT1 values(702,'gst',1,'bangalore');
insert into PROJECT1 values(703,'tc',2,'bangalore');
insert into PROJECT1 values(704,'jm',2,'bangalore');
insert into PROJECT1 values(705,'iot',3,'bangalore');
insert into PROJECT1 values(706,'pro',4,'bangalore');
insert into PROJECT1 values(707,'pj',5,'bangalore');
insert into PROJECT1 values(708,'pd',5,'bangalore');

insert into works_on1(Pno,Ssn,Hours)values(700,'ali02',20);
insert into works_on1(Pno,Ssn,Hours)values(700,'ali09',77);
insert into works_on1(Pno,Ssn,Hours)values(701,'ali10',71);
insert into works_on1(Pno,Ssn,Hours)values(701,'ali02',73);
insert into works_on1(Pno,Ssn,Hours)values(702,'ali12',23);
insert into works_on1(Pno,Ssn,Hours)values(702,'ali07',27);
insert into works_on1(Pno,Ssn,Hours)values(703,'ali03',26);
insert into works_on1(Pno,Ssn,Hours)values(704,'ali06',17);
insert into works_on1(Pno,Ssn,Hours)values(705,'ali11',20);
insert into works_on1(Pno,Ssn,Hours)values(707,'ali13',22);
insert into works_on1(Pno,Ssn,Hours)values(707,'ali08',27);
insert into works_on1(Pno,Ssn,Hours)values(707,'ali01',68);
insert into works_on1(Pno,Ssn,Hours)values(708,'ali13',70);
insert into works_on1(Pno,Ssn,Hours)values(708,'ali08',25);
insert into works_on1(Pno,Ssn,Hours)values(708,'ali05',78);
insert into works_on1(Pno,Ssn,Hours)values(705,'ali04',12);

(select p.pno
from PROJECT1 p,department1 d,employee2 e
where p.Dno=d.Dno and d.MgrSsn=e.Ssn
and e.Lname='s')
UNION
(select p1.pno
from PROJECT1 p1,works_on1 w,employee2 e1
where p1.Pno=w.Pno and e1.Ssn=w.Ssn
and e1.Lname='s');

       PNO
----------
       705
       707
       708

select e.Fname,e.Lname,1.1*e.salary as incr_sal
from employee2 e,works_on1 w,project1 p
where e.ssn=w.ssn and w.Pno=p.Pno and p.Pname='iot';


FNAME      LNAME        INCR_SAL
---------- ---------- ----------
el         s             1650000
na         ta             990000

select sum(e.salary)as total_salary,max(e.Salary) as max_salary,min(e.Salary) as
min_salary,avg(e.salary) as average_salary
from EMPLOYEE2 e,DEPARTMENT1 d
WHERE e.Dno=d.Dno
and d.dname='accounts';


TOTAL_SALARY MAX_SALARY MIN_SALARY AVERAGE_SALARY
------------ ---------- ---------- --------------
     4250500    1500000     300000     708416.667

select e.fname,e.lname
from employee2 e
where NOT EXISTS((select Pno from project1 where Dno='5')
minus (select Pno from works_on1 where e.Ssn=Ssn));

FNAME      LNAME
---------- ----------
as         h
ka         k

select d.Dno,count(*)
from DEPARTMENT1 d,EMPLOYEE2 e
where d.Dno=e.Dno
and e.salary>600000 and d.Dno in (select e1.Dno
from employee2 e1
group by e1.Dno
having count(*)>5)
group by d.Dno;

       DNO   COUNT(*)
---------- ----------
         1          4
