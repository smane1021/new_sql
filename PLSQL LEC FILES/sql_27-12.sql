-----------------------Aggregate Functions----------------------------------------------------------

--AVG()
-- count()
-- max()
-- min()
-- sum()

----------------------------------------------AVG()------------------------------------------------------------

SELECT * FROM hr.employees;

select avg(salary) from hr.employees;
select min(salary) from hr.employees;
select * from hr.employees
order by salary ;
select max(salary) from hr.employees;
select * from hr.employees
order by salary desc;

select sum(salary) from hr.employees;

select count(*) from hr.employees;

select count(commission_pct) from hr.employees;

select count(department_id) from hr.employees;


SELECT * FROM hr.employees
where department_id is null;

select sum(10,20,30,40) from dual;


SELECT * FROM hr.employees
where department_id = 100;


--------------- find department wise count----------------------------

SELECT department_id,salary,count(*),sum(salary),round(avg(salary),2) FROM hr.employees
group by department_id,salary;

SELECT * FROM hr.employees
where department_id = 90;

SELECT job_id,count(*) FROM hr.employees
group by job_id;

select manager_id, count(*)
from hr.employees
group by manager_id;

select department_id, count(*) as total
from hr.employees
where department_id in (10,50,60,70)
group by department_id
--having count(*) > 10
;

SELECT DEPARTMENT_ID,SUM(SALARY)
FROM HR.employees
where DEPARTMENT_ID > 50
group by DEPARTMENT_ID
having SUM(SALARY) > 75000;

SELECT DEPARTMENT_ID,SUM(SALARY)  total_salary
FROM HR.employees
group by DEPARTMENT_ID
having SUM(SALARY) > 75000
order by total_salary desc
;

-------- Specia functions-------------------------------

--NVL()
SELECT NVL(100,200) FROM DUAL;
SELECT NVL(null,200) FROM DUAL;

SELECT employee_id,first_name,salary,commission_pct, nvl(commission_pct,0),department_id,nvl(to_char(department_id),'N/A')
FROM hr.employees;

-- NVL2()

SELECT NVL2(20,null,500) from dual;
SELECT NVL2(null,200,null) from dual;

SELECT employee_id,first_name,salary,commission_pct,nvl2(commission_pct,0.5,0.5)
FROM hr.employees;

-- nullif()

SELECT NULLIF(100,100) FROM DUAL;

SELECT NULLIF(100,10) FROM DUAL;

SELECT NULLIF(null,10) FROM DUAL;