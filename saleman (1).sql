create table SALESMAN
(
Salesman_id int,
Name varchar(10),
City varchar(10),
Commission int,
primary key(Salesman_id)
);

Table created.

create table CUSTOMER
(
Customer_id int,
Cust_name varchar(10),
City varchar(10),
Grade int,
Salesman_id int,
primary key(Customer_id),
foreign key(Salesman_id) references SALESMAN(Salesman_id) on delete set NULL
);

Table created.

create table ORDERS
(
Ord_no int,
Purchase_amt int,
Ord_date date,
Customer_id int,
Salesman_id int,
primary key(Ord_no),
foreign key(Customer_id) references CUSTOMER (customer_id) on delete cascade,
foreign key(Salesman_id) references SALESMAN (salesman_id) on delete cascade
);

Table created.

insert into SALESMAN values (7000,'joe','cherenobyl','17');
insert into SALESMAN values (7001,'gs','bangalore','77');
insert into SALESMAN values (7002,'mk','mumbai','97');
insert into SALESMAN values (7003,'sh','nkorea','56');
insert into SALESMAN values (7004,'vamps','brazil','89');
insert into SALESMAN values (7005,'lag','afganistan','87');

SQL> select * from SALESMAN;

SALESMAN_ID NAME       CITY       COMMISSION
----------- ---------- ---------- ----------
       7000 joe        cherenobyl         17
       7001 gs         bangalore          77
       7002 mk         mumbai             97
       7004 vamps      brazil             89
       7005 lag        afganistan         87
       7003 sh         nkorea             56

6 rows selected.


insert into CUSTOMER values (7,'negus','brazil',17,7004);
insert into CUSTOMER values (8,'q','australia',99,7000);
insert into CUSTOMER values (9,'w','mumbai',69,7002);
insert into CUSTOMER values (10,'e','mumbai',54,7002);
insert into CUSTOMER values (11,'r','bangalore',78,7001);
insert into CUSTOMER values (12,'t','bangalore',98,7001);
insert into CUSTOMER values (13,'y','nkorea',20,7003);
insert into CUSTOMER values (14,'u','damen',10,7001);
insert into CUSTOMER values (15,'m','ayodha',77,7005);

SQL> select * from customer;

CUSTOMER_ID CUST_NAME  CITY            GRADE SALESMAN_ID
----------- ---------- ---------- ---------- -----------
          7 negus      brazil             17        7004
          8 q          australia          99        7000
          9 w          mumbai             69        7002
         10 e          mumbai             54        7002
         11 r          bangalore          78        7001
         12 t          bangalore          98        7001
         13 y          nkorea             20        7003
         14 u          damen              10        7001
         15 m          ayodha             77        7005

9 rows selected.


insert into ORDERS values (123,77000,'03-dec-01',7,7004);
insert into ORDERS values (234,66000,'23-jan-11',8,7000);
insert into ORDERS values (345,25000,'05-feb-17',9,7002);
insert into ORDERS values (456,95000,'17-nov-17',10,7003);
insert into ORDERS values (567,32000,'05-dec-21',11,7001);
insert into ORDERS values (890,34000,'03-jan-01',12,7004);
insert into ORDERS values (901,53000,'03-feb-17',13,7003);
insert into ORDERS values (012,64000,'03-aug-20',14,7001);
insert into ORDERS values (991,37000,'25-aug-17',10,7004);
insert into ORDERS values (912,7000,'03-jul-01',8,7000);
insert into ORDERS values (917,23000,'03-nov-01',15,7005);

SQL> select * from orders;

    ORD_NO PURCHASE_AMT ORD_DATE  CUSTOMER_ID SALESMAN_ID
---------- ------------ --------- ----------- -----------
       123        77000 03-DEC-01           7        7004
       234        66000 23-JAN-11           8        7000
       456        95000 17-NOV-17          10        7003
       567        32000 05-DEC-21          11        7001
       890        34000 03-JAN-01          12        7004
       901        53000 03-FEB-17          13        7003
        12        64000 03-AUG-20          14        7001
       912         7000 03-JUL-01           8        7000
       917        23000 03-NOV-01          15        7005
       345        25000 05-FEB-17           9        7002
       991        37000 25-AUG-17          10        7004

11 rows selected.

select Grade,COUNT(distinct Customer_id) as Total_Customers
from CUSTOMER
group by Grade
having Grade>(select AVG(Grade) from CUSTOMER
		where City='bangalore');

     GRADE TOTAL_CUSTOMERS
---------- ---------------
        99               1
        98               1

select s.Salesman_id,s.Name
from SALESMAN s
where(select COUNT(*) from CUSTOMER c
	WHERE c.Salesman_id=s.Salesman_id)>1;


SALESMAN_ID NAME
----------- ----------
       7001 gs
       7002 mk

(select a.salesman_id,a.Name,b.Cust_name,a.Commission,a.City
from SALESMAN a,CUSTOMER b
where a.city=b.City)
UNION
(select Salesman_id,Name,'No Match',Commission,City
from SALESMAN
where NOT City=ANY(select City from CUSTOMER))
ORDER BY 2 DESC;

SALESMAN_ID NAME       CUST_NAME  COMMISSION CITY
----------- ---------- ---------- ---------- ----------
       7004 vamps      negus              89 brazil
       7003 sh         y                  56 nkorea
       7002 mk         e                  97 mumbai
       7002 mk         w                  97 mumbai
       7005 lag        No Match           87 afganistan
       7000 joe        No Match           17 cherenobyl
       7001 gs         r                  77 bangalore
       7001 gs         t                  77 bangalore

8 rows selected.

create view TOPSALESMAN as
select b.Ord_date,b.Purchase_amt,a.Salesman_id,a.Name
from SALESMAN a,ORDERS b
where a.Salesman_id=b.Salesman_id
and b.Purchase_amt=(select MAX(c.Purchase_amt)
	from ORDERS c where b.Ord_date=c.Ord_date);

View created.

select * from TOPSALESMAN;


ORD_DATE  PURCHASE_AMT SALESMAN_ID NAME
--------- ------------ ----------- ----------
03-DEC-01        77000        7004 vamps
23-JAN-11        66000        7000 joe
17-NOV-17        95000        7003 sh
05-DEC-21        32000        7001 gs
03-JAN-01        34000        7004 vamps
03-FEB-17        53000        7003 sh
03-AUG-20        64000        7001 gs
03-JUL-01         7000        7000 joe
03-NOV-01        23000        7005 lag
05-FEB-17        25000        7002 mk
25-AUG-17        37000        7004 vamps

11 rows selected.

Delete from SALESMAN Where Salesman_id=7000;

1 row deleted.

select * from SALESMAN;

SALESMAN_ID NAME       CITY       COMMISSION
----------- ---------- ---------- ----------
       7001 gs         bangalore          77
       7002 mk         mumbai             97
       7004 vamps      brazil             89
       7005 lag        afganistan         87
       7003 sh         nkorea             56