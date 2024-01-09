create database quary_practice;
use  quary_practice;
select* from data_science_team;
SELECT * FROM quary_practice.emp_record_table;
---------------------------------------------------------------------------------------------------
# How to select UNIQUE records from a table using a SQL Query?
select emp_id ,exp from data_science_team
group by emp_id, EXP;
#or 
select 	DISTINCT emp_id,exp from data_science_team ;

--------------------------------------------------------------------------------------------------
#How to read TOP 5 records from a table using a SQL query?
select * from data_science_team order by emp_id limit 5;

-------------------------------------------------------------------------------------------------
# last five reord
select * from data_science_team
order by emp_id desc
limit 5;
----------------------------------------------------------------------------------------------
#inner join 
select* from
 data_science_team inner join emp_record_table
 on data_science_team.emp_id =emp_record_table.emp_id;
 ---------------------------------------------------------------------------------------------
 #left join
 select* from
  data_science_team left join emp_record_table
 on data_science_team.emp_id =emp_record_table.emp_id;
 
 -------------------------------------------------------------------------------------------------
 #right join
  select* from
  data_science_team right join emp_record_table
 on data_science_team.emp_id =emp_record_table.emp_id;
 ---------------------------------------------------------------------------------------------------------
 # cross join
   select* from
  data_science_team cross join emp_record_table;
  -----------------------------------------------------------------------------------------------------------
  # How to find the employee with second MAX Salary using a SQL query?
  select max(salary) as salary from emp_record_table;
   #or
   select emp_id , max(salary) as salary from emp_record_table 
   group by emp_id;
-----------------------------------------------------------------------------------------------------------------------
#top 3 salary
select * from emp_record_table
order by salary
limit 3 ;
----------------------------------------------------------------------------------------------------------------
#max 3 record
SELECT salary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM emp_record_table
) ranked_salaries
WHERE salary_rank <= 3;
--------------------------------------------------------------------------------------------------
# max 3 record 
SELECT DISTINCT salary
FROM emp_record_table
ORDER BY salary DESC
LIMIT 3;

-------------------------------------------------------------------------------------------------------
#clouses: where , having, group by, order by
# where clouse used for the specific condition  used 

select emp_id,salary from emp_record_table
where salary <= 4500;

# group by is used the grouo of the row as same values and its used the agregate function as avg , sum, 
select emp_id , avg(salary)from emp_record_table
group by emp_id;

#The HAVING clause is used to filter the results of a GROUP BY clause based on a specified condition.
#It is similar to the WHERE clause but operates on the result of aggregate functions applied using GROUP BY.

SELECT emp_id, AVG(salary) AS avg_salary
FROM emp_record_table
GROUP BY emp_id
HAVING AVG(salary) > 50000;

---------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.

create table countries (
country_id int,
country_nme varchar (50),
region_id int);
# Write a SQL statement to insert a record with your own value into the table countries against each columns
  insert into countries values( 1,"pravin",20);
  
  ------------------------------------------------------------------------------------------------------------------------------
 #Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.
 
 alter table countries
 add (
country_id int,
country_nme varchar (50),
region_id int);

 #Write a SQL statement to insert NULL values against region_id column for a row of countries table.
 insert into countries(country_id,country_nme,region_id)
 values(1,"pravin",null);
 
 # Write a SQL statement to insert 3 rows by a single insert statement.
 insert into countries values
(1,'pr',12),
(2,'pt',11),
(3,'jk',25);
 
 
 -------------------------------------------------------------------------------------------------------------------------------------------
  #Write a SQL statement to create the structure of a table dup_countries similar to countries.
  
  create table dup_countries as 
  select* from countries;
  -------------------------------------------------------------------------------------------------------------------------------------------
  #Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
  create table dup_countries as 
  select * from dup_countries;
  --------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and 
#check whether the max_salary amount exceeding the upper limit 25000.
create table job (
job_id int not null,
job_title varchar(50) not null,
min_salary decimal(6,0),
max_salary decimal(6,0) not null check(max_salary <=25000));

--------------------------------------------------------------------------------------------------------------------------------------------
 #rite a SQL statement to create a table named countries including columns country_id, 
 #country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
create table countriees (
country_id int,
country_name varchar(50) not null check(country_name in("italy","india","china")),
region_id int not null);
----------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and 
#department_id and make sure that the value against column end_date will be
# entered at the time of insertion to the format like '--/--/----'.

create table job_histry (
emp_id int not null,
start_date int not null,
end_date int not null check (end_date like  '--/--/----'),
job_id int not null,
maneger_id int,
dep_id int not null);
drop table job_histry;
---------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table named countries including columns country_id,country_name and 
#region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

