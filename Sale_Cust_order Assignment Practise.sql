--Create above three tables and insert above mentioned data into respective tables.

CREATE TABLE SALESPEOPLE
(SNUM NUMBER PRIMARY KEY,
SNAME VARCHAR2 (20),
CITY VARCHAR2 (20),
COMM NUMBER );

INSERT INTO SALESPEOPLE VALUES (1001,'Peel','London',.12);
INSERT INTO SALESPEOPLE VALUES (1002,'Serres','San Jose',.13);
INSERT INTO SALESPEOPLE VALUES (1004,'Monika','London',.11);
INSERT INTO SALESPEOPLE VALUES (1007,'Rifkin','Barcelona',.15);
INSERT INTO SALESPEOPLE VALUES (1003,'Axelrod','New York',.10);
INSERT INTO SALESPEOPLE VALUES (1005,'Franc','London',.26);
---------------------------------------------------------------------
CREATE TABLE CUSTOMERS
(CNUM NUMBER PRIMARY KEY,
CNAME VARCHAR2 (30),
CITY VARCHAR2 (30),
RATING NUMBER,
SNUM NUMBER,
FOREIGN KEY (SNUM)REFERENCES SALESPEOPLE (SNUM)
);

INSERT INTO CUSTOMERS VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO CUSTOMERS VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO CUSTOMERS VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO CUSTOMERS VALUES (2004,'Grass','Berlin',300,1002);
INSERT INTO CUSTOMERS VALUES (2006,'Clemens','London',100,1001);
INSERT INTO CUSTOMERS VALUES (2008,'Cisneros','San Jose',300,1007);
INSERT INTO CUSTOMERS VALUES (2007,'Pereira','Rome',100,1004);
---------------------------------------------------------------------------------
CREATE TABLE ORDERS
(ONUM NUMBER PRIMARY KEY,
AMT NUMBER(10,2), 
ODATE DATE,
CNUM NUMBER, 
SNUM NUMBER, 
FOREIGN KEY (CNUM) REFERENCES CUSTOMERS(CNUM),
FOREIGN KEY (SNUM) REFERENCES SALESPEOPLE(SNUM)
);

INSERT INTO ORDERS VALUES (3001, 18.69,   TO_DATE('03-10-1996 12:30','DD-MM-YYYY HH24:MI'), 2008, 1007);
INSERT INTO ORDERS VALUES (3003, 767.19,  TO_DATE('03-10-1996 13:45','DD-MM-YYYY HH24:MI'), 2001, 1001);
INSERT INTO ORDERS VALUES (3002, 1900.10, TO_DATE('03-10-1996 12:05','DD-MM-YYYY HH24:MI'), 2007, 1004);
INSERT INTO ORDERS VALUES (3005, 5160.45, TO_DATE('03-10-1996 14:00','DD-MM-YYYY HH24:MI'), 2003, 1002);
INSERT INTO ORDERS VALUES (3006, 1098.16, TO_DATE('03-10-1996 13:37','DD-MM-YYYY HH24:MI'), 2008, 1007);
INSERT INTO ORDERS VALUES (3009, 1713.23, TO_DATE('04-10-1996 15:21','DD-MM-YYYY HH24:MI'), 2002, 1003);
INSERT INTO ORDERS VALUES (3007, 75.75,   TO_DATE('04-10-1996 16:02','DD-MM-YYYY HH24:MI'), 2002, 1003);
INSERT INTO ORDERS VALUES (3008, 4723.00, TO_DATE('05-10-1996 12:07','DD-MM-YYYY HH24:MI'), 2006, 1001);
INSERT INTO ORDERS VALUES (3010, 1309.95, TO_DATE('06-10-1996 13:12','DD-MM-YYYY HH24:MI'), 2004, 1002);
INSERT INTO ORDERS VALUES (3011, 9891.88, TO_DATE('06-10-1996 13:09','DD-MM-YYYY HH24:MI'), 2006, 1001); 
INSERT INTO ORDERS VALUES (3012, 3455.78, TO_DATE('04-10-1996 15:21','DD-MM-YYYY HH24:MI'), 2002, 1003);
INSERT INTO ORDERS VALUES (3013, 1245.98, TO_DATE('04-10-1996 16:32','DD-MM-YYYY HH24:MI'), 2002, 1003);
INSERT INTO ORDERS VALUES (3014, 3721.53, TO_DATE('05-10-1996 12:45','DD-MM-YYYY HH24:MI'), 2006, 1001);
INSERT INTO ORDERS VALUES (3015, 734.50,  TO_DATE('06-10-1996 13:16','DD-MM-YYYY HH24:MI'), 2004, 1002);
INSERT INTO ORDERS VALUES (3016, 1729.67, TO_DATE('06-10-1996 13:07','DD-MM-YYYY HH24:MI'), 2006, 1001);
----------------------------------------------------------------------------------------------------------
--1.	List all customers with a rating of 100.

