---------------------------Assignment HR.EMPLOYEES-------------------------------------
--Extract the data of employees whose department_id is 50.

SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--Display the first_name, last_name, and salary of employees earning more than 5000.

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE SALARY > 5000;

--Retrieve all employees who were hired after the year 2005.

SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE > TO_DATE('31-12-2005','DD-MM-YYYY');

--Show the employee_id, first_name, and email of employees working under manager_id 102.

SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
FROM HR.EMPLOYEES
WHERE MANAGER_ID = 102;

--Get the list of employees whose first_name starts with the letter ‘A’.

SELECT * FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';

--Extract the employees whose salary is between 3000 and 7000.

SELECT * FROM HR.EMPLOYEES 
WHERE SALARY BETWEEN 3000 AND 7000;

--Display the full details of employees who belong to department_id 10 or 20.

SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (10,20);

--Show the first_name, phone_number, and hire_date of employees hired in January.

SELECT FIRST_NAME, PHONE_NUMBER, HIRE_DATE
FROM HR.EMPLOYEES 
WHERE TO_CHAR (HIRE_DATE, 'MON')= 'JAN';

--Retrieve the details of employees whose job_id is ‘IT_PROG’.

SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--Extract the employees who have joined the company between march-2002 to march-2008.

SELECT * FROM HR.EMPLOYEES 
WHERE HIRE_DATE 
BETWEEN TO_DATE('01-03-2002','DD-MM-YYYY') AND TO_DATE ('31-03-2008','DD-MM-YYYY'); 

--Extract the employees whose last_name ends with ‘an’.

SELECT * FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE '%an';

--Extract the employees whose salary should be atleast 7000 and manager_id not more than 200 OR department_id less than 100.

SELECT * FROM HR.EMPLOYEES 
WHERE (SALARY <= 7000 AND MANAGER_ID <= 200) OR DEPARTMENT_ID < 100; 

--Extract employees whose salary is at least 5000 AND department_id is less than 60.

SELECT * FROM HR.EMPLOYEES
WHERE SALARY <= 5000 AND DEPARTMENT_ID < 60;

--Retrieve employees whose job_id is ‘SA_REP’ OR salary is greater than 10000.

SELECT * FROM HR.EMPLOYEES
WHERE JOB_ID IN 'SA_REP' OR SALARY = 10000;

--Show employees whose manager_id is NOT NULL AND salary is between 6000 and 12000.

SELECT * FROM HR.EMPLOYEES 
WHERE MANAGER_ID IS NOT NULL AND SALARY BETWEEN 6000 AND 12000; 
----------------------------------------HR.COUNTRIES----------------------------------------------------------------
-- Retrieve all countries that belong to region_id 3.

SELECT * FROM HR.COUNTRIES
WHERE REGION_ID = 3;

--Display the country_name and region_id of countries in region_id 1 or 2.

SELECT COUNTRY_NAME, REGION_ID 
FROM HR.COUNTRIES
WHERE REGION_ID IN (1,2);

-- Extract the countries whose country_name starts with the letter ‘A’.

SELECT * FROM HR.COUNTRIES 
WHERE COUNTRY_NAME LIKE 'A%';

-- Get the list of countries whose country_name ends with ‘ia’.

SELECT * FROM HR.COUNTRIES 
WHERE COUNTRY_NAME LIKE '%ia';

-- Retrieve all countries whose region_id is greater than 2.

SELECT * FROM HR.COUNTRIES 
WHERE REGION_ID > 2;

-- Display only the country_id and country_name of countries in region_id 4.

SELECT COUNTRY_ID , COUNTRY_NAME 
FROM HR.COUNTRIES WHERE REGION_ID = 4;

-- Extract countries whose country_name contains the letter ‘n’.

SELECT * FROM HR.COUNTRIES
WHERE COUNTRY_NAME LIKE '%n%';

-- List all countries sorted by country_name in ascending order.

SELECT * FROM HR.COUNTRIES 
ORDER BY COUNTRY_NAME ASC;

-- Retrieve all countries whose country_id is either ‘US’, ‘UK’, or ‘IN’.

SELECT * FROM HR.COUNTRIES 
WHERE COUNTRY_ID IN ('US','UK','IN');

-- Display countries where the length of the country_name is more than 7 characters.

SELECT * FROM HR.COUNTRIES 
WHERE LENGTH (COUNTRY_NAME) > 7;

