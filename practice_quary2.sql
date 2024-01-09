create database practice_2;
use practice_2;


 
create table customers(
customer_id int not null,
customer_name varchar(50),
city varchar(50),
grade int,
saleman_id int);

insert into customers 
values(3002 ,'NickRimando' , 'NewYork' , 100 , 5001),
(3007 ,'BradDavis,NewYork',  'NewYork',100,5001),
(3005 ,' Graham Zusi', 'California',200 , 5002),
(3008 , 'Julian Green', 'London',300, 5002),
(3004 , 'Fabian Johnson','Paris',300 ,5006),
(3009 , 'Geoff Cameron', 'Berlin',100 , 5003),
(3003 , 'Jozy Altidor', 'Moscow', 200 ,5007),
(3001 ,'Brad Guzan ','London',200 ,5005);
select * from customers;
-------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100.
 #Return customer_id, cust_name, city, grade, and salesman_id.
 
 select* from customers
 where city='newyork' or grade>100;
-------------------------------------------------------------------------------------------------------------------------------------------------------------
#3. From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100. 
#Return customer_id, cust_name, city, grade, and salesman_id.

select * from customers 
where city ='newyork' or grade>100;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
#4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. 
#Return customer_id, cust_name, city, grade, and salesman_id. 

select * from customers
where city ='newyork' or not grade>100;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#From the following table, write a SQL query to find details of all orders excluding those with 
#ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater
# than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 

create table orders(
ord_date int,
 purch_amt int,
 ord_no int,
 customer_id int,
 salesman_id int);
 
 insert into orders 
 values(70001,150.5,2012-10-05 ,3005,5002),
	(70009,270.65 ,2012-09-10 ,3001 ,5005),
	(70002,65.26,012-10-05 ,3002,5001),
     (70004,110.5,2012-08-1,3009,5003),
     (70005,2400.6,2012-07-27,3007,5001),
     (70008,5760,2012-09-1,3002,5001),
	(70010,1983.43,012-10-1,3004,5006),
    (70003,2480.4 ,2012-10-1,3009,5003),
	(70012,250.45,2012-06-27,3008,5002),
	(70011,75.29,2012-08-17 ,3003,5007),
    (70013,3045.6 ,2012-04-25 ,3002,5001);
 
 select* from orders;
 
 select * from orders
 where ord_date='2012-09-10' or salesman_id='5005' or purch_amt<1000;
 --------------------------------------------------------------------------------------------------------------------------------------------------------------
 #8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or 
 #exclude orders with an order date greater than or equal to '2012-02-10' and 
 #a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id
 
 select * from orders
 where purch_amt <200 or ord_date>='2012-02-10' and customer_id<3009;
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------
 # From the following table, write a SQL query to find all orders that meet the following conditions.
 #Exclude combinations of order date equal to '2012-08-17' 
 #or customer ID greater than 3005 and purchase amount less than 1000
 
 select* from orders
 where ord_date ='2012-08-17' or customer_id >='3005' and purch_amt <'1000'; 
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #10. Write a SQL query that displays order number, purchase amount, and 
 #the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
 
 select ord_no , purch_amt, 
 (100*purch_amt)/6000 as 'achived',
 (100*(6000-purch_amt)/6000) as 'unachived'from orders
 where (100*purch_amt)/6000>50;
 ----------------------------------------------------------------------------------------------------------------------
#11. From the following table, write a SQL query to find the details of all employees whose last name is 
#‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
 
 select * from customers
 where customer_name ='Julian Green' or customer_name ='Geoff Cameron';