SELECT * FROM CUSTOMERS
WHERE RATING = 100;

--2.	Find all records in the Customer table with NULL values in the city column.

SELECT * FROM CUSTOMERS
WHERE CITY IS NULL;

--3.	Find the largest order taken by each salesperson on each date.

SELECT S.SNUM,O.ODATE, MAX(O.AMT)
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNUM,O.ODATE;

--4.	Arrange the Orders table by descending customer number.

SELECT * FROM ORDERS
ORDER BY CNUM DESC;

--5.	Find which salespeople currently have orders in the Orders table.

SELECT DISTINCT S.SNUM, S.SNAME
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM

--6.	List names of all customers matched with the salespeople serving them.

SELECT C.CNAME, S.SNAME
FROM CUSTOMERS C
JOIN SALESPEOPLE S
ON C.SNUM = S.SNUM
 

--7.	Find the names and numbers of all salespeople who had more than one customer.

SELECT C.SNUM, S.SNAME, COUNT(C.SNUM)
FROM SALESPEOPLE S
JOIN CUSTOMERS C
ON S.SNUM = C.SNUM
GROUP BY C.SNUM,S.SNAME
HAVING COUNT(C.SNUM)>1; 

--8.	Count the orders of each of the salespeople and output the results in descending order.

SELECT O.SNUM, S.SNAME, COUNT(O.ONUM) AS TOTAL_ORDERS
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY O.SNUM, S.SNAME
ORDER BY TOTAL_ORDERS DESC;

--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
        
SELECT * FROM CUSTOMERS
WHERE EXISTS 
(SELECT 1 FROM CUSTOMERS
WHERE CITY = 'San Jose');


--10.	Match salespeople to customers according to what city they lived in.

SELECT S.SNAME, C.CNAME
FROM SALESPEOPLE S
JOIN CUSTOMERS C
ON S.CITY = C.CITY;

--11.	Find the largest order taken by each salesperson.

SELECT S.SNAME,MAX(O.AMT)AS LARGEST_ORDER
FROM ORDERS O
JOIN SALESPEOPLE S 
ON S.SNUM = O.SNUM
GROUP BY S.SNAME
ORDER BY LARGEST_ORDER DESC;

--12.	Find customers in San Jose who has a rating above 200.

SELECT * FROM CUSTOMERS
WHERE CITY = 'San Jose' AND RATING > 200;

--13.List the names and commissions of all salespeople in London.

SELECT SNAME, COMM 
FROM SALESPEOPLE
WHERE CITY = 'London';

--14.	List all the orders of salesperson Monika from the Orders table.

SELECT * FROM ORDERS 
WHERE SNUM = (SELECT SNUM FROM SALESPEOPLE
              WHERE SNAME = 'Monika');

--15.	Find all customers with orders on October 3.

SELECT O.CNUM, C.CNAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CNUM = O.CNUM
WHERE TRUNC(O.ODATE) = DATE '1996-10-03';

