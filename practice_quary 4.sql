use practice_2;


# From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) from orders;
----------------------------------------------------------------------------------------------------------------------------------- 
# From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 

select avg(purch_amt) from orders;

------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople

select count(salesman_id) from salesman;
----------------------------------------------------------------------------------------------------------------------------------------------------------
# From the following table, write a SQL query to count the number of customers. Return number of customers.  

select count(customer_id) from customers;
--------------------------------------------------------------------------------------------------------------------------------------------------------------

#From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.
  select count( all grade) from customers;
  
  ------------------------------------------------------------------------------------------------------------------------------------------------------
  #From the following table, write a SQL query to find the maximum purchase amount.
  
  select max(purch_amt) from orders;
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find the minimum purchase amount. 

select min(purch_amt) from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.

select max(grade), city from customers
group by city;

----------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 

select customer_id, max(purch_amt) from orders
group by customer_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------

#From the following table, write a SQL query to determine the highest purchase 
#amount made by each salesperson on '70001'. Return salesperson ID, purchase amount 

select max(purch_amt)salesman_id 
from orders 
where ord_date ='70001'
group by salesman_id;
-----------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find the maximum order (purchase) amount in
 #the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and
# order date. Return customer id, order date and maximum purchase amount.

select ord_date , customer_id, max(purch_amt) from orders
group by customer_id, ord_date
having max(purch_amt) between 2000 and 6000 ;

------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find the maximum order (purchase) amount based on
 #the combination of each customer and order date. Filter the rows for maximum order (purchase) amount
 #is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
 
 select customer_id , ord_date ,max(purch_amt) from orders
 group by customer_id ,ord_date 
 having max(purch_amt) in (2000,3000,5700,6000);
 ------------------------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to determine the maximum order amount
 #for each customer. The customer ID should be in the range 3002 and 3007
 #Begin and end values are included.). Return customer id and maximum purchase amount.
 
 select customer_id , max(purch_amt) from orders
 where customer_id between 3002 and 3007 
 group by customer_id;
----------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to determine the maximum order (purchase) amount
 #generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008
# (Begin and end values are included.). Return salesperson id and maximum purchase amount.

select salesman_id , max( purch_amt)
from orders
group by salesman_id
having salesman_id between 5003 and 5008;
-------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.

select  count(*) from orders
where ord_date='2012-08-17';
-------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR(10),
    SALARY DECIMAL(10, 2),
    COMMISSION_PCT DECIMAL(4, 2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT
);
INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES (100, 'John', 'Doe', 'JDOE', '555.123.4567', '2024-01-09', 'IT_PROG', 8000.00, 0.00, 103, 60),
(101, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(102, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', 17000.00, 0.00, 100, 90),
(203, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', 12000.00, 0.00, 101, 110),
(206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', 8300.00, 0.00, 205, 110),
(207, 'John', 'Doe', 'jdoe', '555-1234', '2024-01-09', 'CLERK', 5000.00, NULL, 106, 50),
(208, 'Jane', 'Smith', 'jsmith', '555-5678', '2024-01-09', 'SA_REP', 8000.00, 0.20, 145, 80),
(209, 'Robert', 'Johnson', 'rjohnson', '555-9876', '2024-01-09', 'ANALYST', 10000.00, NULL, 101, 60),
(210, 'Alice', 'Williams', 'awilliams', '555-4321', '2024-01-10', 'MANAGER', 12000.00, NULL, 101, 10),
(211, 'Bob', 'Anderson', 'banderson', '555-8765', '2024-01-10', 'CLERK', 5000.00, NULL, 106, 50),
(300, 'Some', 'Name', 'sname', '555-5555', '2024-01-15', 'ANALYST', 11000.00, NULL, 101, 60);

select * from employees;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to change the email column of employees table with 'not available' for all employees.
UPDATE employees SET email='not available';
SET SQL_SAFE_UPDATES = 0;
---------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for all employees.
update employees set  email ='not available',
commission_pct =0.10;

----------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for those employees whose department_id is 110.

update employees set email='not avilable',
commission_pct =0.10
where  department_id =210;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to change the email column of employees table with 'not available' for those employees whose department_id is 80 and
# gets a commission_pct is less than .20

update employees set email ='not available'
where  department_id=80 and commission_pct < 20;

---------------------------------------------------------------------------------------------------------------------------------------------------------
# Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

update employees set salary  =8000
where employee_id =105 and salary <5000;
---------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to 
#department, which ID is 30 and the existing job ID does not start with SH.

update employees set job_id ='sh_clerk'
where  employee_id= 118  and department_id =30 ;
--------------------------------------------------------------------------------------------------------------------------------------------------------
# Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 
#according to the company rules that, salary will be increased by 25% for the department 40, 15% for 
#department 90 and 10% for the department 110 and the rest of the departments will remain same.
 
 UPDATE employees
SET SALARY = CASE
    WHEN DEPARTMENT_ID = 40 THEN SALARY * 1.25
    WHEN DEPARTMENT_ID = 90 THEN SALARY * 1.15
    WHEN DEPARTMENT_ID = 110 THEN SALARY * 1.10
    ELSE SALARY
END
WHERE DEPARTMENT_ID IN (40, 90, 110);
---------------------------------------------------------------------------------------------------------------------------------------------
	# Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as 
	#the salary for those employees by 20% and commission percent by .10.

UPDATE employees
SET SALARY = SALARY * 1.20 + 2000,
    COMMISSION_PCT = COMMISSION_PCT + 0.10
WHERE JOB_ID = 'PU_CLERK';
----------------------------------------------------------------------------------------------------------------------------------------------------