create table Student_basic_info
(Student_ID NUMBER PRIMARY KEY,
NAME VARCHAR2 (20)NOT NULL,
DOB VARCHAR2 (20)NOT NULL,
EMAIL VARCHAR2 (50)UNIQUE
);

SELECT * FROM STUDENT_BASIC_INFO

DROP TABLE STUDENT_BASIC_INFO;

INSERT INTO STUDENT_BASIC_INFO VALUES (1301,'sambodh',21082001,'sambodhadmane@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1302,'subodh',08082003,'subodhsahajrao@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1303,'sushma',03061981,'sushmaadmane@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1304,'kshitij',04092005,'kshitijadmane@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1305,'anirudha',01011965,'anirudhaadmane@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1306,'samyek',22082001,'samyaksahajrao@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1307,'sanchi',16122013,'sanchidhokane@gmail.com');
INSERT INTO STUDENT_BASIC_INFO VALUES (1308,'sanvidha',25122023,'sanvidhadhokane@gmail.com');

truncate table STUDENT_BASIC_INFO

ALTER table STUDENT_BASIC_INFO
ADD CONTACT_NO NUMBER;

ALTER table STUDENT_BASIC_INFO
ADD (PINCODE NUMBER,
ADDRESS VARCHAR2 (70)
);

UPDATE STUDENT_BASIC_INFO
SET PINCODE = 410206;

ROLLBACK;

delete STUDENT_BASIC_INFO;

SELECT NAME,DOB FROM STUDENT_BASIC_INFO;

ALTER TABLE STUDENT_BASIC_INFO
MODIFY EMAIL NOT NULL;

INSERT INTO STUDENT_BASIC_INFO VALUES (1309,'shashwat',25122020,'shashwatdhokane@gmail.com',null,null,null)
INSERT INTO STUDENT_BASIC_INFO VALUES (1310,'mahavir',16111986,'mahavirdhokane@gmail.com',null,null,null);

UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 9372661809 WHERE STUDENT_ID = 1301;
UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 9819454685 WHERE STUDENT_ID = 1302;
UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 9819454665 WHERE STUDENT_ID = 1303;
UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 9819454665 WHERE STUDENT_ID = 1304;
UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 9732458524 WHERE STUDENT_ID = 1305;

ALTER TABLE STUDENT_BASIC_INFO
ADD CONSTRAINT chk_contact_no_length
CHECK (LENGTH(CONTACT_NO) = 10);

UPDATE STUDENT_BASIC_INFO
SET CONTACT_NO = 98194556855 WHERE STUDENT_ID = 1306;
---------------------------------------------------------------------------------------------------------------------
create table SEMESTER1
(STUDENT_ID NUMBER NOT NULL UNIQUE,
PHYSICS NUMBER,
CHEMISTRY NUMBER,
BIOLOGY NUMBER,
MATHEMATICS NUMBER,
ENVIRONMENTAL NUMBER,
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_BASIC_INFO (STUDENT_ID)
);
SELECT * FROM STUDENT_BASIC_INFO;

SELECT * FROM SEMESTER1;

DROP TABLE SEMESTER1;

INSERT INTO SEMESTER1 VALUES (1301,56,72,65,45,55);
INSERT INTO SEMESTER1 VALUES (1302,72,68,75,25,48);

SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'SEMESTER1';

ALTER TABLE SEMESTER1
DROP CONSTRAINT SYS_C007092;

ALTER TABLE SEMESTER1
ADD CONSTRAINT fk_studentid
FOREIGN KEY (STUDENT_ID)
REFERENCES STUDENT_BASIC_INFO(STUDENT_ID)
ON DELETE CASCADE
ENABLE VALIDATE;


--------------------------------------------------------------------------------------------------
create table customers
(sr_no number,
Fname varchar2 (10),
Lname varchar2 (10)
);

insert into customers values (101,'Sambodh','Admane');
insert into customers values (102,'Sushma','Admane');

select * from customers;

drop table customers;

alter table customers
modify sr_no primary key;

delete from customers where sr_no = 101;

truncate table customers;
--------------------------------------------------07/12/2025---------------------------------------------------------------

create table employees
(EmpID NUMBER PRIMARY KEY,
NAME VARCHAR2 (20)NOT NULL,
Joining_date date NOT NULL,
EMAIL VARCHAR2 (50)UNIQUE
);

select * from employees;

drop table employees;