--16.	Give the sums of the amounts from the orders table, grouped by date.

SELECT ODATE ,SUM(AMT)
FROM ORDERS
GROUP BY ODATE;

SELECT 
    TRUNC(ODATE) AS ORDER_DATE,
    SUM(AMT) AS TOTAL_AMOUNT
FROM ORDERS
GROUP BY TRUNC(ODATE)
ORDER BY ORDER_DATE;

--17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.

SELECT TRUNC(ODATE) AS ORDER_DATE,
       SUM(AMT) AS TOTAL_AMOUNT,
       MAX(AMT) AS MAX_AMOUNT
FROM ORDERS
GROUP BY TRUNC(ODATE)
HAVING SUM(AMT) >= MAX(AMT) + 2000
ORDER BY ORDER_DATE;

--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.

SELECT * FROM ORDERS 
WHERE AMT > ANY (SELECT AMT FROM ORDERS
                 WHERE TRUNC(ODATE)=DATE '1996-10-06');

--19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

SELECT S.* FROM SALESPEOPLE S
WHERE EXISTS (SELECT 1 FROM CUSTOMERS C
              WHERE S.SNUM = C.SNUM 
              AND C.RATING = 300);  

--20. Find all pairs of customers having the same rating.

SELECT C1.CNAME, C2.CNAME
FROM CUSTOMERS C1
JOIN CUSTOMERS C2
ON C1.RATING = C2.RATING
WHERE C1.CNAME > C2.CNAME;

--21. Find all customers with CNUM, 1000 above the SNUM of Serres.

SELECT C.* FROM CUSTOMERS C
JOIN SALESPEOPLE S 
ON C.SNUM = S.SNUM
WHERE CNUM > 1000+(SELECT SNUM FROM SALESPEOPLE
                   WHERE SNAME = 'Serres');

--22. Give the salespeople’s commissions as percentage instead of decimal numbers.

SELECT SNAME, COMM*100||'%' AS COMMISSION_PERCENT
FROM SALESPEOPLE
 
--23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.

SELECT S.SNAME,TRUNC(O.ODATE), MAX(AMT) 
FROM ORDERS O
JOIN SALESPEOPLE S
ON O.SNUM = S.SNUM
GROUP BY S.SNAME, TRUNC(O.ODATE)
HAVING MAX(AMT)>3000;

--24. List the largest orders on October 3, for each salesperson.

SELECT MAX(O.AMT), TRUNC(O.ODATE),S.SNAME,S.SNUM
FROM ORDERS O
JOIN SALESPEOPLE S
ON O.SNUM = S.SNUM
WHERE TRUNC(ODATE) = DATE '1996-10-03'
GROUP BY TRUNC(ODATE),S.SNAME,S.SNUM;

--25. Find all customers located in cities where Serres (SNUM 1002) has customers.

SELECT * FROM CUSTOMERS 
WHERE CITY IN (SELECT CITY FROM CUSTOMERS
              WHERE SNUM = 1002);

--26. Select all customers with a rating above 200.00.

SELECT * FROM CUSTOMERS 
WHERE RATING > 200;

--27. Count the number of salespeople currently listing orders in the Orders table.

SELECT COUNT(DISTINCT S.SNUM) 
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM

--28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.



--29. Find salespeople who have multiple customers.


--30. Find salespeople with customers located in their city.



--31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.


 
--32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.



--33. Find the largest orders for ‘Serres’ and ‘Rifkin’.



--34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.


--35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.



--36. Select all the possible combinations of customers that you can assign.



--37. Select all orders that are greater than the average for October 4.



--38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.



SELECT C1.CNUM, C1.CNAME
FROM CUSTOMERS C1
JOIN CUSTOMERS C2
ON C1.CITY = C2.CITY 
WHERE C1.RATING = (SELECT MAX(RATING) FROM CUSTOMERS);


