select * from hr.employees
order by department_id;

select * from hr.departments;

select * from hr.locations;


---- Extract all the employee detail with respective department name
-- inner join
-- left outer
-- right outer
-- full outer
---------------------- Inner------------------------------------------------------------------
select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e,hr.departments d
where e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,city
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id
right join hr.locations l
on d.LOCATION_ID = l.LOCATION_ID;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e,  hr.departments d
where e.department_id(+) = d.department_id;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e right join  hr.departments d
on e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e,  hr.departments d
where e.department_id = d.department_id(+);

-------------------------------------------Self join------------------------------------------------------
SELECT manager_name,count(*) FROM (select e2.manager_id,e1.first_name as manager_name,e2.employee_id,e2.first_name
from hr.employees e1, hr.employees e2
where e1.employee_id=e2.manager_id)
group by manager_name
;




------------------------------------------------------------------------------------------------------------
select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e full join  hr.departments d
on e.department_id = d.department_id
order by e.department_id;



select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id;


select *
from hr.employees e cross join  hr.departments d;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e , hr.departments d;
