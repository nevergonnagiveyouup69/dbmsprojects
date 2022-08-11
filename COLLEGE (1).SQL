Create table STUDENT
(
Usn varchar(10),
Sname varchar(10),
Address varchar(10),
Phone varchar(10),
Gender varchar(1),
primary key(Usn)
);

Table created.

create table SEMSEC
(
Ssid varchar(6),
Sem int,
Sec varchar(2),
primary key(Ssid)
);

Table created.

create table CLASS
(
Usn varchar(10),
Ssid varchar(6),
primary key(Usn,Ssid),
foreign key(Usn) references STUDENT3(Usn),
foreign key(Ssid) references SEMSEC(Ssid)
);

Table created.

create table SUBJECT
(
Subcode varchar(7),
Title varchar(20),
Sem int,
Credits int,
primary key(Subcode)
);

Table created.

create table IAMARKS
(
Usn varchar(10),
Subcode varchar(7),
Ssid varchar(6),
Test1 int,
Test2 int,
Test3 int,
Finalia int,
primary key(Usn,Subcode,Ssid),
foreign key(Usn) references STUDENT3(Usn),
foreign key(Ssid) references SEMSEC(Ssid),
foreign key(Subcode) references SUBJECT(Subcode)
);

Table created.

insert into STUDENT3 values('4all3cs001','a','mangalore',4456678789,'m');
insert into STUDENT3 values('4all3cs002','s','bangalore',7756678789,'f');
insert into STUDENT3 values('4all3cs003','t','bangalore',8856678789,'f');
insert into STUDENT3 values('4all3cs004','su','mangalore',94506978789,'f');
insert into STUDENT3 values('4all4cs010','ab','bangalore',995876787,'m');
insert into STUDENT3 values('4all4cs011','d','bangalore',445778789,'m');
insert into STUDENT3 values('4all4cs012','as','bangalore',4776678789,'f');
insert into STUDENT3 values('4all5cs020','aj','brazil',445548789,'m');
insert into STUDENT3 values('4all5cs021','san','china',776678789,'f');
insert into STUDENT3 values('4all5cs022','kri','northkorea',9956678789,'m');
insert into STUDENT3 values('4all5cs023','sant','mangalore',7756677789,'m');
insert into STUDENT3 values('4all6cs040','l','bangalore',7757778789,'m');
insert into STUDENT3 values('4all6cs041','ash','mangalore',7457678789,'f');
insert into STUDENT3 values('4all6cs042','v','mangalore',4756378789,'m');


USN        SNAME      ADDRESS    PHONE      G
---------- ---------- ---------- ---------- -
4all3cs001 a          mangalore  4456678789 m
4all3cs002 s          bangalore  7756678789 f
4all3cs003 t          bangalore  8856678789 f
4all3cs004 su         mangalore  9450678789 f
4all4cs010 ab         bangalore  995876787  m
4all4cs011 d          bangalore  445778789  m
4all4cs012 as         bangalore  4776678789 f
4all5cs020 aj         brazil     445548789  m
4all5cs021 san        china      776678789  f
4all5cs022 kri        northkorea 9956678789 m
4all5cs023 sant       mangalore  7756677789 m

USN        SNAME      ADDRESS    PHONE      G
---------- ---------- ---------- ---------- -
4all6cs040 l          bangalore  7757778789 m
4all6cs041 ash        mangalore  7457678789 f
4all6cs042 v          mangalore  4756378789 m

14 rows selected.

insert into SEMSEC values('cse7a',7,'a');
insert into SEMSEC values('cse7b',7,'b');
insert into SEMSEC values('cse7c',7,'c');
insert into SEMSEC values('cse6a',6,'a');
insert into SEMSEC values('cse4a',4,'a');
insert into SEMSEC values('cse4b',4,'k');
insert into SEMSEC values('cse4c',4,'c');
insert into SEMSEC values('cse2a',2,'a');

insert into CLASS values('4all3cs001','cse7a');
insert into CLASS values('4all3cs002','cse7a');
insert into CLASS values('4all3cs003','cse7b');
insert into CLASS values('4all3cs004','cse7c');
insert into CLASS values('4all4cs010','cse6a');
insert into CLASS values('4all4cs011','cse6a');
insert into CLASS values('4all4cs012','cse6a');
insert into CLASS values('4all5cs020','cse4a');
insert into CLASS values('4all5cs021','cse4b');
insert into CLASS values('4all5cs022','cse4c');
insert into CLASS values('4all5cs023','cse4c');
insert into CLASS values('4all6cs040','cse2a');
insert into CLASS values('4all6cs041','cse2a');
insert into CLASS values('4all6cs042','cse2a');