--39. Write a query that totals the orders for each day and places the results in descending order.

SELECT SUM(AMT)AS TOTALS,TRUNC(ODATE)
FROM ORDERS
GROUP BY TRUNC(ODATE)
ORDER BY TOTALS;


--40. Write a select command that produces the rating followed by the name of each customer in San Jose.

SELECT RATING, CNAME
FROM CUSTOMERS
WHERE CITY ='San Jose';

--41. Find all orders with amounts smaller than any amount for a customer in San Jose.

SELECT * FROM ORDERS
WHERE EXISTS (SELECT 1 FROM CUSTOMERS 
              WHERE 

SELECT *
FROM ORDERS
WHERE AMT < ANY 
(SELECT O2.AMT
FROM ORDERS O2
JOIN CUSTOMERS C
ON O2.CNUM = C.CNUM
WHERE C.CITY = 'San Jose'
);
 
--42. Find all orders with above average amounts for their customers.

SELECT * FROM ORDERS O1
WHERE AMT > (SELECT AVG(O2.AMT)
             FROM ORDERS O2
             WHERE O2.CNUM =O1.CNUM);

SELECT * FROM ORDERS O1
WHERE AMT > 
(SELECT AVG(O2.AMT)
FROM ORDERS O2
WHERE O2.CNUM = O1.CNUM);

--43. Write a query that selects the highest rating in each city.

SELECT MAX(RATING),CITY FROM CUSTOMERS 
GROUP BY CITY;

--44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.

SELECT (O.AMT * S.COMM)AS CALCULATED 
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
WHERE O.CNUM IN (SELECT CNUM FROM CUSTOMERS
               WHERE RATING > 100);

SELECT * FROM SALESPEOPLE

--45. Count the customers with rating above San Jose’s average.

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='ORDERS'


--46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.



--47. Find all salespeople that are located in either Barcelona or London.



--48. Find all salespeople with only one customer.



--49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.



--50. Write a query that will give you all orders for more than $1000.00.



--51. Write a query that lists each order number followed by the name of the customer who made that order.



--52. Write 2 queries that select all salespeople (by name and number) 
--who have customers in their cities 
--who they do not service, 
--one using a join and one a correlated subquery. Which solution is more elegant?



--53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.


--54. Write 2 queries that will produce all orders taken on October 3 or October 4.



--55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.


--56. Find only those customers whose ratings are higher than every customer in Rome.



--57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.


--58. Find all rows from the Customer table for which the salesperson number is 1001.


--59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.



--60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.


--61. Produce all combinations of salespeople and customer names such that the former precides the letter alphabetically, 
--and the letter has a rating of less than 200.



--62. List all salespeople’s names and the commission they have earned.



--63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. 
--Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.

     

--64. Find all salespeople for whom there are customers that follow them in alphabetical order.


--65. Write a query that produces the names and ratings of all customers of all who have above average orders.


--66. Find the sum of all purchases from the Orders table.


--67. Write a select command that produces the order number, amount, and date for all rows in the Order table.


--68. Count the number of not null rating fields in the Customer table including duplicates.


--69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.



--70. List the commissions of all salespeople servicing customers in London.



--71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

SELECT * FROM SALESPEOPLE S
WHERE S.CITY <> ALL 
(SELECT C.CITY
FROM CUSTOMERS C
WHERE C.SNUM = S.SNUM);
 
--72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.

SELECT S.SNUM, S.SNAME FROM SALESPEOPLE S
WHERE EXISTS 
(SELECT 1 FROM CUSTOMERS C
WHERE C.CITY = S.CITY
AND C.SNUM <> S.SNUM);

--73. Write a query that selects all customers serviced by Peel or Monika.

SELECT * FROM CUSTOMERS 
WHERE SNUM IN
(SELECT SNUM FROM SALESPEOPLE 
WHERE SNAME IN ('Peel','Monika'));

--74. Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once)

