---------------------------Numerical Functions---------------------------------------
-- ABS()-> 

SELECT ABS(-10) FROM DUAL;

-- CEIL()-> 
SELECT ceil(12.34),ceil(10.10) FROM DUAL;

-- FLOOR ->

SELECT ceil(12.34),ceil(10.10),FLOOR(12.34),FLOOR(10.10) FROM DUAL;

-- ROUND()

SELECT ROUND(12.45),ROUND(12.55),ROUND(12.50) FROM DUAL;

SELECT ROUND(15.6789,2) FROM DUAL;

-- TRUNCATE()
SELECT TRUNC(15.6789,2) FROM DUAL;


-- MOD()

SELECT MOD(18,2)FROM DUAL;
SELECT * FROM HR.employees;

-- POWER()
SELECT POWER(13,4) FROM DUAL;

-- SQRT()

SELECT TRUNC(SQRT(14566),2) FROM DUAL;

SELECT BITAND(6, 3) AS result FROM DUAL;
SELECT Mod(6, 3) AS result FROM DUAL;

--Bitwise AND &&
/*A          B                    result
1          1                      1
1          0                      0
0          1                      0
0          0                      0*/

--Bitwise OR ||
/*A          B                    result
1          1                      1
1          0                      1
0          1                      1
0          0                      0*/
