------------------------------- coalesce()---------------------------------------------------------

 

select coalesce(NULL,NULL,NULL,10,NULL,11,12) from dual;

 

 

select * from HR.EMPLOYEES;

 

------------------------ Case statement------------------------------------------

 

SELECT employee_id,first_name,last_name,salary,

case 

  when salary >= 10000 THEN 'High salary'

  when salary between 5000 and 9999 THEN 'Medium Salary'

  when salary between 3000 and 4999 THEN 'Low salary'

  ELSE 'Not Specified'

END as Salary_Category

FROM Hr.employees;

 

SELECT employee_id,first_name,last_name,salary,

case 

  when salary >= 10000 THEN 1.5

  when salary between 5000 and 9999 THEN 1.0

  when salary between 3000 and 4999 THEN 0.5

  ELSE 0.1

END as commission_pct,salary * case 

  when salary >= 10000 THEN 1.5

  when salary between 5000 and 9999 THEN 1.0

  when salary between 3000 and 4999 THEN 0.5

  ELSE 0.1

END as total_salary

FROM Hr.employees;

 

 

-------------Decode--------------------------------

 

SELECT DECODE(1,1,'one','not equal') FROM DUAL;

 

SELECT DECODE(6,1,'one',2,'two',3,'three',4,'four','not matching') FROM DUAL;

 

----------------------------------------------Analytical function----------------------------------------------------------------

-- rank()/dense_rank()/row_number()

 

SELECT DEPARTMENT_ID,MAX(SALARY)

FROM HR.employees

group by department_id;

 

SELECT * FROM (SELECT employee_id,first_name,last_name,salary,department_id,

RANK() OVER(order by salary desc) rnk

FROM HR.employees)

where rnk = 2;

 

SELECT employee_id,first_name,last_name,salary,salary * updated_commission total_salary

FROM (SELECT employee_id,first_name,last_name,salary,

case 

  when salary >= 10000 THEN 1.5

  when salary between 5000 and 9999 THEN 1.0

  when salary between 3000 and 4999 THEN 0.5

  ELSE 0.1

end as updated_commission

FROM Hr.employees);

 

 

SELECT * FROM (SELECT employee_id,first_name,last_name,salary,department_id,

RANK() OVER( partition by department_id order by salary desc) rnk,

DENSE_RANK() OVER(partition by department_id order by salary desc) drnk,

row_number() OVER(partition by department_id order by salary desc) rn

FROM HR.employees)

where drnk = 1

;






SELECT * FROM (SELECT employee_id,first_name,last_name,salary,department_id,hire_date,Year,

RANK() OVER( partition by Year order by salary desc) rnk,

DENSE_RANK() OVER(partition by Year order by salary desc) drnk,

row_number() OVER(partition by Year order by salary desc) rn

FROM (SELECT employee_id,first_name,last_name,salary,department_id,hire_date, to_char(hire_date,'YYYY') Year

FROM HR.employees))

where drnk = 1;