SELECT TRUNC(ODATE) AS ORDER_DATE,
COUNT(DISTINCT SNUM) AS NO_OF_SALESPEOPLE
FROM ORDERS
GROUP BY TRUNC(ODATE)
ORDER BY ORDER_DATE;

--75. Find all orders attributed to salespeople in London.

SELECT * FROM ORDERS 
WHERE SNUM IN 
(SELECT SNUM FROM SALESPEOPLE 
WHERE CITY = 'London');

--76. Find all orders by customers not located in the same cities as their salespeople.

SELECT O.*
FROM ORDERS O
JOIN CUSTOMERS C
ON O.CNUM = C.CNUM
JOIN SALESPEOPLE S
ON C.SNUM = S.SNUM
WHERE C.CITY <> S.CITY

--77. Find all salespeople who have customers with more than one current order.

SELECT DISTINCT S.SNUM,S.SNAME
FROM SALESPEOPLE S
WHERE EXISTS 
(SELECT 1 FROM CUSTOMERS C
JOIN ORDERS O
ON C.CNUM = O.CNUM
WHERE C.SNUM = S.SNUM
GROUP BY C.CNUM
HAVING COUNT(O.ONUM) > 1);

--78. Write a query that extracts from the Customer table every customer assigned to a salesperson 
--who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.

SELECT C1.* FROM CUSTOMERS C1
WHERE EXISTS 
(SELECT 1 FROM CUSTOMERS C2
JOIN ORDERS O
ON O.CNUM = C2.CNUM
WHERE C2.SNUM = C1.SNUM
AND C2.CNUM <> C1.CNUM);

--79. Write a query that selects all customers whose name begins with ‘C’.

SELECT * FROM CUSTOMERS 
WHERE CNAME LIKE 'C%'; 

--80. Write a query on the Customers table that will find the highest rating in each city. 
--Put the output in this form:  for the city (city) the highest rating is : (rating).

SELECT ('FOR THE CITY '||CITY||'THE HIGHEST RATING IS:' ||MAX(RATING)) AS OUTPUT
FROM CUSTOMERS 
GROUP BY CITY;

--81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.

SELECT DISTINCT O.SNUM
FROM ORDERS O
JOIN SALESPEOPLE S
ON O.SNUM = S.SNUM
ORDER BY S.SNUM;

--82. Write a query that lists customers in descending order of rating. Output the rating field first, 
--followed by the customers’ names and numbers.

SELECT RATING, CNAME, CNUM FROM CUSTOMERS
ORDER BY RATING DESC;

--83. Find the average commission for salespeople in London.

SELECT CITY, AVG(COMM)  FROM SALESPEOPLE
WHERE CITY = 'London'
GROUP BY CITY

--84. Find all orders credited to the same salesperson that services Hoffman.

SELECT * FROM ORDERS
WHERE SNUM =
(SELECT SNUM FROM CUSTOMERS
             WHERE CNAME = 'Hoffman');

--85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

SELECT * FROM SALESPEOPLE
WHERE COMM BETWEEN 0.10 AND 0.12;

--86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10

SELECT SNAME, CITY FROM SALESPEOPLE
WHERE CITY = 'London' AND COMM > 0.10;

--87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));

SELECT * FROM ORDERS 
WHERE (AMT < 1000 OR NOT (TRUNC(ODATE)= DATE '1996-03-10' AND CNUM > 2003)); 

--[ ALL ORDERS WILL BE EXTRACTED IN WHICH AMOUNT WILL BE LESS THAN 1000 OR 
-- DATE WILL NOT BE 10 OCT OR CUSTOMER NUMBER WILL BE MORE THAN 2003]

--88. Write a query that selects each customer’s smallest order.

SELECT CNUM, MIN(AMT) FROM ORDERS
GROUP BY CNUM
ORDER BY CNUM;

--89. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.

SELECT * FROM 
(SELECT * FROM CUSTOMERS
WHERE CNAME LIKE 'G%'
ORDER BY CNAME)
WHERE ROWNUM = 1;

