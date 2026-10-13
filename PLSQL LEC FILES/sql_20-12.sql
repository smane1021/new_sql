-- Functions :-
-- Functions help us to manuplate data more effeciently 

-- String function
-- Date Functions
-- Numeric Functions
-- Aggregate functions
-- Analytical functions


-------------------------------------------------------String Functions-------------------------------------------
-- ASCII():- Return a ASCII code for character

SELECT ASCII(' ') FROM DUAL;

SELECT first_name,ascii(first_name) from hr.employees;

select chr(32) from dual;

-- CONCAT():  Concatnate function is used to combaine 2 string

select concat('A','BC') FROM DUAL;

select first_name,last_name,concat(first_name,last_name) from hr.employees;

select first_name,last_name,first_name||' '||last_name from hr.employees;

-- INITCAP(): 
SELECT INITCAP('abc') from dual;

SELECT * FROM hr.employees;

SELECT employee_id,first_name,last_name,email,initcap(email)
from hr.employees;

-- UPPER()

SELECT employee_id,upper(first_name) as first_name,last_name
from hr.employees;

-- LOWER()
SELECT employee_id,lower(first_name) as first_name,last_name
from hr.employees;

-- Length()

select length('abc') from dual;

SELECT employee_id,first_name,length(first_name)
from hr.employees;


-- INSTR():- Search for a substring and return the location of the sub string in a given string

SELECT INSTR('This is a playlist','is',1,1)
,INSTR('This is a playlist','is',1,2),
INSTR('This is a playlist','is',1,3)
from dual;


SELECT INSTR('This is a playlist','is',-1)
from dual;

-- SUBSTR(): Extract a substring from a string

SELECT SUBSTR('Oracle substring',-8,8) from dual;

--rahul.bhujbal369@gmail.com

-- LPAD():
SELECT LPAD('ABC',5,'*') FROM DUAL;

select employee_id,first_name, lpad(first_name,10,'*') from hr.employees;

-- RPAD()
select employee_id,first_name, rpad(first_name,10,'*') from hr.employees;
-- LTRIM() , RTRIM() & TRIM()
select ltrim(' ABC') from dual;

-- Replace()

SELECT replace('This is a test','is','IS') from dual;

SELECT TRANSLATE('oracle,python,database,AI',',',':') from dual;
SELECT translate('This is a test','i','I') from dual;