--------------------------------HR.JOBS---------------------------------------------------------------

-- Retrieve all jobs whose minimum salary is more than 5000.

SELECT * FROM HR.JOBS 
WHERE MIN_SALARY > 5000;

-- Display the job_title and max_salary of jobs where max_salary is above 15000.

SELECT JOB_TITLE, MAX_SALARY 
FROM HR.JOBS 
WHERE MAX_SALARY > 15000;

-- Extract the jobs whose job_title contains the word ‘Manager’.

SELECT * FROM HR.JOBS 
WHERE JOB_TITLE LIKE '%Manager%';

-- List all jobs where the max_salary is between 10000 and 20000.

SELECT * FROM HR.JOBS 
WHERE MAX_SALARY BETWEEN 10000 AND 20000;

-- Retrieve all jobs whose min_salary is less than 3000.

SELECT * FROM HR.JOBS 
WHERE MIN_SALARY < 3000;

-- Display jobs where the job_title starts with the letter ‘S’.

SELECT * FROM HR.JOBS 
WHERE JOB_TITLE LIKE 'S%';

-- List all jobs sorted by min_salary in descending order.

SELECT * FROM HR.JOBS 
ORDER BY MIN_SALARY DESC; 

-- Display jobs where the max_salary is at least double the min_salary.

SELECT * FROM HR.JOBS 
WHERE MAX_SALARY >= (2 * MIN_SALARY);

-- Retrieve all jobs where job_id is either ‘IT_PROG’, ‘HR_REP’, or ‘AD_VP’.

SELECT * FROM HR.JOBS
WHERE JOB_ID IN ('IT_PROG','HR_REP','AD_VP');

--. Display the jobs where the difference between max_salary and min_salary is greater than 5000.

SELECT * FROM HR.JOBS
WHERE (MAX_SALARY - MIN_SALARY)>5000;

------------------------------HR.JOB_HISTORY----------------------------------------------------------------------
-- Retrieve all job history records for employee_id 101.

SELECT * FROM HR.JOB_HISTORY 
WHERE EMPLOYEE_ID = 101;

-- Display the employee_id and job_id of records where department_id is 50.

SELECT EMPLOYEE_ID, JOB_ID 
FROM HR.JOB_HISTORY 
WHERE DEPARTMENT_ID = 50;

-- Get all job history where the employee worked in the company after the year 2006.

SELECT * FROM HR.JOB_HISTORY
WHERE START_DATE > TO_DATE('31-12-2006','DD-MM-YYYY');

-- Extract records where the job duration (END_DATE – START_DATE) is more than 180 days.

SELECT * FROM HR.JOB_HISTORY 
WHERE (END_DATE - START_DATE) > 180;

-- List job history for employees who have worked in job_id ‘IT_PROG’.

SELECT * FROM HR.JOB_HISTORY
WHERE JOB_ID = 'IT_PROG';

-- Show all job history where department_id is either 10, 20, or 30.

SELECT * FROM HR.JOB_HISTORY 
WHERE DEPARTMENT_ID IN (10,20,30);

-- Display the employee_id, start_date, and end_date of records starting in the month of January.

SELECT EMPLOYEE_ID, START_DATE, END_DATE
FROM HR.JOB_HISTORY
WHERE TO_CHAR(START_DATE,'MON')='JAN'; 

-- Retrieve records where the employee changed jobs between 2004 and 2008.

SELECT * FROM HR.JOB_HISTORY
WHERE START_DATE BETWEEN TO_DATE('01-01-2004','DD-MM-YYYY') AND TO_DATE('31-12-2008','DD-MM-YYYY');

-- List all job history entries sorted by start_date in ascending order.

SELECT * FROM HR.JOB_HISTORY
ORDER BY START_DATE ;

--- Display job history for employees whose job_id ends with ‘_REP’.

SELECT * FROM HR.JOB_HISTORY
WHERE JOB_ID LIKE '%\_REP' ESCAPE '\';

------------------------------------HR.LOCATIONS------------------------------------------------------------------------------------------

-- Retrieve all locations that are in the city ‘Seattle’.

SELECT * FROM HR.LOCATIONS
WHERE CITY = 'Seattle';

-- Display the location_id and city of locations where the postal_code starts with ‘9’.

SELECT LOCATION_ID, CITY 
FROM HR.LOCATIONS
WHERE POSTAL_CODE LIKE '9%';

