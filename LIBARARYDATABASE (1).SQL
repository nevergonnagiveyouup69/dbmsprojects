create table PUBLISHER
(
  Name varchar(15),
  Address varchar(15),
  Phone varchar(10),
  Primary key(Name)
);
 create table BOOK
(
  Book_id varchar(4),
  Title varchar(10),
  Publisher_name varchar(10),
  Pub_year int,
  Primary key (Book_id),
  Foreign key(Publisher_name) references PUBLISHER(Name) on delete cascade
);
create table BOOK_AUTHORS
(
  Book_id varchar(4),
  Author_name varchar(10),
  primary key (Book_id),
  Foreign key(Book_id)references BOOK(Book_id) on delete cascade
);
create table LIBRARY_BRANCH
(
  Branch_id varchar(4),
  Branch_name varchar(15),
  Address varchar(15),
  primary key (Branch_id)
);
create table BOOK_COPIES
( 
  Book_id varchar(4),
  Branch_id varchar(4),
  No_of_copies int,
  primary key(Book_id,Branch_id),
  Foreign key(Book_id) references BOOK(Book_id)on delete cascade,
  Foreign key(Branch_id) references LIBRARY_BRANCH(Branch_id) on delete cascade
);
create table BOOK_LENDING
(
  Book_id varchar(4),
  Branch_id varchar(4),
  Card_no int,
  Date_out date,
  Due_date date,
  primary key(Book_id,Branch_id,Card_no),
  Foreign key(Book_id) references BOOK(Book_id) on delete cascade,
  Foreign key(Branch_id)references LIBRARY_BRANCH(Branch_id) on delete cascade
);
insert into PUBLISHER values('Dune','Usa','312200167');
insert into PUBLISHER values('bharath','China','9099090909');
insert into PUBLISHER values('rdpd','Mangalore','1220016777');
insert into PUBLISHER values('bendower','Russia','220016787');
insert into PUBLISHER values('werewolf','northkorea','7712200167');

insert into BOOK values('b7','python','Dune','2021');
insert into BOOK values('b8','DBMS','bharath','2041');
insert into BOOK values('b9','dc','rdpd','2027');
insert into BOOK values('b6','aip','bendower','2077');
insert into BOOK values('b5','os','werewolf','2067');

insert into BOOK_AUTHORS VALUES('b7','dsc');
insert into BOOK_AUTHORS VALUES('b8','jojo');
insert into BOOK_AUTHORS VALUES('b9','dc');
insert into BOOK_AUTHORS VALUES('b6','boi');
insert into BOOK_AUTHORS VALUES('b5','john');

insert into LIBRARY_BRANCH values ('bh3','book_store','mumbai');
insert into LIBRARY_BRANCH values ('bh4','book_place','mangalore');
insert into LIBRARY_BRANCH values ('bh5','book_exist','goa');

insert into BOOK_COPIES values ('b7','bh3','44');
insert into BOOK_COPIES values ('b7','bh4','67');
insert into BOOK_COPIES values ('b8','bh4','77');
insert into BOOK_COPIES values ('b8','bh5','88');
insert into BOOK_COPIES values ('b9','bh3','99');
insert into BOOK_COPIES values ('b9','bh4','11');
insert into BOOK_COPIES values ('b6','bh3','17');
insert into BOOK_COPIES values ('b5','bh5','27');

insert into BOOK_LENDING values('b7','bh3','4','07-jan-17','11-jan-17');
insert into BOOK_LENDING values('b8','bh4','7','12-jan-17','12-mar-17');
insert into BOOK_LENDING values('b9','bh3','9','17-feb-17','17-apr-17');
insert into BOOK_LENDING values('b5','bh5','77','15-mar-17','15-jul-17');
insert into BOOK_LENDING values('b9','bh4','69','12-apr-17','15-may-17');
insert into BOOK_LENDING values('b6','bh3','3','21-feb-17','21-jul-17');

Select b.book_id,b.title,b.publisher_name,a.author_name,c.no_of_copies,lb.branch_id
from BOOK b,BOOK_AUTHORS a,BOOK_COPIES c,LIBRARY_BRANCH lb
where a.book_id=b.book_id
      and b.book_id=c.book_id
      and c.branch_id=lb.branch_id;

select Card_no
from BOOK_LENDING
where Date_out between '01-jan-2017' and '01-jun-2017'
group by Card_no
having count(*)>3;

delete from BOOK where Book_id='b6';

create view V_PUBLICATION as
select Pub_year
from BOOK;

select *from V_PUBLICATION;

create view V_BOOKS as
select b.Book_id,b.Title,c.Branch_id,c.No_of_copies
from BOOK b,BOOK_COPIES c,LIBRARY_BRANCH lb
where b.Book_id=c.Book_id
and c.Branch_id=lb.Branch_id;

select * from V_BOOKS;
