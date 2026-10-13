-------------------------DRL-----------------------------------------------------
SELECT * FROM hr.employees;

SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.LOCATIONS;

SELECT * FROM HR.COUNTRIES;

SELECT * FROM HR.REGIONS;

-----------------------------where-------------------------------------------------
SELECT * FROM hr.employees
where department_id = 90;

SELECT employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 90;

SELECT employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 50;

SELECT ROWID,employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 90;

-----------------------Operator--------------------------------------------------
SELECT * FROM hr.employees
where department_id <> 50;

SELECT * FROM hr.employees
where department_id != 50;


--- Extract those employee detail having salary gratter than 15000

SELECT * FROM hr.employees
where salary > 15000;

-------- 

select * from hr.employees
where department_id in (10,60,80);

select * from hr.employees
where department_id not in (10,60,80);

select * from hr.employees
where department_id = 50
and salary > 5000;

select * from hr.employees
where department_id = 50
or salary > 5000;

-- between 
select * from hr.employees
where hire_date between '01-01-05' and '31-12-06';


SELECT * FROM hr.employees
where department_id is null;