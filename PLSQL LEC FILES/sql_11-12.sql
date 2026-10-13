create table hr_employee AS
SELECT * FROM hr.employees;

SELECT * FROM hr_employee;


create table stru_employee AS
SELECT * FROM hr.employees
where  1 = 2;

SELECT * FROM stru_employee;


create table dumy_employee AS
SELECT * FROM hr.employees
where 1 = 1;

select * from dumy_employee;

select * from all_constraints
where owner = 'HR'
and table_name = 'EMPLOYEES';

select * from all_constraints
where owner = 'SYS'
and table_name = 'DUMY_EMPLOYEE';

select * from all_constraints
where owner = 'SYS'
and table_name = 'SEM1'; 

SELECT * FROM all_TABLES
where table_name = 'DUMY_EMPLOYEE'
;

--------- order by clause------------------------

SELECT * FROM hr.employees
order by employee_id desc;

SELECT * FROM hr.employees
where department_id = 50
order by salary ;


SELECT * FROM hr.employees;


SELECT employee_id, first_name ||' '|| last_name as full_name, salary FROM HR.employees;

SELECT employee_id, first_name ||' '|| last_name as full_name, salary,nvl(commission_pct,0), salary+nvl(commission_pct,0) as total_salary
FROM HR.employees;

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,COMMISSION_PCT, salary*nvl(commission_pct,0.1)/100 as total_commission,
salary + salary*nvl(commission_pct,0.1)/100 as total_salary
FROM HR.employees;

