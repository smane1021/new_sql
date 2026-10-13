--Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character.

SELECT EMPLOYEE_ID, FIRST_NAME||' '||lAST_NAME AS FULL_NAME,
SALARY, HIRE_DATE
FROM HR.EMPLOYEES
WHERE FIRST_NAME||' '||lAST_NAME LIKE 'S%';

--Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum
--,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

SELECT MAX(SALARY)AS MAXIMUM , MIN(SALARY)AS MINIMUM, ROUND(SUM(SALARY))AS SUM , ROUND(AVG(SALARY))AS AVERAGE
FROM HR.EMPLOYEES 

--Q3. Display following output .Employee Details
--------------------------------------------------------------------------------------
--King earns $24,000.00 monthly but wants $72,000.00.
--Kochhar earns $20,000.00 monthly but wants $60,000.00.
--De Haan earns $17,000.00 monthly but wants $51,000.00.
--Hunold earns $9,000.00 monthly but wants $27,000.00.
--Ernst earns $6,000.00 monthly but wants $18,000.00.
--Austin earns $4,800.00 monthly but wants $14,400.00.

SELECT LAST_NAME ||' '||'EARNS '||TO_CHAR(SALARY)||' '||'BUT WANTS'||' '||(TO_CHAR(SALARY*3)) AS EMPLOYEE_DETAILS
FROM HR.EMPLOYEES 

--Q4. Determine the number of managers without listing them. 
--Label the column  Number of Managers Hint: Use the MANAGER_ID column to determine the number of managers. 

SELECT COUNT(MANAGER_ID) AS NUMBER_OF_MANAGERS
FROM HR.EMPLOYEES

--Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE

SELECT MAX(SALARY)AS HIGHEST_SAL, MIN(SALARY)AS LOWEST_SAL, MAX(SALARY)-MIN(SALARY) AS DIFFERENCE
FROM HR.EMPLOYEES

--Q6. Display how many employees joined in each month
--Hint: Grouping by month and count the employees .use TO_CHAR functions also

SELECT COUNT(EMPLOYEE_ID),TO_CHAR(HIRE_DATE,'MONTH')
FROM HR.EMPLOYEES 
GROUP BY TO_CHAR(HIRE_DATE,'MONTH')

--Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.

SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME, HIRE_DATE 
FROM HR.EMPLOYEES
WHERE MONTHS_BETWEEN (SYSDATE, HIRE_DATE)>120;


--Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
--Hint: Commission column contain null values

SELECT AVG(SALARY*NVL(COMMISSION_PCT,0))
FROM HR.EMPLOYEES;

SELECT AVG(SALARY*NVL(COMMISSION_PCT,0))
FROM HR.EMPLOYEES
GROUP BY EMPLOYEE_ID;

--Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
--Hint: Grouping on department id

SELECT DEPARTMENT_ID, COUNT(MANAGER_ID)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL  
GROUP BY DEPARTMENT_ID;

--Q10.Display job title and number of employees working those job and number of manager they perform job.

SELECT J.JOB_TITLE, COUNT(E.EMPLOYEE_ID), COUNT(DISTINCT E.MANAGER_ID)
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
ON E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_TITLE
ORDER BY J.JOB_TITLE

--Q11. Display employee full name and add both side asterisk sing 10 time

SELECT 
    LPAD(RPAD(FIRST_NAME || ' ' || LAST_NAME, 
              LENGTH(FIRST_NAME || ' ' || LAST_NAME) + 10, '*'),
         LENGTH(FIRST_NAME || ' ' || LAST_NAME) + 20, '*') 
    AS FULL_NAME
FROM HR.EMPLOYEES;

SELECT 
  '**********' || FIRST_NAME || ' ' || LAST_NAME || '**********' 
  AS FULL_NAME
FROM HR.EMPLOYEES;

--Q12. Display following output. (Hint: Use Months_between Function)

SELECT 
    EMPLOYEE_ID,
    LAST_NAME,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) * 4.345) AS WEEKS,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTHS,
    FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS YEARS
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 105;


SELECT * FROM HR.jobs