insert into SUBJECT values('10cs81','pw',7,4);
insert into SUBJECT values('10cs82','in',7,4);
insert into SUBJECT values('10cs188','pwl',7,2);
insert into SUBJECT values('15cs61','p',6,4);
insert into SUBJECT values('15cs62','cn',6,4);
insert into SUBJECT values('15cs41','db',3,4);
insert into SUBJECT values('15cs42','ad',3,4);
insert into SUBJECT values('15che21','w',7,2);
insert into SUBJECT values('15pcd22','pcd',7,7);

insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all3cs001','10cs81','cse7a',17,18,19);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all3cs001','10cs82','cse7a',7,20,15);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all3cs003','10cs188','cse7b',12,13,17);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all3cs004','10cs82','cse7c',17,17,20);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all4cs011','15cs62','cse6a',7,11,12);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all5cs022','15cs41','cse4c',7,14,12);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all5cs023','15cs42','cse4c',7,17,18);
insert into IAMARKS(Usn,Subcode,Ssid,Test1,Test2,Test3) values ('4all6cs042','15pcd22','cse2a',19,17,15);

select s.*,ss.Sem,ss.Sec
from STUDENT3 s,SEMSEC ss,CLASS c
where s.Usn = c.Usn and ss.Ssid=c.Ssid
and ss.Sem = 4 and ss.Sec='c';

USN        SNAME      ADDRESS    PHONE      G        SEM SE
---------- ---------- ---------- ---------- - ---------- --
4all5cs022 kri        northkorea 9956678789 m          4 c
4all5cs023 sant       mangalore  7756677789 m          4 c

select ss.Sem,ss.Sec,s.Gender,count(s.Gender)as count
from STUDENT3 s,SEMSEC ss,CLASS c
where s.Usn = c.Usn and ss.Ssid =c.Ssid
group by ss.Sem,ss.Sec,s.Gender
order by Sem;

       SEM SE G      COUNT
---------- -- - ----------
         2 a  f          1
         2 a  m          2
         4 a  m          1
         4 c  m          2
         4 k  f          1
         6 a  f          1
         6 a  m          2
         7 a  f          1
         7 a  m          1
         7 b  f          1
         7 c  f          1

11 rows selected.

create view Test1_view as
select Test1,Subcode
from IAMARKS
where Usn = '4all3cs001';

View created.

select * from Test1_view;

     TEST1 SUBCODE
---------- -------
        17 10cs81
         7 10cs82

create or replace procedure AVGMARKS is
cursor c_iamarks is
select greatest(Test1,Test2)as a,greatest(Test1,Test3) as b,greatest(Test3,Test2)as c
from IAMARKS
where Finalia is null for update;

c_a number;
c_b number;
c_c number;
c_sm number;
c_av number;

begin
open c_iamarks;
loop
fetch c_iamarks into c_a, c_b, c_c;
 exit when c_iamarks%notfound;

if(c_a!=c_b) then
 c_sm:=c_a+c_b;
else
 c_sm:=c_a+c_c;
end if;

c_av:=c_sm/2;

update IAMARKS set Finalia=c_av where current of c_iamarks;

end loop;
close c_iamarks;
end;
/

Procedure created.

begin
AVGMARKS;
end;
/

PL/SQL procedure successfully completed.

select * from iamarks;

USN        SUBCODE SSID        TEST1      TEST2      TEST3    FINALIA
---------- ------- ------ ---------- ---------- ---------- ----------
4all3cs001 10cs81  cse7a          17         18         19         19
4all3cs001 10cs82  cse7a           7         20         15         18
4all3cs003 10cs188 cse7b          12         13         17         15
4all3cs004 10cs82  cse7c          17         17         20         19
4all4cs011 15cs62  cse6a           7         11         12         12
4all5cs022 15cs41  cse4c           7         14         12         13
4all5cs023 15cs42  cse4c           7         17         18         18
4all6cs042 15pcd22 cse2a          19         17         15         18

8 rows selected.
