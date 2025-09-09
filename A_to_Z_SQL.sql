-- Basic MS SQL Server.
--CREATE STATEMENT.

CREATE DATABASE employeeDB;

USE	employeeDB;

CREATE TABLE employee_info(
empID INTEGER PRIMARY KEY,
empName VARCHAR(50) NOT NULL,
empSalary Decimal(10,2) NOT NULL,
job VARCHAR(50),
phone VARCHAR(50),
deptID INTEGER
);


--INSERT STATEMENT.

INSERT INTO employee_info
VALUES
(01,'ADITY', 23000,'Jr.Developer','6798453210',10
);


INSERT INTO employee_info(empID,empName,empSalary)
VALUES 
(02,'SMITH',35000);



--SELECT STATEMENT.

SELECT * FROM employee_info;


SELECT * FROM dbo.employee_info;


SELECT empName,empSalary FROM employee_info;

 
 --UPDATE STATEMENT.

 UPDATE	 employee_info 
 SET 
 empSalary= empSalary+1000;

 UPDATE	employee_info SET job='Tester', phone='3456789801',deptID=10
 WHERE empName='SMITH';

 UPDATE employee_info 
 SET phone = '3456789801', deptID = 20
 WHERE empID = 2



 --DETELET STATEMENT.

 SELECT * FROM employee_info;

 --CONDITION BASED

 DELETE FROM employee_info
 WHERE deptID = 20;

  DELETE FROM employee_info
 WHERE empSalary = 16000;

 DELETE FROM employee_info;



 DROP TABLE employee_info;
 -- ORDER BY CLAUSE.

 INSERT INTO employee_info
VALUES
(01,'SAI', 23000,'Developer','6798453210',10),
(02,'ADITY', 55000,'TESTER','6788656218',20),
(04,'ADAM',34000,'Developer','8976542309',30),
(05,'STEVE', 32000,'TESTER','3454445576',20),
(03,'BRIAN',15000,'FRESHER','4567653421',10);

UPDATE employee_info
SET empName = 'SAI'
WHERE EmpID = 1;  -- or any other unique condition

SELECT * FROM employee_info;
 
SELECT * FROM employee_info 
ORDER BY empSalary;

SELECT * FROM employee_info 
ORDER BY empSalary desc;

SELECT * FROM employee_info 
ORDER BY empName;


SELECT * FROM employee_info 
ORDER BY empName desc;


SELECT * FROM employee_info 
ORDER BY phone;



--WHERE CLAUSE.

SELECT * FROM employee_info;

SELECT * FROM employee_info 
WHERE deptID = 10;

SELECT * FROM employee_info 
WHERE job = 'Jr.Developer';

SELECT * FROM employee_info 
WHERE job = 'fresher';


UPDATE employee_info SET empSalary =empSalary + 5000 
where deptID = 20;


UPDATE employee_info SET job = 'DEVELOPER' 
where deptID = 10;


UPDATE employee_info SET JOB = 'SQL DEVELOPER' 
where empName = 'BRIAN';


DELETE FROM employee_info
WHERE job = 'tester';

select deptID,
    sum(empSalary) as total_Salary
from employee_info           -- where clause used alongwith the grouping clause.
where deptID = 20
group by deptID;



--AGGREGATE FUNCTION.

USE employeeDB;

SELECT * FROM employee_info;

SELECT SUM(empSalary) FROM employee_info; 


SELECT AVG(empSalary) FROM employee_info;


SELECT MAX(empSalary)FROM employee_info;

SELECT MIN(empSalary)FROM employee_info;


SELECT COUNT (empSalary) FROM employee_info;

SELECT COUNT (empName) FROM employee_info;

SELECT COUNT (empID) FROM employee_info;

SELECT COUNT (job) FROM employee_info;

SELECT COUNT (phone) FROM employee_info;

SELECT COUNT (deptID) FROM employee_info;


INSERT INTO employee_info (empID, empName, empSalary) 
values
(6, 'ROB','16000');


--NUMERIC FUNCTION.

