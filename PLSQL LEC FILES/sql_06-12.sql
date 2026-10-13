select * from hr.employees;


----------------- SQL --------------------------------------------
-- DDL - create, alter, drop, truncate, rename
-- DML - insert, update, merage, delete
-- DRL - select
-- DCL/TCL - commit,rollback


-----------------------DDL------------------------------------------------------
create table student
(stuid   NUMBER,
 FNAME   VARCHAR2(20),
 LNAME   VARCHAR2(20),
 CITY    VARCHAR2(10)
);

select * from student;

drop table student;

truncate table student;

insert into student values(1001,'Ankit','Pandey','Pune',null,null,null);
insert into student values(1002,'Ankita','Patil','Mumbai',null,null,null);

-------------------------------------------------------------------------
ALTER TABLE student
ADD contact_no number;

select * from student;

ALTER TABLE student
ADD (DOB  DATE,
email VARCHAR2(30)
);

------------------------------------------------------------------------------

update student
set contact_no = 9511255655;

--------------------------------------------------------------------------------
delete from student;

select * from student;

rollback;

---------------------------------------------------------------------
--create
-- Alter
-- drop
-- truncate
-- Insert
-- update
-- delete

---------------------------------------------------------------------
select stuid,contact_no,fname from student;


SELECT employee_id,first_name,salary FROM HR.employees;


------------------Constraints----------------------------------------------------
-- primary key
-- Foreign key
-- not null 
-- unique
-- check

select * from student;

drop table student;

create table student
(stuid   NUMBER,
 FNAME   VARCHAR2(20),
 LNAME   VARCHAR2(20),
 CITY    VARCHAR2(10),
 primary key (stuid)
);

insert into student values(null,'Ankit','Pandey','Pune');
insert into student values(1002,'Ankita','Patil','Mumbai');

select * from student;

create table hr.emp
(
  empid   number unique,
  first_name  varchar2(100),
  last_name   varchar2(100),
  city        varchar2(50),
  salary      number 
);

truncate table emp;
insert into emp values(1002,'Ankita','P','Pune',10000);

ALTER TABLE emp
modify salary  not null;

select * from emp;

insert into emp values(1003,'Rahul','B','Pune',-10000);



create table stud_info
(stuid   NUMBER,
 FNAME   VARCHAR2(20),
 LNAME   VARCHAR2(20),
 CITY    VARCHAR2(10),
 primary key (stuid)
);


CREATE table sem1
(
student_id number not null UNIQUE,
sub1  number,
sub2  number,
sub3  number,
sub4 number,
foreign key(student_id) REFERENCES stud_info(stuid)
)



SELECT * FROM stud_info;

SELECT * FROM sem1;

insert into stud_info values(1001,'Rahul','Bhujbal','Pune')

insert into sem1 values (1001,56,89,78,45);
