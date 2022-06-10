CREATE TABLE ACTOR
(
Act_id varchar(3),
Act_name varchar(10),
Act_gender varchar(1),
primary key(Act_id)
);

Table created.

create table DIRECTOR
(
Dir_id varchar(3),
Dir_name varchar(20),
Dir_phone varchar(10),
primary key(Dir_id)
);

Table created.

create table MOVIES
(
Mov_id varchar(3),
Mov_title varchar(20),
Mov_year int,
Mov_lang varchar(10),
Dir_id varchar(3),
primary key(Mov_id),
foreign key(Dir_id) references DIRECTOR(Dir_id) on delete set NULL
);

Table created.

create table MOVIE_CAST
(
Act_id varchar(3),
Mov_id varchar(3),
Role varchar(10),
primary key (Act_id,Mov_id),
foreign key (Act_id) references actor(Act_id) on delete set NULL,
foreign key (Mov_id) references movies(Mov_id) on delete set NULL
);

Table created.

create table RATING
(
Mov_id varchar(3),
Rev_stars int,
primary key(Mov_id,Rev_stars),
foreign key(Mov_id)references MOVIES (Mov_id) on delete set NULL
);

Table created.

insert into ACTOR values('b1','rdj','m');
insert into ACTOR values('b2','jns','m');
insert into ACTOR values('b3','sj','f');
insert into ACTOR values('b4','hj','m');
insert into ACTOR values('b5','sk','m');
insert into ACTOR values('b6','srh','m');

SQL> SELECT * FROM ACTOR;

ACT ACT_NAME   A
--- ---------- -
b1  rdj        m
b2  jns        m
b3  sj         f
b4  hj         m
b5  sk         m
b6  srh        m

6 rows selected.

insert into DIRECTOR values('d4','hc','111111111');
insert into DIRECTOR values('d5','ss','222222222');
insert into DIRECTOR values('d6','cn','333333333');
insert into DIRECTOR values('d7','kj','777777777');

SQL> SELECT * FROM DIRECTOR;

DIR DIR_NAME             DIR_PHONE
--- -------------------- ----------
d4  hc                   111111111
d5  ss                   222222222
d6  cn                   333333333
d7  kj                   777777777

insert into MOVIES values('m3','aiw',2018,'eng','d4');
insert into MOVIES values('m4','eg',2019,'eng','d6');
insert into MOVIES values('m5','gow',1990,'eng','d5');
insert into MOVIES values('m6','doom',2018,'eng','d6');
insert into MOVIES values('m7','bb',2017,'hin','d5');
insert into MOVIES values('m8','ccr',2020,'kan','d7');

SQL> SELECT * FROM MOVIES;

MOV MOV_TITLE              MOV_YEAR MOV_LANG   DIR
--- -------------------- ---------- ---------- ---
m3  aiw                        2018 eng        d4
m4  eg                         2019 eng        d6
m5  gow                        1990 eng        d5
m6  doom                       2018 eng        d6
m7  bb                         2017 hin        d5
m8  ccr                        2020 kan        d7

6 rows selected.

insert into MOVIE_CAST values ('b1','m3','hero');
insert into MOVIE_CAST values ('b5','m4','hero');
insert into MOVIE_CAST values ('b1','m5','hero');
insert into MOVIE_CAST values ('b2','m5','heroine');
insert into MOVIE_CAST values ('b2','m7','guest');
insert into MOVIE_CAST values ('b3','m6','hero');
insert into MOVIE_CAST values ('b4','m6','heroine');
insert into MOVIE_CAST values ('b1','m7','hero');
insert into MOVIE_CAST values ('b5','m8','hero');
insert into MOVIE_CAST values ('b6','m8','heroine');

SQL> SELECT * FROM MOVIE_CAST;

ACT MOV ROLE
--- --- ----------
b1  m3  hero
b5  m4  hero
b1  m5  hero
b2  m5  heroine
b2  m7  guest
b3  m6  hero
b4  m6  heroine
b1  m7  hero
b5  m8  hero
b6  m8  heroine

10 rows selected.

insert into RATING values('m3',7);
insert into RATING values('m4',8);
insert into RATING values('m5',9);
insert into RATING values('m6',3);
insert into RATING values('m7',7);
insert into RATING values('m8',7);
insert into RATING values('m4',5);
insert into RATING values('m3',3);

SQL> SELECT * FROM RATING;

MOV  REV_STARS
--- ----------
m3           3
m3           7
m4           5
m4           8
m5           9
m6           3
m7           7
m8           7

8 rows selected.

select Mov_title
from MOVIES
where Dir_id IN (select Dir_id from DIRECTOR
		where Dir_name ='hc');

MOV_TITLE
--------------------
aiw

select Act_id from MOVIE_CAST
GROUP BY Act_id having COUNT (*)>1;

ACT
---
b1
b2
b5

select Mov_title
from MOVIES m,MOVIE_CAST mc
where m.Mov_id=mc.Mov_id
and mc.Act_id IN (select Act_id from MOVIE_CAST
group by Act_id having COUNT(Act_id)>1)
group by Mov_title;

MOV_TITLE
--------------------
aiw
bb
ccr
gow
eg


select Mov_title,a.Act_id
from MOVIES m,MOVIE_CAST mc,ACTOR a
where m.Mov_id=mc.Mov_id
and mc.Act_id=a.Act_id
and mc.Act_id IN (select Act_id from MOVIE_CAST
group by Act_id having COUNT(*)>1);

MOV_TITLE            ACT
-------------------- ---
aiw                  b1
gow                  b1
bb                   b1
gow                  b2
bb                   b2
eg                   b5
ccr                  b5

7 rows selected.

select Act_name,Mov_title,Mov_year
from ACTOR a
JOIN MOVIE_CAST c
  ON a.Act_id=c.Act_id
JOIN MOVIES m
  ON c.Mov_id=m.Mov_id
where m.Mov_year NOT BETWEEN 2000 and 2015;


ACT_NAME   MOV_TITLE              MOV_YEAR
---------- -------------------- ----------
rdj        aiw                        2018
sk         eg                         2019
rdj        gow                        1990
jns        gow                        1990
sj         doom                       2018
hj         doom                       2018
rdj        bb                         2017
jns        bb                         2017
sk         ccr                        2020
srh        ccr                        2020

10 rows selected.

select Mov_title,MAX(Rev_stars)
from MOVIES
INNER JOIN RATING using(Mov_id)
group by Mov_title
having MAX(Rev_stars)>0
order by Mov_title;

MOV_TITLE            MAX(REV_STARS)
-------------------- --------------
aiw                               7
bb                                7
ccr                               7
doom                              3
eg                                8
gow                               9

6 rows selected.

select Mov_title,MAX(Rev_stars) as Best_Rating
from MOVIES m,RATING r
where m.Mov_id=r.Mov_id
and r.Rev_stars IS NOT NULL
group by Mov_title
order by Mov_title;


MOV_TITLE            BEST_RATING
-------------------- -----------
aiw                            7
bb                             7
ccr                            7
doom                           3
eg                             8
gow                            9

6 rows selected.

update RATING
set Rev_stars=5
where Mov_id IN (select Mov_id from MOVIES
		where Dir_id IN(select Dir_id from DIRECTOR
		where Dir_name = 'ss'));


SQL> SELECT * FROM RATING;

MOV  REV_STARS
--- ----------
m3           3
m3           7
m4           5
m4           8
m5           5
m6           3
m7           5
m8           7

8 rows selected.