--90. Write a query that counts the number of different not NULL city values in the Customers table.

SELECT COUNT(DISTINCT CITY)
FROM CUSTOMERS
WHERE CITY IS NOT NULL;

--91. Find the average amount from the Orders table.

SELECT AVG(AMT) FROM ORDERS;

--92. What would be the output from the following query?
SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);

SELECT * FROM ORDERS
WHERE NOT (TRUNC(ODATE)= DATE '1996-03-10' OR SNUM > 1006) AND AMT >= 1500;
--[A row is selected ONLY IF ALL THREE conditions are true:
--1)Order date is NOT 10-Mar-1996
--2)Salesperson number is ≤ 1006
--3)Order amount is ≥ 1500]

--93. Find all customers who are not located in San Jose & whose rating is above 200.

SELECT * FROM CUSTOMERS
WHERE CITY <> 'San Jose' AND RATING > 200;

--94. Give a simpler way to write this query:
--SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

SELECT * FROM SALESPEOPLE
WHERE COMM BETWEEN 0.12 AND 0.14
  AND COMM NOT IN (0.12, 0.14);

 
--95. Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);

--[A row is returned ONLY IF ALL are true:
--AMT ≤ 2000
--AND
--ODATE is NOT 10-Mar-1996
--OR
--NUM ≤ 1002 ]

--96. Which salespeople attend to customers not in the city they have been assigned to?

SELECT S.SNUM, S.SNAME , C.CNAME 
FROM SALESPEOPLE S
JOIN CUSTOMERS C
ON S.SNUM = C.SNUM
WHERE S.CITY <> C.CITY

--97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?

SELECT SNUM, SNAME 
FROM SALESPEOPLE 
WHERE COMM > 0.11
AND SNUM IN (SELECT SNUM FROM CUSTOMERS
           WHERE RATING < 250);

--98. Which salespeople have been assigned to the same city but get different commission percentages?

SELECT DISTINCT S1.SNUM, S1.SNAME, S1.CITY, S1.COMM 
FROM SALESPEOPLE S1
JOIN SALESPEOPLE S2
ON S1.CITY = S2.CITY
WHERE S1.COMM <> S2.COMM
AND S1.SNUM <> S2.SNUM 

--99. Which salesperson has earned the most by way of commission?

SELECT * FROM 
(SELECT S.SNUM, S.SNAME, SUM(O.AMT * S.COMM) AS TOTAL_COMMISSION
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNUM, S.SNAME
ORDER BY TOTAL_COMMISSION DESC)
WHERE ROWNUM = 1;

--100.  Does the customer who has placed the maximum number of orders have the maximum rating?

SELECT C.CNAME, C.RATING
FROM CUSTOMERS C
WHERE C.CNUM = 
(SELECT CNUM
FROM (SELECT CNUM
FROM ORDERS
GROUP BY CNUM
ORDER BY COUNT(*) DESC)
WHERE ROWNUM = 1);

--101.  Has the customer who has spent the largest amount of money been given the highest rating?

SELECT CNUM, SUM(AMT) AS TOTAL_SPENT
FROM ORDERS
GROUP BY CNUM
ORDER BY TOTAL_SPENT DESC;

SELECT CNAME, RATING
FROM CUSTOMERS
WHERE CNUM = 2006; 

--102.  List all customers in descending order of customer rating.

SELECT * FROM CUSTOMERS
ORDER BY RATING DESC 

--103.  On which days has Hoffman placed orders?

SELECT ODATE FROM ORDERS
WHERE CNUM = 
(SELECT CNUM FROM CUSTOMERS
WHERE CNAME = 'Hoffman')

--104.  Do all salespeople have different commissions?

SELECT DISTINCT COUNT(COMM) FROM SALESPEOPLE;

SELECT 
CASE 
WHEN COUNT(*) = COUNT(DISTINCT COMM) 
  THEN 'YES, all commissions are different'
  ELSE 'NO, some commissions are the same'
  END AS RESULT