-- Extract all locations belonging to country_id ‘US’.

SELECT * FROM HR.LOCATIONS 
WHERE COUNTRY_ID = 'US';

-- List all locations where the city name contains the letter ‘a’.

SELECT * FROM HR.LOCATIONS
WHERE CITY LIKE '%a%';

-- Display locations where the state_province is not NULL.

SELECT * FROM HR.LOCATIONS
WHERE STATE_PROVINCE IS NOT NULL;

-- Retrieve locations where the postal_code is between 20000 and 40000.

SELECT * FROM HR.LOCATIONS
WHERE POSTAL_CODE BETWEEN '20000' AND '40000';

-- Display all cities sorted in alphabetical order.

SELECT CITY 
FROM HR.LOCATIONS 
ORDER BY CITY ASC;

-- Extract the locations where the street_address ends with the word ‘Ave’.

SELECT * FROM HR.LOCATIONS
WHERE STREET_ADDRESS LIKE '%Ave';

-- Retrieve locations from country_id IN (‘US’, ‘UK’, ‘CA’).

SELECT * FROM HR.LOCATIONS
WHERE COUNTRY_ID IN ('US','UK','CA'); 

--- Display all locations where the city name has more than 6 characters.

SELECT * FROM HR.LOCATIONS
WHERE LENGTH (CITY) > 6;

--------------------------HR.DEPARTMENTS------------------------------------------------------------------

--List all departments located in location_id 1700.

SELECT * FROM HR.DEPARTMENTS 
WHERE LOCATION_ID = 1700;

--Retrieve all departments where the manager_id is NULL.

SELECT * FROM HR.DEPARTMENTS
WHERE MANAGER_ID IS NULL;

--Show all departments sorted by department_name in ascending order.

SELECT * FROM HR.DEPARTMENTS
ORDER BY DEPARTMENT_NAME;

--Extract all departments whose department_name starts with the letter 'S'. 

SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE 'S%';

--Find departments whose department_name contains the word “Sales”.

SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%Sales%';

--List departments where department_id is between 50 and 150.

SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_ID BETWEEN 50 AND 150;

--Count how many departments exist in each location_id.

SELECT LOCATION_ID, COUNT(*) AS TOTAL_DEPARTMENTS
FROM HR.DEPARTMENTS 
GROUP BY LOCATION_ID ORDER BY LOCATION_ID;

--Display departments where manager_id is greater than 200.

SELECT * FROM HR.DEPARTMENTS
WHERE MANAGER_ID > 200;

--Retrieve departments whose department_name ends with the letter ‘n’.

SELECT * FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%n';

--Show departments that are not located in location_id 1800.

SELECT * FROM HR.DEPARTMENTS
WHERE LOCATION_ID <> 1800;

-----------------------------------HR.REGIONS----------------------------------------------------------------------------------------------

--List all regions where the region_name starts with the letter ‘A’.

SELECT * FROM HR.REGIONS
WHERE REGION_NAME LIKE 'A%';

--Retrieve regions where region_name ends with the letter ‘a’.

SELECT * FROM HR.REGIONS
WHERE REGION_NAME LIKE '%a';

--Display regions sorted by region_name in descending order.

SELECT * FROM HR.REGIONS
ORDER BY REGION_NAME DESC;

--Show regions where region_id is greater than 2.

SELECT * FROM HR.REGIONS
WHERE REGION_ID > 2;

--Extract regions whose region_name contains the substring ‘ia’.

SELECT * FROM HR.REGIONS 
WHERE REGION_NAME LIKE '%ia%';

--Count how many regions have region_id less than 4.

SELECT COUNT(REGION_ID) 
FROM HR.REGIONS
WHERE REGION_ID < 4 ;

--Display region_id and region_name where region_name IS NOT NULL.

SELECT REGION_ID, REGION_NAME
FROM HR.REGIONS
WHERE REGION_NAME IS NOT NULL;

--Retrieve regions whose region_id is either 1 or 4.

SELECT * FROM HR.REGIONS
WHERE REGION_ID IN (1,4);

--Show regions where region_name has more than 5 characters.

SELECT * FROM HR.REGIONS
WHERE LENGTH (REGION_NAME) > 5;

--List regions where the region_name contains the letter ‘a’ anywhere.

SELECT * FROM HR.REGIONS
WHERE REGION_NAME LIKE '%a%';