insert into employees values (11101,'Ram',to_date('17/10/2005','dd/mm/yyyy'),'sambodhadmane@gmail.com')

alter session set nls_date_format = 'DD/MON/YYYY';
------------------------------------------------------------------------------------------------------------------
CREATE TABLE PASSENGERS
(
SEAT_NO NUMBER PRIMARY KEY,
NAME VARCHAR2 (50),
DOB DATE,
BOARDING_AT VARCHAR2 (100),
DEPARTURE_AT VARCHAR2 (100),
DATE_OF_JOURNEY DATE 
);

DROP TABLE PASSENGERS;

SELECT * FROM PASSENGERS 

INSERT INTO PASSENGERS VALUES (11,'ASHWIN P.',TO_DATE('21-08-2001','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));
INSERT INTO PASSENGERS VALUES (25,'RAHUL A.',TO_DATE('2-08-1968','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));
INSERT INTO PASSENGERS VALUES (12,'ASHWIN P.',TO_DATE('21-08-2001','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));
INSERT INTO PASSENGERS VALUES (14,'ASHWIN P.',TO_DATE('21-08-2001','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));
INSERT INTO PASSENGERS VALUES (5,'MAYUR V.',TO_DATE('12-09-1996','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));
INSERT INTO PASSENGERS VALUES (8,'SUYOG V.',TO_DATE('30-10-1995','DD-MM-YYYY'),'MUMBAI','BANGALORE',TO_DATE('13-12-2025','DD-MM-YYYY'));

--Display the names and DOB of passengers whose age is more than 25 years.

SELECT NAME, DOB FROM PASSENGERS WHERE (MONTHS_BETWEEN(SYSDATE, DOB)/12)>25; 

--Get all passengers whose name starts with 'A'.

SELECT * FROM PASSENGERS WHERE NAME LIKE 'A%';

--Extract passengers whose DATE_OF_JOURNEY is on 13-Dec-2025.

SELECT * FROM PASSENGERS WHERE DATE_OF_JOURNEY = TO_DATE('13-12-2025','DD-MM-YYYY');

--List all passengers sorted by SEAT_NO in ascending order.

SELECT * FROM PASSENGERS ORDER BY SEAT_NO ASC;

--Show passengers whose SEAT_NO is between 5 and 15.

SELECT * FROM PASSENGERS WHERE SEAT_NO BETWEEN 5 AND 15;

--Retrieve passengers whose name contains 'V'.

SELECT * FROM PASSENGERS WHERE NAME LIKE '%V%';

--Show passengers whose DOB is before 01-Jan-1990.

SELECT * FROM PASSENGERS WHERE DOB < TO_DATE('01-01-1990','DD-MM-YYYY'); 

--Count how many passengers are traveling from Mumbai.

SELECT * FROM PASSENGERS WHERE BOARDING_AT = 'MUMBAI';1

-------------------------------------11/12/2025-------------------------------------------------------------------------------

SELECT EMPLOYEE_ID, FIRST_NAME || ' '|| LAST_NAME, SALARY FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME || ' '|| LAST_NAME AS FULL_NAME, SALARY FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, SALARY, FIRST_NAME FROM HR.EMPLOYEES ORDER BY EMPLOYEE_ID ASC;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY * NVL(COMMISSION_PCT,0)/100 AS TOTAL_COMMISSION, 
SALARY + SALARY * NVL(COMMISSION_PCT,0)/100 AS TOTAL_SALARY FROM HR.EMPLOYEES; 

SELECT * FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, SALARY, FIRST_NAME, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID,
NVL(MANAGER_ID,0)+ NVL(DEPARTMENT_ID,0) AS TOTAL_ID FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, HIRE_DATE, TO_CHAR(HIRE_DATE,'DD-MM-YYYY') AS HIRE_DATE FROM HR.EMPLOYEES;

SELECT * FROM HR.EMPLOYEES;

CREATE TABLE HR_EMPLOYEES AS SELECT * FROM HR.EMPLOYEES WHERE 1 = 1 ;

SELECT * FROM HR_EMPLOYEES; 

DROP TABLE HR_EMPLOYEES;

SELECT * FROM ALL_CONSTRAINTS WHERE OWNER = 'HR' AND TABLE_NAME = 'DEPARTMENTS';

SELECT * FROM ALL_TABLES WHERE TABLE_NAME = 'EMPLOYEES';

commit
-----------------------------------------JOINS----------------------------------------------------------------------------------------
SELECT e.EMPLOYEE_ID, 
e.FIRST_NAME, 
e.department_id,
d.DEPARTMENT_NAME 
FROM HR.EMPLOYEES e
INNER JOIN hr.departments d
ON e. department_id = d.department_id;



SELECT e.EMPLOYEE_ID,
e.FIRST_NAME, 
e.department_id,
d.DEPARTMENT_NAME
FROM HR.EMPLOYEES e
LEFT JOIN hr.departments d
ON e. department_id = d.department_id;

SELECT e.EMPLOYEE_ID, 
e.FIRST_NAME, 
e.department_id,
d.DEPARTMENT_NAME
FROM HR.EMPLOYEES e
RIGHT JOIN hr.departments d
ON e. department_id = d.department_id;

SELECT e.EMPLOYEE_ID, 
e.FIRST_NAME, 
e.department_id,
d.DEPARTMENT_NAME
FROM HR.EMPLOYEES e
FULL JOIN hr.departments d
ON e. department_id = d.department_id;

SELECT e.EMPLOYEE_ID, 
e.FIRST_NAME, 
e.department_id,
d.DEPARTMENT_NAME
FROM HR.EMPLOYEES e
CROSS JOIN hr.departments d

SELECT * from HR.EMPLOYEES 

SELECT * from HR.DEPARTMENTS

SELECT * FROM HR.LOCATIONS

SELECT * FROM HR.COUNTRIES

SELECT * FROM HR.JOBS

SELECT * FROM HR.JOB_HISTORY;

--Display employee first name and department name.

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--Show all employees, including those without a department.

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID; 

--Display all departments, including those with no employees.

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E
RIGHT JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID; 

--List employee name, department name, and city.

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, C.CITY
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS C
ON D.LOCATION_ID = C.LOCATION_ID ;

--Show department name and country name.

SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME
FROM HR.DEPARTMENTS D
JOIN HR.LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
JOIN HR.COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;

--Display employee name, job title, and salary.

SELECT E.FIRST_NAME, J.JOB_TITLE, E.SALARY
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
ON E.JOB_ID = J.JOB_ID;

--List employees along with their manager’s name.

SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
       M.FIRST_NAME AS MANAGER_NAME
FROM HR.EMPLOYEES E
LEFT JOIN HR.EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID;

--Display department name and number of employees in each department.

SELECT D.DEPARTMENT_NAME,
COUNT (E.EMPLOYEE_ID) AS TOTAL_EMPLOYEES
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

------------------------------------------18/12--------------------------------------------------------

-- Display employee first name and department name.

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID

-- List employee first name and city where the city starts with the letter 'S'.

SELECT E.FIRST_NAME, L.CITY
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY LIKE 'S%';

-- Display distinct department names that have employees.

SELECT DISTINCT D.DEPARTMENT_NAME
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- List employees whose first name contains the letter 'a'.

SELECT * FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE '%a%';

-- Display distinct job IDs from the employees table.

SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;

--List distinct department IDs from the employees table.

SELECT DISTINCT DEPARTMENT_ID FROM HR.EMPLOYEES;

--Display distinct manager IDs from the employees table.

SELECT DISTINCT MANAGER_ID FROM HR.EMPLOYEES;

--Display distinct department names that have employees.

SELECT DISTINCT D.DEPARTMENT_NAME 
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

--List distinct job titles of employees.

SELECT DISTINCT JOB_TITLE FROM HR.JOBS;

--Display distinct city names that starts with S, where employees are working.

SELECT DISTINCT L.CITY 
FROM HR.LOCATIONS L
JOIN HR.DEPARTMENTS D
ON L.LOCATION_ID = D.LOCATION_ID
JOIN HR.EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE L.CITY LIKE 'S%';

--Display distinct first names of employees whose name starts with ‘A’.

SELECT DISTINCT FIRST_NAME
FROM HR.EMPLOYEES 
WHERE FIRST_NAME LIKE 'A%';

--List distinct department names where the department name contains the letter ‘o’.

SELECT DISTINCT DEPARTMENT_NAME
FROM HR.DEPARTMENTS 
WHERE DEPARTMENT_NAME LIKE '%c%';

--Display distinct job IDs of employees whose salary is greater than 8000.

SELECT DISTINCT JOB_ID
FROM HR.EMPLOYEES
WHERE SALARY > 8000;

--Display distinct combinations of department_id and job_id from the employees table.

SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM HR.EMPLOYEES;

SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.DEPARTMENTS;
SELECT * FROM HR.LOCATIONS;
SELECT * FROM HR.JOBS;

---------------------------------------------------20/12------------------------------------------------------------------------------

SELECT ASCII ('S') FROM DUAL;

SELECT CHR(83) FROM DUAL;

SELECT FIRST_NAME, ASCII(FIRST_NAME)AS NUM_VALUES
FROM HR.EMPLOYEES;

SELECT INSTR('ORACLE', 'A') FROM DUAL;

SELECT FIRST_NAME,
INSTR(FIRST_NAME, 'a') AS A_POSITION
FROM HR.EMPLOYEES;

SELECT INSTR ('THIS IS A PLAYLIST','IS',1,3)
FROM DUAL;

SELECT INSTR ('SAMBODHADMANE@GMAIL.COM','@')
FROM DUAL ;

SELECT SUBSTR ('THIS IS A PLANE','5')
FROM DUAL;

SELECT SUBSTR ('SAMBODHADMANE@GMAIL.COM',INSTR('SAMBODHADMANE@GMAIL.COM','@'))
FROM DUAL;

SELECT SUBSTR ('ORACLE SUBSTRING','-5','4')
FROM DUAL;

SELECT LPAD('123', 6, '0') 
FROM DUAL;

SELECT EMPLOYEE_ID, FIRST_NAME, 
RPAD(FIRST_NAME, 10, '1')
FROM HR.EMPLOYEES;

SELECT TRIM('   ORACLE   ') FROM DUAL;

SELECT RTRIM('ORACLE   ') FROM DUAL;

SELECT LTRIM('   ORACLE') FROM DUAL;

SELECT REPLACE ('THIS IS A TEST', 'IS','is')
FROM DUAL;

SELECT SUBSTR ('THIS IS A TEST',6)
(REPLACE ('THIS IS A TEST','IS','is'))
FROM DUAL

SELECT TRANSLATE ('PEAK, FOOTBALL, HOCKEY',',FA','::::::')
FROM DUAL;

SELECT TRANSLATE('ORACLE', 'AEIOU', '*****') 
FROM DUAL;

---------------------------------------21/25-------------------------------------------------------

SELECT CEIL (12.89) FROM DUAL;

SELECT FLOOR (12.89) FROM DUAL;

SELECT ROUND (12.89), ROUND (12.29) FROM DUAL;

SELECT TRUNC (12.22745) FROM DUAL;

SELECT TRUNC (12.22745,3) FROM DUAL;

SELECT MOD (6,2) FROM DUAL;

SELECT MOD (2,6) FROM DUAL;

SELECT MOD (28,9) FROM DUAL;

SELECT POWER (9,3) FROM DUAL;

SELECT SQRT (81) FROM DUAL;

SELECT EMPLOYEE_ID
FROM HR.EMPLOYEES 
WHERE MOD (EMPLOYEE_ID,2)=0;

SELECT EMPLOYEE_ID
FROM HR.EMPLOYEES 
WHERE MOD (EMPLOYEE_ID,2)<>0;

SELECT ABS (-10) from dual;

SELECT -ABS (10) from dual;

SELECT NEXT_DAY(DATE '2021-01-03','SUNDAY') FROM DUAL;

SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,NEXT_DAY(HIRE_DATE,'MONDAY')AS NEXT_MONDAY
FROM HR.EMPLOYEES
WHERE NEXT_DAY(HIRE_DATE,'MONDAY') - HIRE_DATE =7; 

SELECT ADD_MONTHS (SYSDATE, 3) FROM DUAL ;

SELECT EMPLOYEE_ID, FIRST_NAME,HIRE_DATE,ADD_MONTHS(HIRE_DATE,2)AS MONTHS_ADD
FROM HR.EMPLOYEES;

SELECT CURRENT_DATE , SYSDATE FROM DUAL;

SELECT EXTRACT (MONTH FROM HIRE_DATE)
FROM HR.EMPLOYEES;

SELECT 
EXTRACT (DAY FROM HIRE_DATE )AS PART1, 
EXTRACT (YEAR FROM HIRE_DATE) AS PART2 
FROM HR.EMPLOYEES;

SELECT LAST_DAY (TO_DATE('15-02-2001','DD-MM-YYYY')) FROM DUAL;

SELECT LAST_DAY (DATE '2024-02-15') FROM DUAL;

SELECT NEXT_DAY (SYSDATE, 'MONDAY') FROM DUAL;

SELECT EMPLOYEE_ID, FIRST_NAME,HIRE_DATE,
TO_CHAR(HIRE_DATE,'DAY-DD-MON-YYYY')
FROM HR.EMPLOYEES

SELECT INSTR ('THIS IS GOD','IS' ,1,2)FROM DUAL;

SELECT SUBSTR ('THIS IS GOD','5')FROM DUAL;

SELECT SUBSTR ('SAMBODHADMANE@GMAIL.COM',INSTR('SAMBODHADMANE@GMAIL.COM','@'))
FROM DUAL;




CREATE TABLE EMPLOYEE_INFO
(SR_NO NUMBER,
NAME_OF_EMPLOYEE VARCHAR2 (50),
EMAIL VARCHAR2 (50),
CITY VARCHAR2 (50) 
);

INSERT INTO EMPLOYEE_INFO VALUES (01,'SUNIL','SUNIL2531@YAHOO.COM','JHARKHAND');
INSERT INTO EMPLOYEE_INFO VALUES (02,'RAKESH','RSHARMA@GMAIL.COM','GOA');
INSERT INTO EMPLOYEE_INFO VALUES (03,'ASIF','ASIFFF03@OUTLOOK.COM','MADHYA PRADESH');

TRUNCATE TABLE EMPLOYEE_INFO;

DELETE EMPLOYEE_INFO
WHERE SR_NO = 3;

ROLLBACK;

SELECT * FROM EMPLOYEE_INFO;

SELECT SUBSTR(EMAIL,INSTR(EMAIL,'@'))
FROM EMPLOYEE_INFO;

--------------------------------------------------28/12-----------------------------------------------------

SELECT * FROM HR.EMPLOYEES;

SELECT SYSDATE FROM DUAL;

SELECT EMPLOYEE_ID, HIRE_DATE,(SYSDATE - HIRE_DATE)AS WORK_DAYS,EXTRACT(YEAR FROM (SYSDATE-HIRE_DATE))
FROM HR.EMPLOYEES;

SELECT * from (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,DEPARTMENT_ID,
RANK ()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) RNK,
DENSE_RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) DRNK,
ROW_NUMBER () OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) RN
FROM HR.EMPLOYEES)


SELECT COALESCE (NULL, NULL, 10,1,1) FROM DUAL;

SELECT EMPLOYEE_ID, HIRE_DATE, SALARY,
CASE
  WHEN SALARY >5000 THEN 'GOOD'
  WHEN SALARY BETWEEN 5001 AND 10000 THEN 'BETTER'
  WHEN SALARY > 10000 THEN 'BEST'
  ELSE 'NOT GOOD'
END AS CATEGORY
FROM HR.EMPLOYEES;  

----------------------------------

CREATE TABLE INPUT
(ID NUMBER,
AMOUNT NUMBER);

INSERT INTO INPUT VALUES (101,500);
INSERT INTO INPUT VALUES (102,600);
INSERT INTO INPUT VALUES (103,700);

SELECT * FROM INPUT;

SELECT SUM(AMOUNT) FROM INPUT;

---------------------------------------------

SELECT * FROM HR.EMPLOYEES
WHERE ROWNUM   = 2;

SELECT * FROM (SELECT EMPLOYEE_ID,MAX(SALARY) FROM HR.EMPLOYEES
GROUP BY EMPLOYEE_ID
ORDER BY MAX(SALARY))
WHERE ROWNUM = 2;

SELECT EMPLOYEE_ID, MAX(SALARY) FROM HR.EMPLOYEES 
GROUP BY EMPLOYEE_ID

SELECT MAX(SALARY) FROM HR.EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM HR.EMPLOYEES
               WHERE SALARY < (SELECT MAX(SALARY) FROM HR.EMPLOYEES));

--INLINE VIEW

SELECT SALARY
FROM (SELECT SALARY,
     DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
     FROM HR.EMPLOYEES)
WHERE RNK = 3;
     
SELECT EMPLOYEE_ID 
FROM(SELECT EMPLOYEE_ID, 
     ROW_NUMBER () OVER (ORDER BY EMPLOYEE_ID DESC)AS RNK,
     COUNT(*) OVER () AS CNT
     FROM HR.EMPLOYEES
     GROUP BY EMPLOYEE_ID)
WHERE RNK = CEIL(CNT/2 );

SELECT EMPLOYEE_ID
FROM (SELECT EMPLOYEE_ID,
      ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID ) AS RNK,
      COUNT(*) OVER() AS CNT
      FROM HR.EMPLOYEES
      GROUP BY EMPLOYEE_ID)
WHERE RNK = CEIL(CNT/2);
     
--CTE
WITH AVG_SAL AS
(SELECT AVG(SALARY) AS AVG_SALARY FROM HR.EMPLOYEES)
SELECT E.*
FROM HR.EMPLOYEES E
JOIN AVG_SAL A
ON SALARY > AVG_SALARY;

WITH avg_sal AS 
    (SELECT AVG(salary) AS avg_salary
    FROM hr.employees)
SELECT e.employee_id, e.salary
FROM hr.employees e, avg_sal a
WHERE e.salary > a.avg_salary;


--VIEW
CREATE VIEW MY_VIEW AS 
SELECT AVG(SALARY) AS AVG_SALA
FROM HR.EMPLOYEES;

SELECT * FROM MY_VIEW;

CREATE VIEW MY_VIEW1 AS 
SELECT * 
FROM HR.EMPLOYEES;

SELECT * FROM MY_VIEW1

with select 

select with

DROP VIEW MY_VIEW1

SELECT ABS(-1.4) FROM DUAL;

SELECT 
       FIRST_NAME ||' '|| LAST_NAME 
FROM HR.EMPLOYEES
order by employee_id ;

SELECT * FROM HR.EMPLOYEES
WHERE FIRST_NAME = 'Sundar';

select employee_id, nvl(commission_pct, 0) as comm
from hr.employees;

alter table employees
add new_col number;


INSERT INTO EMPLOYEES (NEW_COL) VALUES (3)
where ename = 'STEVEN';

UPDATE EMPLOYEES
SET NEW_COL = 0
WHERE EID = 3001;

SELECT EID, ENAME FROM EMPLOYEES
MINUS
SELECT EID, ENAME FROM EMPLOYEES;


SELECT eid, esal,
       LAG(esal) OVER (ORDER BY eid) AS prev_salary
FROM employees;

SELECT eid, esal,
       LEAD(esal) OVER (ORDER BY eid) AS next_salary
FROM employees;

select * from employees;


DELETE FROM EMPLOYEES
WHERE ROWID NOT IN (SELECT MIN(ROWID)
                   FROM EMPLOYEES
                   GROUP BY EID)
                   
--nTH SALARY

select salary
from (select salary,
     dense_rank () over(order by salary desc) as rnk
     from hr.employees)
where rnk = 45;

select * from employees

SELECT ROWID, ROWNUM ,EID FROM EMPLOYEES

select * from
(select salary,
        dense_rank () over (order by salary desc) as rnk
        from hr.employees) 
where rnk = 20;

select * from
       (select salary,
       dense_rank () over (order by salary desc ) as rnk
       from hr.employees)
where rnk = 2;

select * from 
         (select salary,
          rank () over(order by salary desc) as rnk
          from hr.employees)
where rnk = 87;

select * from
         (select salary,
          Row_Number () over (order by salary desc) as rnk
          from hr.employees)
where rnk = 3;

select rowid, rownum, salary from hr.employees

select distinct cnum, cname from customers
where cnum in (select cnum from orders);

select * from orders;

select c.cname, s.sname
from salespeople s
cross join customers c

select count(*) as combinations
from salespeople s
cross join customers c

select s.snum, s.snum
from salespeople s
left join customers c
on s.snum = c.cnum


select c.snum, c.cnum,count(*) as counnt
from orders o
left join customers c
on o.cnum = c.cnum
group by c.snum, c.cnum;

select c1.city , c2.city, c1.cname, c2.cname
from customers c1
left join customers c2
on c1.city = c2.city
where c1.cnum < c2.cnum;

select max(salary) from hr.employees
where salary < (select max(salary) from hr.employees);

select * from (select salary,
               dense_rank () over( order by salary desc) as shweta
               from hr.employees)
where shweta = 2;

select * from
       (select salary,
       dense_rank () over (order by salary desc ) as rnk
       from hr.employees)
where rnk = 2;

select * from
       (select salary,
       row_number() over (order by salary desc ) as rnk
       from hr.employees)
where rnk = 4;

with

select * from orders
