SQL>  CREATE TABLE student1
  2  ( usn varchar(20) PRIMARY KEY,
  3    Name varchar(20) NOT NULL,
  4    mob int UNIQUE
  5  );
SQL>  CREATE TABLE marks
  2  ( usn varchar(10),
  3    sem int not null,
  4    marks varchar(10),
  5    gender varchar(10),
  6    FOREIGN KEY(usn)
  7    REFERENCES student1(usn),
  8    PRIMARY KEY(usn,sem)
  9  );
SQL> insert into student1 values
  2  ('&usn','&name','&mob');
Enter value for usn: 4rg566
Enter value for name: df
Enter value for mob: 123456789
old   2: ('&usn','&name','&mob')
new   2: ('4rg566','df','123456789')

1 row created.

SQL> /
Enter value for usn: 7jk19cs022
Enter value for name: lf
Enter value for mob: 12345678990
old   2: ('&usn','&name','&mob')
new   2: ('7jk19cs022','lf','12345678990')

1 row created.

SQL> /
Enter value for usn: 5jk20is077
Enter value for name: pf
Enter value for mob: 098653673
old   2: ('&usn','&name','&mob')
new   2: ('5jk20is077','pf','098653673')

1 row created.

SQL> /
Enter value for usn: 9ck20cs055
Enter value for name: fk
Enter value for mob: 912376548
old   2: ('&usn','&name','&mob')
new   2: ('9ck20cs055','fk','912376548')

1 row created.

SQL> /
Enter value for usn: 4jk19cs077
Enter value for name: lk
Enter value for mob: 9343453535
old   2: ('&usn','&name','&mob')
new   2: ('4jk19cs077','lk','9343453535')

1 row created.

SQL> insert into marks values
  2  ('&usn','&sem','&marks','&gender');
Enter value for usn: 4rg566
Enter value for sem: 2
Enter value for marks: 77
Enter value for gender: m
old   2: ('&usn','&sem','&marks','&gender')
new   2: ('4rg566','2','77','m')

1 row created.

SQL> /
Enter value for usn: 7jk19cs022
Enter value for sem: 4
Enter value for marks: 88
Enter value for gender: f
old   2: ('&usn','&sem','&marks','&gender')
new   2: ('7jk19cs022','4','88','f')

1 row created.

SQL> /
Enter value for usn: 5jk20is077
Enter value for sem: 1
Enter value for marks: 99
Enter value for gender: m
old   2: ('&usn','&sem','&marks','&gender')
new   2: ('5jk20is077','1','99','m')

1 row created.

SQL> /
Enter value for usn: 9ck20cs055
Enter value for sem: 6
Enter value for marks: 79
Enter value for gender: f
old   2: ('&usn','&sem','&marks','&gender')
new   2: ('9ck20cs055','6','79','f')

1 row created.

SQL> /
Enter value for usn: 4jk19cs077
Enter value for sem: 7
Enter value for marks: 87
Enter value for gender: m
old   2: ('&usn','&sem','&marks','&gender')
new   2: ('4jk19cs077','7','87','m')

1 row created.
SQL> select * from student1;

USN                  NAME                        MOB
-------------------- -------------------- ----------
4rg566               df                    123456789
7jk19cs022           lf                   1.2346E+10
5jk20is077           pf                     98653673
9ck20cs055           fk                    912376548
4jk19cs077           lk                   9343453535

SQL> select usn,name from student1;

USN                  NAME
-------------------- --------------------
4rg566               df
7jk19cs022           lf
5jk20is077           pf
9ck20cs055           fk
4jk19cs077           lk

SQL> select name from student1 where usn='7jk19cs022';

NAME
--------------------
lf

SQL> select name,usn from student1 where mob=null;

no rows selected

SQL> select usn from marks where sem=1;

USN
----------
5jk20is077
SQL> SELECT usn,marks from marks
  2  order by usn asc;

USN        MARKS
---------- ----------
4jk19cs077 87
4rg566     77
5jk20is077 99
7jk19cs022 88
9ck20cs055 79
SQL> select usn,marks,sem,gender from marks
  2  order by sem,gender;

USN        MARKS             SEM GENDER
---------- ---------- ---------- ----------
5jk20is077 99                  1 m
4rg566     77                  2 m
7jk19cs022 88                  4 f
9ck20cs055 79                  6 f
4jk19cs077 87                  7 m
SQL> select count (usn) as no_of_students,sem
  2  from marks group by sem;

NO_OF_STUDENTS        SEM
-------------- ----------
             1          1
             1          6
             1          2
             1          4
             1          7
SQL> select AVG(marks),sem
  2  from marks
  3  group by sem;

AVG(MARKS)        SEM
---------- ----------
        99          1
        79          6
        77          2
        88          4
        87          7

SQL> SELECT DISTINCT SEM FROM MARKS;

       SEM
----------
         1
         6
         2
         4
         7
SQL> SELECT USN,MARKS,SEM,GENDER FROM MARKS ORDER BY SEM,GENDER;

USN        MARKS             SEM GENDER
---------- ---------- ---------- ----------
5jk20is077 99                  1 m
4rg566     77                  2 m
7jk19cs022 88                  4 f
9ck20cs055 79                  6 f
4jk19cs077 87                  7 m

SQL> SELECT S.USN,NAME AS FIRST_NAME
  2  FROM STUDENT S,MARKS M WHERE S.USN=M.USN
  3  AND SEM=5;
SQL> select count(usn),sem
  2  from marks
  3  where marks>50
  4  group by sem;

COUNT(USN)        SEM
---------- ----------
         1          1
         1          6
         1          2
         1          4
         1          7

SQL> select count(usn),sem
  2  from where marks>50
  3
SQL> select count(usn),sem
  2  from marks
  3  where marks>50
  4  group by sem
  5  having count(usn)>1;

no rows selected
no rows selected