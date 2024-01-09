use practice_2;
----------------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' 
 #City or 'berlin' City. Return salesman_id, name, city, commission.
 
 select * from customers
 where city='berlin' or city ='paris';
 
 ---------------------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to find the details of those salesrpeople who live in
 #cities other than Paris and Rome. Return salesman_id, name, city, commission
 
 
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13);
     
    
    select* from salesman
    where city not in ('paris','rome');
----------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the
 #values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  
 
 select* from customers
 where customer_id in('3007','3008','3009');
 
 -----------------------------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 
 #0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  
 
 select * from salesman
 where commission between 0.13 and 0.15;
 
 -------------------------------------------------------------------------------------------------------------------------------------------
 # From the following table, write a SQL query to select orders between 500 and 4000 
 #(begin and end values are included). Exclude orders amount 948.50 and 
 #1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id
 
 select * from orders
 where (purch_amt between 500 and 4000) and not purch_amt in('948.50',1989.43);
 
 
 -----------------------------------------------------------------------------------------------------------------------------------------
 # From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' 
 #(not inclusive). Return salesman_id, name, city, commission. 
 
 select * from salesman
 where name between'A' and 'L';
 
 ---------------------------------------------------------------------------------------------------------------------------------------------------
 # From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'.
 #Return customer_id, cust_name, city, grade, salesman_id.
 
 SELECT * FROM CUSTOMERS
 where customer_name like 'B%';
 
 --------------------------------------------------------------------------------------------------------------------------------------------------
 #From the following table, write a SQL query to find the details of the customers whose names end with
 #the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
 
 select * from customers
 where customer_name like 'n%';
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------
 # From the following table, write a SQL query to locate all customers with 
 #a grade value. Return customer_id, cust_name,city, grade, salesman_id
 
 select * from customers
 where grade is null;
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------
 