create table countriess (
country_id int primary key,
country_name varchar(50),
region_id int not null,
unique(country_id));
-------------------------------------------------------------------------------------------------------------------------------------------------
  #Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and 
  #max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL
  #will be entered automatically at the time of insertion if no value assigned for the specified columns.;
  
  create table jobs (
  job_id int not null,
  job_title varchar(50) not null default(min_salary =8000),
  min_salary int not null,
  max_salary int null);
  drop table jobs;
  #or
  CREATE TABLE jobss (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(255) DEFAULT '',
    min_salary INT DEFAULT 8000,
    max_salary INT
);

. #Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

insert ignore into jobs values
(1,'skf',8000,80000) ;
select * from jobs;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and 
#make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.

create table contry(
country_id int  unique key,
countr_name varchar(50)  not null,
region_id int not null);

create table contryy(
country_id int  primary key,
countr_name varchar(50)  not null,
region_id int not null);
drop table contryy;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table countries including columns country_id, country_name and 
#region_id and make sure that the column country_id will be unique and store an auto incremented value.
 create table countryesss(
 country_id int unique auto_increment,
 country_name varchar(50) not null,
 region_id int );
 
 CREATE TABLE countrie (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL
);
drop table countrie;
------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table countries including columns country_id, country_name and 
#region_id and make sure that the combination of columns country_id and region_id will be unique.

create table countryyy(
country_id int not null,
country_name int,
region_id int,
primary key( country_id, region_id));

----------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and 
#department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the 
#foreign key column job_id contain only those values which are exists in the jobs table.

create table job_historyy(
emp_id int primary key,
start_date  date not null ,
end_date date not null , 
job_id int,
dep_id int ,
constraint job_historyy foreign key(job_id) references job(job_id));

CREATE TABLE job_history (
    employee_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10),
    department_id INT,
    CONSTRAINT  FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

drop table job_historyy;

#write a SQL statement to insert rows in the job_history table in 
#which one column job_id is containing those values which are exists in job_id column of job table
insert into job_historyy(emp_id,start_date,end_date, job_id,dep_id)values
(1,'11-12-2000','12-12-2022',1212,25);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, 
#phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id 
#column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and 
#manager_id columns contain only those unique combination values, 
#which combinations are exists in the departments table.

CREATE TABLE departmentss (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(50) NOT NULL,
    manager_id INT NOT NULL,
    INDEX idx_dep_manager (dep_id, manager_id)
);


INSERT INTO departmentss (dep_id, dep_name, manager_id) VALUES
    (1, 'HR', 100),
    (2, 'Finance', 101);


CREATE TABLE employ (
    emp_id INT NOT NULL PRIMARY KEY,
    frist_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(55) NOT NULL,
    phone_number INT NOT NULL,
    hire_date DATE,
    job_id INT NOT NULL,
    salary INT,
    commison VARCHAR(50),
    maneger_id INT NOT NULL,
    dep_id INT NOT NULL,
    CONSTRAINT fk_department_manager 
        FOREIGN KEY (dep_id, maneger_id) 
        REFERENCES departments(dep_id, manager_id)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain 
#any duplicate data and this will be automatically incremented and 
#the column country_name will be filled up by 'N/A' if no value assigned for that column.

CREATE TABLE count (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) DEFAULT 'N/A' NOT NULL,
    region_id INT NOT NULL
);

-- Insert records into the countries table
INSERT INTO count (country_name, region_id) VALUES ('india', 1),('china',23);

INSERT INTO count (region_id) VALUES (2); -- 'N/A' will be assigned to country_name
INSERT INTO countries (country_name, region_id) VALUES ('Country3', 3);
select* from count;

-----------------------------------------------------------------------------------------------------------------------------------------------------
.# Write a SQL statement to insert rows into the table employees in which a set of columns department_id and 
#manager_id contains a unique value and that combined values must have exists into the table departments
 create table dep(
 dep_id int ,
 maneger_id int ,
 dep_name varchar(50),
 primary key(dep_id,maneger_id));
 
 insert into dep values(1,22,'aks');
 
 create table emp(
 emp_id int ,
 emp_name varchar (50),
 dep_id int,
 maneger_id int,
 foreign key(dep_id,maneger_id) references dep(dep_id,maneger_id));
 
 insert into emp(emp_id,emp_name,dep_id,maneger_id) values(501,'ak',12,1212);
 ------------------------------------------------------------------------------------------------------------------------------------------------------
 --