SELECT ABS(-50); --IT CONVERT THE -VE VALUES INTO +VE.
SELECT ABS(50); --IT CONVERT THE -VE VALUES INTO +VE.

SELECT CEILING(76.55);-- IT RETURNS THE UPPER VALUES. ALSO CONVERT THE FLOATING VALUES INTO INTIGER VALUE.

SELECT FLOOR(76.55); --IT RETURNS THE LOWER VALUES.

SELECT SIGN(15);
SELECT SIGN(-15); -- IF WE PASS THE +VE VALUES THEN IT WILL RETURN THE 1. 
SELECT SIGN(0);   --AND IF WE PASS THE -VE VALUES THEN IT WILL RETURN THE -1.

SELECT SQUARE(5); -- IT RETURN SQUARE OF 5== 25.
SELECT SQRT(81); -- IT RETURN SQUAREROOT OF 81 == 9.
SELECT PI(); -- IT RETURN THE VALUES OF PI. WHICH IS HELPS IN CALCULATION.

SELECT COS(30), SIN(90), TAN(45); -- IT IS A TRIGNOMENTRY FUNCTION.

SELECT EXP(2)
SELECT EXP(1)



--STRING FUNCTION.

SELECT LEN('DATABASE') -- IT RETURN THE VALUES OF LENGTH.

SELECT empName, LEN(empName) FROM employee_info

SELECT UPPER(' i am don') -- it convert the lower string into upper string

SELECT empName, lower(empName) FROM employee_info; -- it return the lower string to upper string.

SELECT LTRIM('  SHIVRAJ  ');
SELECT LTRIM('     SHIVRAJ'); -- IT REMOVE THE LEFT SPACE IN GIVEN STRING.
SELECT RTRIM('SHIVRAJ     '); --IT REMOVER THE RIGHT SPACE IN GIVEN STRING.

SELECT SUBSTRING('SHIVRAJ',5,7); -- IT RETURN THE SUB PART OF THE QUERY.

SELECT REPLACE('SHIVRAJ','SHIV','SHIVA'); -- IT REPLACE THE SPECIFIC PART OF GIVEN STRING.

SELECT REPLICATE('DUMMY_ ',5); -- IT RETURN THE ,MULTIPLE CAPIES BY GIVEN STRING.

select * from employee_info;


-- BOOLEAN OPERATOR functions.

CREATE TABLE tbl_user_login(
user_id INT PRIMARY KEY IDENTITY,
username VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(50) NOT NULL
);


INSERT INTO tbl_user_login(username,email, password)
VALUES
('IRONMAN','tony@stark.com','tony123'),
('captain','steve@captain.com','steve456'),
('spidy','peter@parker.com','peter123'),
('wonder','wonder@woman.com','wonder123');


SELECT * FROM tbl_user_login;

SELECT username, LOWER(username) from tbl_user_login;


SELECT * FROM tbl_user_login;

	
SELECT * FROM tbl_user_login
	WHERE email = 'steve@captain.com' -- it gives all details.
	AND password = 'steve456';
	

select username from tbl_user_login
	where email = 'tony@stark.com'     --AND.
	and password = 'tony123';


select password from tbl_user_login
	where  user_id = 2
	AND  username = 'captain'; 


SELECT password from tbl_user_login
	where username ='spidy'
	or email ='peter@peter.com';


SELECT password from tbl_user_login
where username ='spidi'              -- OR.
or email ='peter@peter.com';

SELECT password from tbl_user_login
where username ='spidy'
or email ='peter@parker.com';

SELECT * FROM tbl_user_login;

SELECT password from tbl_user_login
where NOT username ='spidy'             --NOT.

SELECT password from tbl_user_login
where username !='IRONMAN'  


-- DATE & TIME functions.
-- 1.getdate(),getdate(),current_timestamp, sysdatetime().
-- 2.datename().
-- 3.datediff().
-- 4.dateadd().

select getdate() as Today_Date;

select sysdatetime() as Today_Date;

select CURRENT_TIMESTAMP as Today_Date;