FROM SALESPEOPLE;

--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?

SELECT S.SNUM, S.SNAME
FROM SALESPEOPLE S
WHERE S.SNUM NOT IN 
(SELECT DISTINCT O.SNUM
FROM ORDERS O
WHERE TRUNC(O.ODATE) BETWEEN DATE '1996-10-03' AND DATE '1996-10-05');

--106.  How many salespersons have succeeded in getting orders?

SELECT COUNT(DISTINCT SNUM) AS NO_OF_SALESPEOPLE
FROM ORDERS;

--107.  How many customers have placed orders?

SELECT COUNT(DISTINCT CNUM) FROM ORDERS

--108.  On which date has each salesperson booked an order of maximum value?

SELECT O.SNUM, O.ODATE, O.AMT
FROM ORDERS O
WHERE O.AMT = 
(SELECT MAX(O2.AMT) FROM ORDERS O2
WHERE O2.SNUM = O.SNUM);


--109.  Who is the most successful salesperson?

SELECT SNUM, SNAME
FROM SALESPEOPLE
WHERE SNUM = 
(SELECT SNUM FROM ORDERS 
WHERE AMT = (SELECT MAX(AMT) FROM ORDERS))


SELECT * FROM 
(SELECT S.SNUM, S.SNAME,
SUM(O.AMT * S.COMM) AS TOTAL_COMMISSION  ---- AS PER COMMISSION
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNUM, S.SNAME
ORDER BY TOTAL_COMMISSION DESC)
WHERE ROWNUM = 1;

--110.  Who is the worst customer with respect to the company?

SELECT * FROM 
(SELECT C.CNUM,C.CNAME,SUM(O.AMT) AS TOTAL_SPENT
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CNUM = O.CNUM
GROUP BY C.CNUM, C.CNAME
ORDER BY TOTAL_SPENT ASC)
WHERE ROWNUM = 1;


--111.Are all customers not having placed orders greater than 2000 totally been serviced by salesperson Peel or Serres?

SELECT COUNT(*) AS VIOLATIONS
FROM CUSTOMERS
WHERE CNUM IN 
(SELECT CNUM
FROM ORDERS 
GROUP BY CNUM
HAVING SUM(AMT) <= 2000)
AND SNUM NOT IN 
(SELECT SNUM
FROM SALESPEOPLE
WHERE SNAME IN ('Peel', 'Serres')
);


SELECT 
  CASE 
    WHEN COUNT(*) = 0 THEN 'YES'
    ELSE 'NO'
  END AS RESULT
FROM CUSTOMERS C
WHERE C.CNUM IN (
    SELECT O.CNUM
    FROM ORDERS O
    GROUP BY O.CNUM
    HAVING MAX(O.AMT) <= 2000
)
AND C.SNUM NOT IN (
    SELECT SNUM
    FROM SALESPEOPLE
    WHERE SNAME IN ('Peel', 'Serres')
);


--112.  Which customers have the same rating?

SELECT DISTINCT C1.CNUM, C1.CNAME, C1.CITY, C1.RATING
FROM CUSTOMERS C1
JOIN CUSTOMERS C2
  ON C1.RATING = C2.RATING
 AND C1.CNUM <> C2.CNUM;

--113.  Find all orders greater than the average for October 4th.

SELECT * FROM ORDERS
WHERE AMT > 
(SELECT AVG(AMT)FROM ORDERS
WHERE TRUNC(ODATE) = DATE '1996-10-04');

--114.  Which customers have above average orders?

SELECT DISTINCT C.CNUM, C.CNAME
FROM CUSTOMERS C
JOIN ORDERS O
  ON C.CNUM = O.CNUM
WHERE O.AMT > 
(SELECT AVG(AMT)FROM ORDERS);

--115.  List all customers with ratings above San Jose’s average.

