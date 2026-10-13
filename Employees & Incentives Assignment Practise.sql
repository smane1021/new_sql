 --1.  Write create table syntax for employee table and Incentive table

CREATE TABLE EMPLOYEE
(EMP_ID NUMBER PRIMARY KEY,
FIRST_NAME VARCHAR2 (20),
LAST_NAME VARCHAR2 (20),
SALARY NUMBER,
JOINING_DATE DATE,
DEPARTMENT VARCHAR2 (20));
----------
CREATE TABLE INCENTIVES
(EMPLOYEE_REF_ID NUMBER NOT NULL,
INCENTIVE_DATE DATE,
INCENTIVE_AMOUNT NUMBER);

SELECT * FROM EMPLOYEE
SELECT * FROM INCENTIVES
DROP TABLE INCENTIVES 
DROP TABLE EMPLOYEE
--2.	Write syntax for insert data into table of employee table and Incentive table

INSERT INTO EMPLOYEE VALUES (1,'John','Abraham',1000000,to_date('01-01-13','dd-mm-yy'),'Banking');

INSERT INTO EMPLOYEE VALUES (2,'Michael','Clarke',800000,TO_DATE('01-01-13','DD-MM-YY'),'Insurance');

INSERT INTO EMPLOYEE VALUES (3,'Roy','Thomas',700000,TO_DATE('01-02-13','DD-MM-YY'),'Banking');

INSERT INTO EMPLOYEE VALUES (4,'Tom','Jose',600000,TO_DATE('01-02-13','DD-MM-YY'),'Insurance');

INSERT INTO EMPLOYEE VALUES (5,'Jerry','Pinto',650000,To_DATE('01-02-13','DD-MM-YY'),'Insurance');

INSERT INTO EMPLOYEE VALUES (6,'Philip','Mathew',750000,TO_DATE('01-01-13','DD-MM-YY'),'Services');
-----
INSERT INTO INCENTIVES VALUES (1,TO_DATE('01-02-13','DD-MM-YY'),5000);
INSERT INTO INCENTIVES VALUES (2,TO_DATE('01-02-13','DD-MM-YY'),3000);
INSERT INTO INCENTIVES VALUES (3,TO_DATE('01-02-13','DD-MM-YY'),4000);
INSERT INTO INCENTIVES VALUES (1,TO_DATE('01-01-13','DD-MM-YY'),4500);
INSERT INTO INCENTIVES VALUES (2,TO_DATE('01-01-13','DD-MM-YY'),3500);


--3.	Get all employee details from the employee table

SELECT * FROM EMPLOYEE;

--4.	Get First_Name,Last_Name from employee table

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEE;

--5.	Get First_Name from employee table using alias name “Employee Name”.

SELECT FIRST_NAME AS EMPLOYEE_NAME
FROM EMPLOYEE

--6.	Get First_Name from employee table in upper case

SELECT UPPER(FIRST_NAME)
FROM EMPLOYEE;

--7.	Select first 3 characters of FIRST_NAME from EMPLOYEE

SELECT SUBSTR(FIRST_NAME,1,3) FROM EMPLOYEE;

--8.	Get position of 'o' in name 'John' from employee table

SELECT INSTR('John','o')FROM EMPLOYEE
WHERE FIRST_NAME ='John';

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.

SELECT RTRIM(FIRST_NAME) FROM EMPLOYEE;

--10.	Get First_Name from employee table after replacing 'o' with '$'

SELECT REPLACE(FIRST_NAME,'o','$') FROM EMPLOYEE;

--11.	Get First_Name and Last_Name as single column from employee table separated by a '_'

SELECT FIRST_NAME ||'_'||LAST_NAME FROM EMPLOYEE;

--12.	Get FIRST_NAME, Joining year, Joining Month and Joining Date from employee table

SELECT FIRST_NAME, 
       TO_CHAR(JOINING_DATE, 'YYYY') AS JOINING_YEAR,
       TO_CHAR(JOINING_DATE, 'MON') AS JOINING_MONTH,
       TO_CHAR(JOINING_DATE, 'DD') AS JOINING_DAY
FROM EMPLOYEE; 

--13.	Get all employee details from the employee table order by First_Name Ascending

SELECT * FROM EMPLOYEE
ORDER BY FIRST_NAME

--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?

SELECT * FROM EMPLOYEE
ORDER BY FIRST_NAME ASC, SALARY DESC

--15.	Get employee details from employee table whose employee name is “John”

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME ='John';

--16.	Get employee details from employee table whose employee name are “John” and “Roy”

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME IN ('John','Roy');

--17.	Get employee details from employee table whose employee name are not “John” and “Roy”.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME NOT IN ('John','Roy');

--18.	Get employee details from employee table whose first name starts with 'J'.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%o%';

--20.	Get employee details from employee table whose first name ends with 'n'.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%n';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '___n';

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.

SELECT * FROM EMPLOYEE 
WHERE FIRST_NAME LIKE 'J___';

--23.	Get employee details from employee table who’s Salary greater than 600000.

SELECT * FROM EMPLOYEE
WHERE SALARY > 600000;

--24.	Get employee details from employee table whose joining year is “2013”.