-- DateName.
SELECT DATENAME(month, GETDATE())     -- Returns 'July'
SELECT DATENAME(weekday, GETDATE())   -- Returns 'Tuesday'
SELECT DATENAME(year, '2025-07-22')   -- Returns '2025'
SELECT DATENAME(hour, GETDATE())      -- Returns current hour
select datename(month,CURRENT_TIMESTAMP) as 'month';                   --DATENAME(datepart, date)
select datename(YEAR,CURRENT_TIMESTAMP) as 'Year';                   --DATENAME(datepart, date)
select datename(HOUR,CURRENT_TIMESTAMP) as 'Hours';                   --DATENAME(datepart, date)


--DATEDIFF.
select datediff(year, 'april 18 2002', CURRENT_TIMESTAMP) as age;
select datediff(MONTH, 'april 18 2002', CURRENT_TIMESTAMP) as ageInmonth;
select datediff(HOUR, 'april 18 2002', CURRENT_TIMESTAMP) as ageInhour;
select datediff(WEEKDAY, 'april 18 2002', CURRENT_TIMESTAMP) as ageInWeekday;
select DATEDIFF(year, 'April 18 2002', 'july 22 2025') as "ageInyears"; 

-- Dateadd.
select dateadd(MONTH,10,CURRENT_TIMESTAMP) as "10MonthsFromNow";
select dateadd(MONTH,12,CURRENT_TIMESTAMP) as "12 Months From Now";
SELECT DATEADD(YEAR, 5, CURRENT_TIMESTAMP) AS "next_appointment";

select dateadd(year,5,current_timestamp) as "next_appointment"; 

-- GROUP BY CLAUSE.
select column_name(),Aggregate_fun()
FROM Table_name
GROUP BY column_name

CREATE TABLE employees (
    id INT,
    firstname VARCHAR(50),
    lastname varchar(50),
    department VARCHAR(50),
    salary INT
);

--drop table employees;
--alter table employees add FrisrName char(10),  char(50);

INSERT INTO employees (id, Firstname,Lastname, department, salary) VALUES
(1, 'Alice','stock', 'HR', 30000),
(2, 'Bob','Rao', 'IT', 50000),
(3, 'Carol','pollad', 'IT', 55000),
(4, 'David','warnar', 'HR', 32000),
(5, 'Eva','disuzza', 'Sales', 40000),
(6, 'Frank','smith', 'Sales', 42000);

-- concatenation method.
 
 select id, 
        firstname + ' ' + lastname 'full_name',  -- here we use concatenation method as well ws Aliase.
        department,
        salary
    from
        employees;

SELECT * FROM employees;



SELECT department, AVG(salary) AS average_salary
FROM employees                            --Group by Department and Find Average Salary.
GROUP BY department;


SELECT department, salary, COUNT(*) AS number_of_employees
FROM employees                            --Want to Group by More Than One Column.
GROUP BY department, salary;



SELECT 
   id,
    min(salary) as minimum_salary,
    max(salary) as maximum_Salary
FROM                  --here  group not possible bcz grouping always appliy on not distnitc values table.  
    employees
GROUP BY 
   id;
                                         

SELECT 
    name,
    min(salary) as minimum_salary,
    max(salary) as maximum_Salary
FROM                     --here  group not possible bcz grouping always appliy on not distnitc values table.
    employees
GROUP BY 
    name;
                 
                 
SELECT 
    department,
    min(salary) as minimum_salary,
    max(salary) as maximum_Salary
FROM            -- we can apply grouping caluse here bcz department name not contain unique values.
    employees
GROUP BY 
   department;
         
         
SELECT  ID 
FROM employees
GROUP BY ID;


SELECT ID,
    SUM(salary) AS TOTAL
FROM
    employees
GROUP BY ID;


SELECT * FROM employee_info;

SELECT deptID
FROM employee_info
GROUP BY deptID;

SELECT job,
    sum(empSalary) as Total_salary
FROM employee_info
GROUP BY job;
select * from employee_info;