SELECT * FROM CUSTOMERS
WHERE RATING >
(SELECT AVG(RATING) FROM CUSTOMERS
WHERE CITY = 'San Jose');

--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.

SELECT S.SNAME, SUM(O.AMT) AS TOTAL_AMT
FROM SALESPEOPLE S
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNAME 
HAVING SUM(O.AMT) >
(SELECT MAX (AMT) FROM ORDERS );

--117.  Give names and numbers of all salesperson that have more than one customer.

SELECT S.SNUM, S.SNAME FROM SALESPEOPLE S
JOIN CUSTOMERS C
ON S.SNUM = C.SNUM
GROUP BY S.SNUM, S.SNAME
HAVING COUNT(C.CNUM) > 1;

--118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.

SELECT DISTINCT S.SNUM, S.SNAME 
FROM SALESPEOPLE S
JOIN CUSTOMERS C
ON S.CITY = C.CITY 
WHERE S.SNUM <> C.SNUM 

--119.  Which customers’ rating should be lowered?

SELECT C.CNUM, C.CNAME,  SUM(O.AMT) AS TOTAL_SPENT
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CNUM = O.CNUM 
GROUP BY C.CNUM, C.CNAME, C.RATING
HAVING SUM(O.AMT) <
(SELECT AVG(TOTAL_AMT)
FROM (SELECT SUM(AMT) AS TOTAL_AMT
FROM ORDERS 
GROUP BY CNUM))
ORDER BY TOTAL_SPENT;

--120.  Is there a case for assigning a salesperson to Berlin?

SELECT 
CASE WHEN COUNT(*) = 0 THEN 'YES'
  ELSE 'NO'
END
FROM SALESPEOPLE
WHERE CITY = 'Berlin' 

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?

SELECT S.SNUM, S.SNAME, S.COMM, SUM(O.AMT) AS TOTAL_SALES
FROM SALESPEOPLE S 
JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNUM, S.SNAME, S.COMM
ORDER BY TOTAL_SALES DESC

SELECT S.SNUM, S.SNAME, S.COMM,
       SUM(O.AMT) AS TOTAL_SALES
FROM SALESPEOPLE S
JOIN ORDERS O
  ON S.SNUM = O.SNUM
GROUP BY S.SNUM, S.SNAME, S.COMM
ORDER BY TOTAL_SALES DESC;


--122.  Does the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?

SELECT 
  CASE 
    WHEN(SELECT SUM(O.AMT)
       FROM ORDERS O
       JOIN CUSTOMERS C
       ON O.CNUM = C.CNUM
       WHERE C.CITY IN ('Rome', 'London'))
      >
      5 * (SELECT SUM(O.AMT * S.COMM)
       FROM ORDERS O
       JOIN SALESPEOPLE S
         ON O.SNUM = S.SNUM
       WHERE S.CITY IN ('London', 'New York'))
    THEN 'YES'
    ELSE 'NO'
  END AS RESULT
FROM DUAL;
 

--123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?

SELECT O.ODATE, O.ONUM, O.AMT, S.CITY 
FROM ORDERS O
JOIN SALESPEOPLE S
ON O.SNUM = S.SNUM
WHERE O.AMT = 
(SELECT MAX(O2.AMT) FROM ORDERS O2
WHERE O2.SNUM = O.SNUM)
ORDER BY S.SNAME

--124.  Which salesperson(s) should be fired?

SELECT S.SNUM, S.SNAME
FROM SALESPEOPLE S
WHERE S.SNUM NOT IN 
(SELECT DISTINCT SNUM
FROM ORDERS);

SELECT S.SNUM, S.SNAME
FROM SALESPEOPLE S
LEFT JOIN ORDERS O
ON S.SNUM = O.SNUM
WHERE O.SNUM IS NULL ;


--125.  What is the total income for the company? 

SELECT SUM(AMT) FROM ORDERS;

SELECT * FROM SALESPEOPLE;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;