SELECT * FROM EMPLOYEE 
WHERE TO_CHAR(JOINING_DATE,'YYYY')='2013';

--25.	Get employee details from employee table whose joining month is “January”.

SELECT * FROM EMPLOYEE
WHERE  TO_CHAR(JOINING_DATE,'MON') ='JAN';

--26.	Get employee details from employee table who joined before January 1st 2013.

SELECT * FROM EMPLOYEE 
WHERE JOINING_DATE < DATE '2013-01-01';

--27.	Get employee details from employee table who joined after January 31st 2013

SELECT * 
FROM EMPLOYEE
WHERE JOINING_DATE > DATE '2013-01-31';


--28.	Get Joining Date and Time from employee table

SELECT JOINING_DATE, TO_CHAR(JOINING_DATE,'HH24:MM:SS')AS JOINING_TIME FROM EMPLOYEE;

--29.	Get Joining Date, Time including milliseconds from employee table

SELECT CAST(JOINING_DATE AS TIMESTAMP) FROM EMPLOYEE;

--30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.

SELECT J.JOINING_DATE, I.INCENTIVE_DATE, ABS(J.JOINING_DATE - I.INCENTIVE_DATE) AS DAYS_DIFFERENCE
FROM EMPLOYEE J
JOIN INCENTIVES I
ON J.EMP_ID = I.EMPLOYEE_REF_ID;

--31.	Get department, total salary with respect to a department from employee table.

SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

--32.	Get department, total salary with respect to a department from employee table order by total salary descending.

SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC;

--33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.

SELECT DEPARTMENT, COUNT(EMP_ID) NO_OF_EMPLOYEES, SUM(SALARY)AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC;

--34.	Get department wise average salary from employee table order by salary ascending?

SELECT DEPARTMENT, AVG(SALARY) AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY;

--35.	Get department wise maximum salary from employee table order by salary ascending?

SELECT DEPARTMENT, MAX(SALARY) MAX_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY MAX_SALARY ASC;

--36.	Get department wise minimum salary from employee table order by salary ascending?

SELECT DEPARTMENT, MIN(SALARY) MIN_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY MIN_SALARY;

--37.	Select no of employees joined with respect to year and month from employee table.

SELECT TO_CHAR(JOINING_DATE,'YYYY') AS JOIN_YEAR,
       TO_CHAR (JOINING_DATE,'MON') AS JOIN_MONTH,
       COUNT(EMP_ID) AS NO_OF_EMPLOYEES
FROM EMPLOYEE
GROUP BY TO_CHAR(JOINING_DATE,'YYYY'),
       TO_CHAR (JOINING_DATE,'MON')

--38.	Select department,total salary with respect to a department from employee table where total salary greater than 
      --800000 order by Total_Salary descending

SELECT DEPARTMENT, SUM(SALARY)AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING SUM(SALARY)>800000
ORDER BY TOTAL_SALARY DESC;

--39.	Select employee details from employee table if data in incentive table?

SELECT DISTINCT E.*
FROM EMPLOYEE E
JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID

--40.	Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table

SELECT EMP_ID, FIRST_NAME, SALARY,
CASE WHEN FIRST_NAME = 'John'THEN SALARY*0.20
     WHEN FIRST_NAME = 'Roy' THEN SALARY*0.10
     ELSE SALARY*0.15
END AS CONDITIONAL_SALARY
FROM EMPLOYEE

--41.	Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.

SELECT DEPARTMENT,
CASE WHEN DEPARTMENT = 'Banking'   THEN 'BANK DEPT'
     WHEN DEPARTMENT = 'Insurance' THEN 'INSURANCE DEPT'
     WHEN DEPARTMENT = 'Services'  THEN 'SERVICES DEPT'
END
FROM EMPLOYEE;


--42.	Delete employee data from employee table who got incentives in incentive table

DELETE FROM EMPLOYEE
WHERE EMP_ID IN  
(SELECT EMPLOYEE_REF_ID FROM INCENTIVES);

SELECT * FROM EMPLOYEE
SELECT * FROM INCENTIVES
--43.	Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT
FROM EMPLOYEE E 
JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID

--44.	Select first_name, incentive amount from employee and incentives table for those employees 
------who have incentives and incentive amount greater than 3000

SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT
FROM EMPLOYEE E 
JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT > 3000;

--45.	Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives

SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT
FROM EMPLOYEE E
LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--46.	Select first_name, incentive amount from employee and incentives table for all employees 
------even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.

SELECT E.FIRST_NAME, NVL (I.INCENTIVE_AMOUNT,0)AS INCENTIVE_AMOUNT
FROM EMPLOYEE E
LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--47.	Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join

SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT 
FROM EMPLOYEE E
LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID
WHERE I.EMPLOYEE_REF_ID IS NOT NULL;

--48.	Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT E.EMP_ID,
(SELECT MAX(I.INCENTIVE_AMOUNT)
FROM INCENTIVES I
WHERE I.EMPLOYEE_REF_ID = E.EMP_ID) AS MAX_INCENTIVE
FROM EMPLOYEE E;

----------------------------------------------------------------------------------------------------------------

SELECT * FROM EMPLOYEE;
SELECT * FROM INCENTIVES;


DROP TABLE EMPLOYEE;
DROP TABLE INCENTIVES;