select deptID,
    sum(empSalary) as Total_salary
FROM employee_info
GROUP BY deptID;
select * from employee_info;

select deptID,
    avg(empSalary) as Total_salary
FROM employee_info
GROUP BY deptID;
select * from employee_info;



select phone,
    min(empsalary),
    max(empsalary)
from 
    employee_info
group by 
    phone;
select * from employee_info; 



SELECT deptID,
       ROUND(AVG(empSalary), 2) AS 'AVG salary' -- this round function return the only two digits after decimal points.
FROM employee_info
GROUP BY deptID;


SELECT deptID,
    AVG(empSalary) as 'AVG salary'
FROM employee_info
GROUP BY deptID;

-- HAVING CLAUSE:

select * from employee_info; 

select deptID,
    sum(empSalary) as total_salary
from employee_info
group by deptID 
having deptID = 20;

select deptID,
    sum(empSalary) as Total_Salary
from employee_info
group by deptID
having deptID > 20;

select deptID,
    sum(empSalary) as Total_Salary
from employee_info
group by deptID
having  deptID < 20;

select * from employee_info;
SELECT job,
    MAX(empSalary) as Total_salary,
    round(avg(empSalary), 2) as Total_salary
FROM employee_info
GROUP BY job ;


select deptID,
    sum(empSalary) as Total_salary
from employee_info
where deptID = 20
group by deptID;

select deptID,
    sum(empSalary) as total_Salary
from employee_info
group by deptID
HAVING deptID = 20;

select * from employee_info; 
select deptID,
    sum(empSalary) as total_Salary
from employee_info
group by deptID
having sum(empsalary) < 50000;


select deptID,
    sum(empSalary) as total_Salary
from employee_info
group by deptID
having sum(empSalary) between 10000 AND 40000;


--TOP clause.

select * from tbl_user_login;

select top(3) user_id 
from tbl_user_login
order by user_id DESC;

select * from employee_info;

select top(4) empSalary
from employee_info
group by empSalary
order by empSalary desc; 


-- To create a copy of the table from different table.

use employeeDB;

select * from employee_info;

create database simple_emp_detail;

use simple_emp_detail;


select * into emp_details
from employeeDB.dbo.employee_info;

select * from emp_details; 



-- ALTER STATEMENT.
-- 1.Adding a new column without constraint.

use employeeDB;

CREATE TABLE emp_details(id int, name varchar(10));

select * from emp_details;

alter table emp_details add salary decimal;

insert into emp_details values(1,'shivraj',100000);

Alter table emp_details  add phone varchar(10)null;

UPDATE emp_details SET phone = '1243546788' 
where 1 = 1;


-- 2.Adding a new column with contraint.

alter table emp_details add project_completed int not null default 5;

alter table emp_details add projectID integer null   --IMP.
constraint pID_unique_key unique;

select * from emp_details;

insert into emp_details values (2,'Sai',30000,'3234566788',3,4);

insert into emp_details values (3,'Raj',50000,'3456879933',default,3);

insert into emp_details values (4,'SaiRaj',60000,'3453683493',default,5);


-- 3. Adding several columns with constraints.

 create table company_info(id int);


alter table company_info
    add revenue decimal(10,2) null,
        projectID integer constraint projectID_pk primary key;


update company_info set Name = 'ram', job = 'engg'
where id = 1;

select * from company_info;


-- 4.Dropping a column or colomns.

alter table emp_details drop column phone;

update emp_details set projectID =2
where id = '1';

select * from emp_details;

--dropping constraint 
alter table emp_details drop constraint pID_unique_key;

--dropping columns and constraint.
alter table company_info drop constraint projectID_pk,
column revenue, projectID;

select * from company_info;

alter table company_info add Name char(10), job char(50);

use employeeDB;

-- making all table backup.

select * into EMP_INFO_BKCP from employeeDB.dbo.employee_info;

select * into company_info_bkcp from employeeDB.dbo.company_info;

-- 5. changing the data types of a column.

alter table company_info add Name char(10), job char(50);

