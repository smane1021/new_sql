----------------------------- Date Functions----------------------------------
-- ADD_MONTHS

SELECT SYSDATE,ADD_MONTHS(SYSDATE,1) FROM DUAL;

SELECT employee_id,first_name,salary,hire_date,add_months(hire_date,0.5) 
FROM HR.employees;


--CURRENT_DATE

SELECT SYSDATE, CURRENT_DATE FROM DUAL;

--- EXTRACT()

SELECT employee_id,first_name,salary,hire_date
,extract(MONTH FROM to_date(HIRE_date,'DD-MM-YYYY HH24:MI:SS')) 
FROM hr.employees
where extract(MONTH FROM to_date(HIRE_date,'DD-MM-YYYY')) = 3;


-- LAST_DAY()

SELECT employee_id,hire_date,last_day(hire_date) from hr.employees;

SELECT last_day(sysdate)+1 from dual;

-- Next_day()

select next_day( DATE '2021-01-01','MONDAY') from dual;

-- to_char()

select sysdate,to_char(sysdate,'YYYY/month/Day')--,to_date(sysdate,'YYYY-MON-Day') 
FROM DUAL;