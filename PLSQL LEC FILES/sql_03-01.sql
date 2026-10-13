--------------------------------------------SET operator-----------------------------------------
-- Union
SELECT 1 FROM dual
UNION 
SELECT 2 FROM dual
UNION 
SELECT 1 FROM dual;

SELECT department_id from hr.employees
UNION
SELECT department_id from hr.departments;

-- Union all
SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 1 FROM dual;

SELECT department_id from hr.employees
UNION ALL
SELECT department_id from hr.departments;
-- Minus
SELECT department_id from hr.employees
MINUS
SELECT department_id from hr.departments;

SELECT department_id from hr.departments
MINUS
SELECT department_id from hr.employees;
-- Intersect
SELECT department_id from hr.employees
Intersect
SELECT department_id from hr.departments;

--------------------- inner query----------------------------------------------------------------------
-- Extract all employee detail those are belong from department 'IT'

SELECT * FROM hr.departments
where department_name = 'IT';

SELECT e.*,d.* from hr.employees e Inner join hr.departments d
on e.department_id = d.DEPARTMENT_ID
where d.DEPARTMENT_NAME = 'IT';

SELECT * FROM hr.employees
WHERE department_id = (
SELECT department_id FROM hr.departments
WHERE DEPARTMENT_NAME IN( 'IT'));

SELECT * FROM hr.employees
where department_id IN (
                        SELECT department_id FROM hr.departments
                        where location_id = (
                                              SELECT location_id FROM hr.locations
                                              where city = 'Seattle')
                        );

SELECT * FROM hr.locations;

-------------------- CO-related sub query-------------------------------------------

SELECT * FROM hr.employees e
WHERE department_id = (
SELECT department_id FROM hr.departments d
WHERE e.department_id = d.department_id
and DEPARTMENT_NAME IN( 'IT'));