update company_info set Name = 'ram', job = 'engg'
where id = 1;
select * from company_info; 

 alter table company_info alter column Name varchar(100), job varchar(100);
 
 use employeeDB;

 create table customer (ACCNO int, cust_name char(100));
   
 select * from customer;

 alter table customer alter column cust_name varchar(100);

 -- changing the size of a column.

 alter table customer alter column cust_name varchar(50);  -- decrease.

 alter table customer alter column cust_name varchar(150); -- increase.

 select * from customer;

 insert into customer values( 1234567,'S_p_m');

 update  customer set cust_name = 'sairaj _patil' where ACCNO = 1234567;

alter table customer alter column cust_name varchar(15); -- HERE can't be reduce the size of column.
alter table customer alter column cust_name varchar(60);   -- yes here we can increase the size of column.

-- changing the data type and size of a column.
alter table customer alter column cust_name varchar(15);
alter table customer alter column cust_name char(15);   -- yes here we can increase the size of column.


-- Advances MS SQL Server.//
/*
Aliases in SQL.
 can be used to create a temporary name for columns or tables.
 Types of Aliases: 
      1. Column: Are used to make column headings in query output easier to read.(Specially with functions and column concatenation)
      2. Table: are used to shorten your SQL to make it easier to read.(Specially in join, and subquery)
 1. Column:                           */

SELECT * FROM employees;

select salary from employees;

select salary 'employee_salary' from employees; -- here we used Aliases method.
select salary as 'employee_salary' from employees;

select id,
       firstname + ' ' + lastname as 'full_name',
       department,
       salary                -- here we use Aliases method as well as concatenation method.
    from 
        employees;

/*
Joins: 
        used to retrieve data from multiple tables.
        Type:1. Inner join (equi,Natural and simple join).
             2. Outer join- i. Left outer join.
                           ii. Right outer join.
                          iii. Full outer join.
             3. Cross Join.

Note: TO  perform join method require at leat  2 columns but the tables must have at least a same column in different table where we perform join method.

 -- 1. Inner Join:                              */

 -- Create employee Table.

 use employeeDB;

 create table employee(
 EMP_ID int primary key,
 EMP_Name char(100),
 EMP_Salary decimal(10,2),
 EMP_DeptID char (50)
 );
 insert into employee
 values
 ( 111,'STEVE', 35000,'D1'),
 (112,'ADAM',28000,'D2'),
 (113,'JOHN',50000,'D3'),
 (114,'MIKE',45000,'D4'),
 (115,'PETER',60000,'D5');

 update employee set EMP_DeptID = 'D2' where EMP_ID = 114;

-- create Department Table.

 create table Department(
 Dept_ID char (50),
 Dept_Name char(100),
 Dept_Location char(100)
 );

insert into Department
values
('D1','DEVELOPMENT','CALOFORNIA'),
('D2','MARKETING','MUMBAI'),
('D3','ACCOUNTS','NEW YORK'),
('D4','MANAGEMENT','SYDNEY');
 
 
 SELECT * FROM employee;
 select * from Department;


 --here i perform inner join.
  /* Syntax: 
          SELECT Column_names 
          FROM table1_Name inner join table2_name
          ON table1_Name.Column_Name = Table2_Name.column_Name; */

SELECT * FROM employee;
select * from Department;

 select EMP_ID,EMP_Name,EMP_Salary,Dept_ID,Dept_Name,Dept_Location from 
 employee inner join Department
 on employee.EMP_DeptID = Department.Dept_ID;


 -- II.Table Aliase: used for reduce the length of queries as well as used for 
 -- there will be no confusion as to which olympics is from the table it is coming.
 
 select * from employee;
 select * from Department;
 -- INNER JOIN with Aliase method.
 -- A.
select EMP_ID,EMP_Name,EMP_Salary,Dept_ID,Dept_Name,Dept_Location from 
employee inner join Department
on employee.EMP_DeptID = Department.Dept_ID;
 -- B.

 select e.EMP_ID,e.EMP_Name,e.EMP_Salary,d.Dept_ID,d.Dept_Name,d.Dept_Location from 
 employee as e inner join Department as d
 on e.EMP_DeptID = d.Dept_ID;

/* 2. Outer join: i. Left outer join.
                  ii. Right outer join.
                  iii. Full outer join. */

   -- i. LEFT outer join.
select EMP_ID,EMP_Name,EMP_Salary,Dept_ID,Dept_Name,Dept_Location 
from employee left outer join Department
on employee.EMP_DeptID = Department.Dept_ID;

-- with Aliases method 👇.
 select e.EMP_ID,e.EMP_Name,e.EMP_Salary,d.Dept_Name,d.Dept_Location 
 from employee as e left outer join Department as d
 on e.EMP_DeptID = d.Dept_ID;
   
-- ii. Right outer join.

select EMP_ID,EMP_Name,EMP_Salary,Dept_ID,Dept_Name,Dept_Location 
from employee right outer join Department
on employee.EMP_DeptID = Department.Dept_ID;
 
-- with Aliase right outer join.
 select e.EMP_ID,e.EMP_Name,e.EMP_Salary,d.Dept_ID, d.Dept_Name,d.Dept_Location 
 from  employee as e right outer join Department as d
 on e.EMP_DeptID = d.Dept_ID;


 -- iii. FUll outer join.
 select EMP_ID,EMP_Name,EMP_Salary, Dept_ID, Dept_Name,Dept_Location
 from employee full outer join Department 
 on employee.EMP_DeptID = Department.Dept_ID;

 -- with Aliase full outer join.

 select e.EMP_ID, e.EMP_Name,e.EMP_Salary,d.Dept_ID,d.Dept_Name,d.Dept_Location
 from employee e full outer join Department d
 ON e.EMP_DeptID = d.Dept_ID;



-- Subquery: 
/*          1. A query within another sql query and embedded within the where clause.
            2. Subquery must be enclosed within parenthesis().
            3. Subqueries can be used with the select, insert, update and delete statemens along with the comparison operators.
            4. A subquery can have only onr column in the SELECT statement.
                                                                                                                    */
-- ? Display name, salary of the employees whose salary is greater than mike's salary.
-- 1. METHOD:

SELECT * FROM  employee;

SELECT EMP_Name, EMP_Salary 
FROM employee
WHERE EMP_Salary > (
                    SELECT EMP_Salary                -- IT IS A INLINE QUERY AND AS WELL AS NESTED QUERY
                    FROM employee
                    WHERE EMP_Name = 'MIKE');

-- 2. METHOD: 
SELECT EMP_Name, EMP_Salary 
FROM employee
WHERE EMP_Salary IN (
                    SELECT EMP_Salary 
                    FROM employee
                    WHERE EMP_Name = 'MIKE');


-- Display name, salary of the employees whose salary is greater than Adam's salary and deptno same as Adam's Deptno.
  SELECT EMP_Name, EMP_Salary 
  FROM employee
  WHERE EMP_Salary > (SELECT EMP_Salary 
                      FROM employee
                      WHERE EMP_Name = 'Adam')
                      AND EMP_DeptID IN (SELECT EMP_DeptID  -- here we use ['(IN) sign'] nested of using [ = ]. this sign showes the equality of to values and queries.
                                         FROM employee
                                         WHERE EMP_Name = 'Adam');


-- Dispaly the employee information whose department is located at new york.

Select e.emp_ID,e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
from employee e INNER JOIN department as d
on e.emp_deptid=d.dept_ID 
where dept_location='New York'


SELECT * FROM employee, Department; -- This query doesnt work it makes multiple duplicates.

SELECT *
FROM employee e
FULL OUTER JOIN Department d        -- here i show the ALL COLUMNS IN BOTH TABLE USING JOIN METHOD AND ALIASES METHOD.
  ON e.EMP_DeptID = d.Dept_ID;







  ------------------------ view practice.

  use employeeDB

  select * from v_empSalary;

  select * from v_empdept;