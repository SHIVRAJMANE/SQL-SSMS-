 /*

Transact - SQL (T - SQL):

1). WORKING WITH VARIABLES -                                                                                                      */


DECLARE @firstName VARCHAR(50), @lastName VARCHAR(50);
DECLARE @age CHAR(50);


-- Assign a value to Variable.

Declare @Name varchar(50);
set @Name = 'shivraj';
select @Name;

Declare @Name varchar(50), @age int;
set @Name = 'shivraj' , @age = 23;    -- SET can work with only one variable. 
select @Name @age; 

DECLARE @NAME VARCHAR(50), @AGE INT;
SELECT @NAME = 'SHIVRAJ' , @AGE = 23;
SELECT @NAME AS 'NAME', @AGE AS 'AGE';


declare @number int = 100;
	SET @number += 50;
	select @number;
	
	set @number -= 50;
	select @number;

	set @number *= 50;
	select @number;	

use employeeDB;

select * from employee;

DECLARE @Name varchar(50), @Salary decimal(7,2);
SELECT @Name = EMP_Name , @Salary = EMP_Salary FROM employee;
select @Name as 'Name', @Salary as 'Salary'; -- e

select * from employees;

DECLARE @minSalary INT = 40000;
SELECT firstname + ' ' + lastname as name, salary 
FROM employees 
WHERE salary > @minSalary 
ORDER BY salary desc;


/* 

	DDL( CREATE, ALTER, DROP, RENAME, TRUNCATE)
	DML( SELECT, INSERT, UPDATE, DELETE)
	GRANT,REVOKE, 


	scripting:- */




/*
 Batch:  A batch of SQL Statement is a group of two or more SQL Statement or Single SQL Statement.

 Standard Types of Batch: 
	1. Explicit Batch: an explicit batch is two or More SQl Statement separated by semicolons ( ; ).
		eg: 
		Insert into employee (emp_name, emp_salary) values ('brad',45000);
		Insert into employee (emp_name, emp_salary) values ('Joe',36000);
	
	2. Procedure: IF a procedure contain more than one SQL Statemen. it it considered to be a batch.

	3. GO command: GO is not a T- SQL command, it is a command recognized by SQL server utilities.
	   GO can be executed by any user. it requires no premissions.
	   It signals the end of a batch to the SQL server utilities.


	   SYNTAX:                 GO[count}
	   where, Count is a positive integer number. the batch will execute the specified number of times.         */


	   -- TOO CREATE TWO BATCHES:

use employeeDB;
Go


declare @Name1 VARCHAR(50);
SELECT @Name1 = 'ASUS';
GO

declare @Name2 VARCHAR(50);
SELECT @Name2 = 'ASUS';
select @Name2 as 'Name';
GO 5

declare @Name3 VARCHAR(50);
SELECT @Name3 = 'ASUS';
select @Name3 as 'Name';

declare @Name4 VARCHAR(50);
SELECT @Name4 = 'SAMSUNG';
select @Name4 as 'Name';

declare @Name4 VARCHAR(50);
SELECT @Name4 = 'SAMSUNG';
select @Name4 as 'Name';
go 5

/* The  first batch  contains only a USE employeed statement to set the database.
	The remaining statement use a local variable. 
	Therefore, all local variable declarations must be grouped in a single batch. 
	This is done by not having a GO command unitl sfter the last Statement that references the variable. */
	
/* Control-of-flow keywords: Transact-SQL (T-SQL) staement are executed in sequential order
(Suppose we have created three statements then, first statement will run, followed by second, followed by third.)
 
 Control-of-flow keywords: 1. BEGIN.....END  2. IF....ELSE   3. WHILE.
						   4. BREAK          5. CONTINUE     6. GOTO
						   7. RETURN         8. TRY-CATCH    9. THROW
						   10.WAITFOR.
						                                                                                                                */
-- 1. BEGIN....END:
USE employeeDB;
GO 

SELECT * FROM employee;
GO 

BEGIN 
	DECLARE @NAME VARCHAR(50), 
			@SALARY INTEGER,
	        @DEPTID VARCHAR(10) = 'D3';
	SELECT  @NAME = EMP_Name , 
	        @SALARY = EMP_Salary 
	FROM employee
	WHERE EMP_DeptID = @DEPTID; 
	SELECT @NAME 'NAME',
		   @SALARY 'SALARY';
END
GO

-- NESTING BEGIN.....END
SELECT * FROM employee;
GO 

BEGIN 
	DECLARE @NAME VARCHAR(50), 
			@SALARY INTEGER,
	        @DEPTID VARCHAR(10) = 'D3';
	SELECT  @NAME = EMP_Name , 
	        @SALARY = EMP_Salary 
	FROM employee
	WHERE EMP_DeptID = @DEPTID; 
	SELECT @NAME 'NAME',
		   @SALARY 'SALARY';
		
	BEGIN -- NESTED BEGIN.
     
	    PRINT 'Department ID:' + @DeptID;
	
	END

END

/* 
IF......ELSE : The IF....ELSE Statement is a control-of-flow statement that allow you to execute or skip a statement 
               block based on a specified condition.
			   
			   SYNTAX:
						IF condition
						BEGIN
								(SQL Statement)
						END

	NOTE: If the condition contain a SELECT Statement, that it must be enclosed in parentheses.*/

-- 1). IF ........ condition.
BEGIN
	DECLARE @salary DECIMAL;
	SElect @salary = AVG(EMP_Salary)
	FROM employee;
--	SELECT @salary 'AVG_salary';
	IF @SALARY < 25000
		BEGIN 
			PRINT'Average salary is greater than 25000';
		END
		ELSE 
		BEGIN
				PRINT 'Average salary is less than 2500';		
		END
END
GO
SELECT * FROM employee;

-- 2) IF....ELSE: 

BEGIN 
	DECLARE @Salary DECIMAL;
	SELECT @Salary = AVG(EMP_Salary)
	FROM employee;
	SELECT @Salary 'AVG_salary';
	
	IF @salary > 85000
		BEGIN 
			PRINT'Avergae salary is greater than 25000';
		END
	ELSE 
		BEGIN
				PRINT 'Average salary is less than 2500';		
		END
END
GO

/* 

WHILE : The WHILE Lopp statement is a control-of-statement thata allows you to 
		execute a statement block repeatedly as long as a 
		specified condition is TRUE.

		The execution of Statement in the WHILE	 loop can be controllllled from 
		inside the loop with the BREAK and CONTIMUE keywords.
		
		syntax:
				WHILE (condition)
				
				BEGIN
					(SQL Statement)
				END                                                                     */
USE employeeDB;	

select * from employeeDB.dbo.employee;
BEGIN 
	 WHILE(SELECT MIN(EMP_Salary)FROM employee) < 80000

	 BEGIN 
		  UPDATE employee SET EMP_Salary = EMP_Salary - 10000;
		  PRINT'Salary updated';
		 
		  select * from employee;
		  
		  IF (SELECT MIN(EMP_Salary) FROM employee) >= 80000
				PRINT('MIN.Salary is greater or equal to 80000');
				BREAK;
	 END
END



use school;
select * from school_details;


BEGIN
    WHILE (SELECT MIN(AnnualFee) FROM school_details) > 30000
    BEGIN
      
        -- Apply the 5K discount
        UPDATE school_details 
        SET AnnualFee = AnnualFee - 5000;

        PRINT 'TO GIVE 5K DISCOUNT TO EACH STUDENT';

        PRINT 'After Update:';
        SELECT * FROM school_details;

        -- Check if minimum fee has reached 25000
        IF (SELECT MIN(AnnualFee) FROM school_details) = 25000
        BEGIN
            PRINT 'EVERYONE GOT A 5K DISCOUNT';
            BREAK;
        END
    END
END


/*

TRY......CATCH:1.TRY..CATCH implement error handling for T-SQL.
				
				2.It is similar to the exception handling in the oop languages 
				such as c++, java , javascript,etc.
				
				3.A group of T-SQL statement can be enclosed in a TRY block.
				
				4.If the statement between the try block completr without an error,
				the statement between the CATCH block won't execute.
				However, if any statement inside the TRY block causes an exception, 
				the control transfers to the stqtements in the CATCH block.

		SYNTAX:
				BEGIN TRY
						{SQL Statement}

				END TRY

				BEGIN CATCH
						[(SQL Statement)]
				END CATCH

NOTE: Any group of T-SQL statement in a batch or enclosed in a BEGIN...END block.

-- */

BEGIN TRY
	select 100/500 'division';
END TRY                        --WITHOUT ERROR.
BEGIN CATCH
	SELECT ERROR_MESSAGE()AS' ERROR_MESSAGE';
END CATCH;


BEGIN TRY
	select 10/0 'division';
END TRY                        --WITH ERROR.
BEGIN CATCH
	SELECT ERROR_MESSAGE()AS' ERROR_MESSAGE', ERROR_LINE() AS 'Error Line',
	ERROR_NUMBER() AS'Error Number', ERROR_STATE() AS 'Error State', ERROR_PROCEDURE() AS 'Error Procedure';
END CATCH;

SELECT ERROR_MESSAGE()AS' ERROR_MESSAGE', ERROR_LINE() AS 'Error Line',
	ERROR_NUMBER() AS'Error Number', ERROR_STATE() AS 'Error State', ERROR_PROCEDURE() AS 'Error Procedure';



BEGIN TRY
	select 100/5 'division';
END TRY;                      --WITHOUT ERROR.


BEGIN TRY
	select 100/5 'division';
END TRY                        --WITHOUT ERROR.
BEGIN CATCH
	
END CATCH;


BEGIN TRY
	select 10/0 'division';
END TRY                        --WITH ERROR.
BEGIN CATCH
	SELECT ERROR_MESSAGE()AS' ERROR_MESSAGE';
END CATCH;



/*
 WAITFOR: 1. WAITFOR blocks the execution of a batch, stored procedure,
             or transaction until either a specified time or time interval 
			 elapses, or a specified statement modifies or returns at least 
			 one row.
		  2. WAITFOR has two arguments:
				A. Time: The period of time to wait. time_to_pass.
				B. Delay: The time(up to a maximum of 24 hours) at which the WAITFOR  
				   statement finishes.                                                                                                               */


use  school
SELECT GETDATE();
				   
select sysdatetime()as Today_date;
GO

BEGIN 
    WAITFOR TIME '16:23:00'
	select * from school_details;   -- TIME.
END
GO
BEGIN
	select sysdatetime()as 'CURRENT_TIME';
END
GO
------------------------------------------------------------------------------------------

SELECT GETDATE() AS 'CURRENT_DATE';
GO

BEGIN
	WAITFOR DELAY '00:00:15'
	select * from school_details;  
END
GO

BEGIN
	SELECT GETDATE() AS 'CURRENT_DATE';      --DELAY
END
GO


/*
STORED PROCEDURE: 1. Astored procedure is a group of one or more T-SQL	statements.
				  2. It can be stored in the database.
				  3. Stored procedures.
					A. Accept input parameters and return multiple values.
					B. Contain programming statements that perform operations in the database.
					C. Return a status value to a calling program to indicate success or failure.                                                                                                             
					
		SYNTAX: 
				CREATE PROCEDURE Procedure_name1

				AS

				BEGIN
					{SQL Statement}
				END
					                                                                                                                  */
USE school;
select * from school_details;
go

CREATE PROCEDURE Proc_allschook_details
AS
	BEGIN
		select * from schook_details;
 
	END;
	go

EXECUTE Proc_allschook_details;

EXEC sp_rename 'Proc_allschook_details', 'Proc_allschool_details'

EXECUTE Proc_allschool_details;

-----------------------------------------------------------------------------------------------------------------------------

use employeeDB
select * from employees;

CREATE PROCEDURE GetHighSalary
AS                                        -- HERE WE RETRIEVE SPECIFIC EMPLOYEE DETAIL ALSO USE CONCATENATION.
BEGIN
   SELECT firstname + ' '+ lastname AS Name, Salary 
   FROM Employees 
   WHERE Salary > 50000;
END;

EXECUTE GetHighSalary;

-----------------------------------------------------------------------------------------------------------------------------

-- PARAMETERIZED STORED PROCEDURE.
     
	 -- Crearte a stored procedure that returns all employees whose
     -- department is in mumbai.

use employeeDB;
 SELECT * FROM employee;
 SELECT * FROM Department;

Create procedure 
Proc_allemployeedetails(@location as varchar(50))
As
	Begin
		SELECT * 
		FROM employee e inner join Department d
		ON e.EMP_DeptID = d.Dept_ID
		WHERE Dept_Location = @location;
	End;

	-- drop procedure Proc_allemployeedetails; 

EXECUTE Proc_allemployeedetails @location = 'mumbai';

EXECUTE Proc_allemployeedetails @location = 'calofornia';

EXECUTE Proc_allemployeedetails @location = 'new york';

EXECUTE Proc_allemployeedetails @location = 'sydeny';

	--SELECT * 
	--	FROM employee e inner join Department d
	--	ON e.EMP_DeptID = d.Dept_ID
	--	WHERE Dept_Location ='mumbai';



/* 
Modify(Alter) a STORED PROCEDURE.
	1. We can modify a previously created stored procedure.
	2. To perform modification, we need to use ALTER command.
	3. HERE WE CAN NOT CHANGE THE PROCEDURE NAME USING ALTER COMMAND.
SYNTAX:
			
			ALTER PROCEDURE procedure_name
			AS
			BEGIN 
				{SQL STATEMENT}
			END                                                                   */

-- Modify an existing simple stored procedure Proc_allemployeedetails

Create Procedure 
Proc_AllEmp_Details
As
	BEGIN
		SELECT * FROM employee;
	END

execute Proc_AllEmp_Details;

--...............AFTER ALTERATION.............

ALTER PROCEDURE Proc_AllEmp_Details
AS
BEGIN
	SELECT e.EMP_NAME, e.EMP_Salary,d.Dept_Location
	FROM employee e inner join Department d
	ON e.EMP_DeptID = d.Dept_ID;
END;
GO
EXECUTE Proc_AllEMP_Details

-- ALTERation in PARAMETERIZED PROCEDURE.


Alter procedure 
Proc_allemployeedetails(@location as varchar(50))
As
	Begin
		SELECT e.EMP_Name,e.EMP_Salary,d.Dept_Location 
		FROM employee e inner join Department d
		ON e.EMP_DeptID = d.Dept_ID
		WHERE Dept_Location = @location;
	End;

	-- drop procedure Proc_allemployeedetails; 

EXECUTE Proc_allemployeedetails @location = 'mumbai';

EXECUTE Proc_allemployeedetails @location = 'calofornia';

EXECUTE Proc_allemployeedetails @location = 'new york';

EXECUTE Proc_allemployeedetails @location = 'sydeny';


Alter procedure 
Proc_allemployeedetails(@location as varchar(50))
As
	Begin
		SELECT e.EMP_Name,e.EMP_Salary,d.Dept_Name,d.Dept_Location 
		FROM employee e inner join Department d
		ON e.EMP_DeptID = d.Dept_ID
		WHERE Dept_Location = @location;
	End;

	-- drop procedure Proc_allemployeedetails; 

EXECUTE Proc_allemployeedetails @location = 'mumbai';

EXECUTE Proc_allemployeedetails @location = 'calofornia';

EXECUTE Proc_allemployeedetails @location = 'new york';

EXECUTE Proc_allemployeedetails @location = 'sydeny';



/* 
 RENAME a Stored Procedure:
			- To rename the existing stored procedure, we need to use system procedure:
							
							sp_rename.
			SYNTAX:
			 
			 EXECUTE sp_rename 'existing Procedure_name', 'New Procedure_name';                   
			 
			 - Renaming a stored procedure does not change the name of the corresponding object
			 name in thr definition column of tthe sys.sql_modules catalog view. to do that,
			 you must drop and re-create the stored procedure with its new name.
			 
			 - Changing the name or definition of a procedure can cause dependent objects to
			 fail when the objrct are nit updated to reflect the changes that have been made 
			 to the procedure.

			 
use employeeDB;

Create Procedure  Proc_AllEmp_Details
As
	BEGIN
		SELECT * FROM employee;
	END

execute Proc_AllEmp_Details;    -- Befor renaming.                                                                    

EXECUTE sp_rename 'Proc_AllEmp_Details' , 'Proc_EMP_Details';   

EXECUTE Proc_EMP_Details      -- After renaming.                                                                                    */


select * from sys.sql_modules;

Create Procedure  Proc_Emp_Details
As
	BEGIN
		SELECT * FROM employee;
	END
	
execute Proc_Emp_Details;



/* 

USER - Defined Functions: UDFs are routines that accept parameters, perform an action ( complex calculation),
       and return the result of that action as a value. The return value can either be a single scalar value 
	   or  a result set.

why UDFs (Benefits): 
          1. Modular Programming
				- create the function once.
				- store it in the DB, and
				- call it any number of times in your program anywhere.
		  2. Faster execution.
				- reduce the compilation cost of Transact-SQL code
				  ( UDFs does not need to be reparsed and reoptimized with
				  each use resulting in much faster execution times.)
		  3. Reduce network traffic.
				- Function can be invoked in the WHERE clause to reduce the
				  number of rows sent to the client.

Type: 1. System:
		 - SQL Server provides many system functions that you can use to perform a variety of operations. 
		 they cannot be modified.
	  2. Scalar:
		 - Scalar Function return a single data value of the type defined in the RETURNS clause.                                             
	  3. Table-Valued: Table- Valued Functions return a table data type.                                                                  

Before creating a function, things to know.........
	  - User - Defined function always returns a value.
	  - User - Defined Functions Have onpy input parameters for it.
	  - User - Defined Functions can not return multiple result sets.
	  - Error handimh id restricted in a UDF.
	  - A UDF does not support TRY....CATCH, @ERROR or RAISERROR.
	  - SET Statement are not allowed in a user - defined function.
	  - User - defined function cannot call a stored procedure. but stored procedure can call UDF.
	  - User - Defined Functions can be nested. User - Defined Functions can be nested upto 32 level.
	  -

1. Scalar Valued Functions: 

		SYNTAX:
				CREATE FUNCTION function_name(parameter datatype,..,..,..) -- at least one parameter required.
				
				RETURNS return_datatype
				[WITH <function_option<[,....n]]

				[AS]
					BEGIN
							Function_body

							RETURN scalar_expression
					END;

					                                                             */

-- Create a function to get employee salary by passing employee name.

use employeeDB;
select *from employee;

Create Function salary(@name as varchar(50))

returns decimal

 BEGIN 
	DECLARE @sal decimal;
	select @sal= EMP_Salary
	from employee
	where EMP_Name = @name;

	return @sal;
 END;

 -- SELECT salary('mike'); 

 Select dbo.salary('mike') as 'Employee Salary';

 Select dbo.salary('ADAM') as 'Employee Salary';

 Select dbo.salary('JOHN') as 'Employee Salary';

 Select dbo.salary('STEVE') as 'Employee Salary';

 Select dbo.salary( '*'  ) as 'Employee Salary';

 /*

 2. Table - Valued Functions:
						 - User - Defined Table-Valued  functions return a table data type.
						 - A table - Valued Function accepts zero or more parameter.

			Types:
					1. Inline Table-valued Function.
						. There is no function Body(i.e. there is no need for a BEGIN-END block in an Linline function).
						. The table is the result set of a single SELECT statement.
					SYNTAX:

					       CREATE FUNCTION function name(parameter datatype,....)
						   RETURNS return_datatype

						   AS 

						   RETURN statement

Example: Create a function to get employee information by passing employee salary. */

select * from employee;

	CREATE FUNCTION getAllEmployee(@salary decimal)

	RETURNS  table

	AS

	return 
	   (SELECT * FROM employee
	   WHERE EMP_Salary = @salary);

	   select * from employee;

	select * from getAllEmployee(180000);

/*			
			         2. Multi - statement Table- valued Function
					    - It contains multiple SQL statement enclosed in BEGIN-END blocks.
					    - The return value is declared as a table variable.
					    - The RETURN statement is without a value and the declared table variable 
					      is returned.

				SYNTAX:
					  CREATE FUNCTION function name(parameter datatyoe,...)
					  
					  RETURNS @table_variable TABLE
					  (col-1 datatype, col-2 datatype,....)

					  AS 
						BEGIN
								{SQL statement}

								RETURN

						END;

EXAMPLE: Create a function to get list of employees by passing departmrnt id.    */
select * from employee;

CREATE FUNCTION getAllEmployees (@id varchar(50))
RETURNS @Table  Table 
(ID int, NAME varchar(50), SALARY decimal, DEPTID varchar(50))
AS
	BEGIN
		INSERT INTO @Table 
		SELECT * FROM employee
		WHERE EMP_DeptID = @id;

		RETURN
	END;

SELECT * FROM getAllEmployees('d2'); 

SELECT * FROM getAllEmployees('d1'); 
SELECT * FROM getAllEmployees('d3'); 


BEGIN TRY
	SELECT * FROM getAllEmployees(8); 
END TRY

BEGIN CATCH 
	SELECT ERROR_MESSAGE() AS 'ERROR_MESSAGE';
END CATCH;


use employeedb;

/*
----------------------------------Trigger:----------------------------------------
		
		. A Trigger is a type of stored procedure, that automatically 
		  runs an event occurs in the database server.
		. Here, Events are DML operations (INSERT, DELETE, UPDATE).
	
	TYPE 1. DDL Trigger.
	        .DDL trigger is fired when DDL statements like Drop Table, 
			 Create table or Alter Table occurs. DDL Triggers are always After Triggers.
         
		 2. DML Trigger.
		    .We can create triggers on DML statements(like INSERT, UPDATE AND DELETE)
			  and stored Procedures. 

			.DML Trigger are to three types:
								1.AFTER Trigger:
								  .These triggers executes after the action of the INSERT, UPDATE
								   MERGE or DELETE statement is performed.
								
								2.INSTED OF Triggers:
								  .These trigger overrides the standard actions of the triggering statement.
								  .it can be used to perform error or value checking on one or more columns.
								  .These triggers perform additional actions before insert, updating or deleting
								   the row or rows.

								3. CLR trigger (common language runtime trigger) :
								   .It can be either an AFTER or INSTEAD OF trigger.
								   .It can also be a DDL trigger.
											                                                                                                                  			
				
 ---(1.)-------------------------------DML Triggers:--------------------------------
				. A trigger is a type of stored procedure, that automatically runs when an 
				  event occurs in the database server.
				. Here, Events are DML operations(INSERT, DELETE, UPDATE).
 Types:
		1. AFTER Trigger.
		2. INSTEAD OF Trigger.
		3. CLR Trigger.

SYNTAX: 
		CREATE TRIGGER trigger_name

		ON {Table | View}
		
		[WITH DML_trigger_optional]

		{FOR | AFTER | INSTEAD OF }

		{[INSERT],[UPDATE],[DELETE]}

		AS
			BEGIN
					{SQL Statement}
			END;                                                                 
					
 Before creating a trigger, thing tom know:....
  
	    Magic Table:
			SQl server automatically creates and manages magic tables. DML trigger statements use
			twp magic tables.

			1. INSERTED TABLE: 
				This table stores copies of the affected rows during INSERT and UPDATE
				statement. During these transactions, new rows are added to both the inserted
				table and the trigger table.

			2. DELETED TABLE: 
			   This table stores copies of the affected rows during DELETE and UPDATE statements.
			   During the execution of these statement, rows are deleted from the trigger table and 
			   stored into the deleted table.
			                                  
----------------------------------Trigger Part I-------------------------------------
Example: Create a triggger when new employee added to employee table.																						                                         */

USE employeeDB;
SELECT * FROM employee;

CREATE TRIGGER tr_msg
ON employee
AFTER INSERT
AS
	BEGIN 
		PRINT'WELCOME TO OUR COMPANY...!';
	END;
INSERT INTO employee VALUES (108,'raghu',75000,'D1');
----------------------------------------------------------------------------
use school;

select * from school_details;

CREATE TRIGGER tr_school
ON school_details
AFTER DELETE 
AS
	BEGIN
		PRINT'THANKS TO VISIT OUR SCHOOL...!';
	END;

	DELETE FROM school_details 
	WHERE AnnualFee = 25000.00
	AND SchoolName= 'DANGE';
	
select * from school_details;
------------------------------------------------------------------------------------

CREATE TRIGGER tr_schl
ON school_details
AFTER DELETE 
AS
	BEGIN
		PRINT'THANKS TO VISIT OUR SCHOOL...!';
	END;

	DELETE FROM school_details WHERE AnnualFee = 25000.00AND SchoolName= 'DANGE';
	
select * from school_details;

-----------------------------------------------------------------------------------------------------
CREATE TRIGGER tr_inside
ON school_details
AFTER INSERT 
AS
	BEGIN
		PRINT'WELCOM TO OUR SCHOOL...!';
	END;
INSERT INTO school_details VALUES (1,'KIT','KOLHAPUR','416120 ',75000);
-----------------------------------------------------------------------------------------------------
USE school;
SELECT * FROM school_details;

CREATE TRIGGER tr_udpate
ON school_details
AFTER UPDATE
AS	
	BEGIN
		PRINT'Thanks to revisit';
	END;
	
	UPDATE school_details 
	set AnnualFee = 100000
	WHERE SchoolName = 'ASHRAM';
----------------------------------------------------------------------------------
	
CREATE TRIGGER tr_change
ON school_details
AFTER UPDATE
AS	
	BEGIN
		PRINT'Thanks to revisit';
	END;
	
	UPDATE school_details 
	set postalAddess = 100000
	WHERE SchoolName = 'ASHRAM';

------------------------------------Trigger Part II-------------------------------------

---------------------------------------------INSERT------------------------------------------------------

USE employeeDB;    -- SELECT * FROM employees; PRACTICES

SELECT * FROM employee;
select * from employeeHistory;

CREATE TABLE employeeHistory
(Id int, Name varchar(255), salary decimal,DeptID varchar(255),
ModifieBy varchar(255), ModiFieOn date);

Create Trigger tr_employee_after_insert
ON employee
AFTER INSERT

AS 
	BEGIN
		INSERT INTO employeeHistory
		select EMP_ID,EMP_Name,EMP_Salary,EMP_DeptID,'SHIVRAJ',GETDATE()
		FROM inserted;
	END;

	INSERT INTO employee values (110,'JOSH',80000,'D4')

---------------------------------------------UPDATE------------------------------------------------------

SELECT * FROM employee;
select * from employeeHistory;

Create Trigger tr_employee_after_update
ON employee
AFTER update
AS 
	BEGIN
		INSERT INTO employeeHistory
		select EMP_ID,EMP_Name,EMP_Salary,EMP_DeptID,'SHIVRAJ',GETDATE()
		FROM inserted;
	END;
	
    UPDATE employee 
	set EMP_Name = 'RAGHUVENDRA'
	WHERE  EMP_ID = 108;


	UPDATE employee 
	set EMP_DeptID = 'D3'
	WHERE  EMP_ID = 117;

	UPDATE employee 
	set EMP_Salary = EMP_Salary - 100000
	WHERE  EMP_ID = 114;

	UPDATE employee 
	set EMP_Salary = EMP_Salary - 100000
	WHERE  EMP_ID = 111;

	UPDATE employee 
	set EMP_Salary = EMP_Salary - 100000
	WHERE  EMP_ID = 112;

	UPDATE employee 
	set EMP_Salary = EMP_Salary - 100000
	WHERE  EMP_ID = 115;
---------------------------------------------DELETE------------------------------------------------------
SELECT * FROM employee;
select * from employeeHistory; -- backupend table 

Create Trigger tr_employee_after_delete
ON employee
AFTER DELETE
AS 
	BEGIN
		INSERT INTO employeeHistory
		select EMP_ID,EMP_Name,EMP_Salary,EMP_DeptID,'SHIVRAJ',GETDATE()
		FROM deleted;
	END;

	--DROP TRIGGER tr_employee_after_delete;

	DELETE FROM employee
	where EMP_DeptID ='D5';

------------------------------------DML Trigger Part III-------------------------------------
------------------------------------ALL DML Operations-------------------------------------

USE employeeDB  
--select * from 
--employee e full outer join employeeHistory eh
--ON e.EMP_DeptID = eh.DeptID;                                  

select * from employee; 
select * from employeeHistory;
DROP TRIGGER tr_AllDMLOperations;
CREATE OR ALTER TRIGGER tr_AllDMLOperations
ON employee
AFTER Insert, delete,update
AS
	BEGIN
	    -- INSERTED
		IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
			INSERT INTO	employeeHistory
			SELECT EMP_ID,EMP_Name, EMP_Salary,EMP_DeptID,'M.SHIVRAJ',GETDATE()
			--FROM inserted
			FROM deleted
		-- UPDATE
		ELSE IF EXISTS (SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
			INSERT INTO employeeHistory
			SELECT EMP_ID, EMP_Name,EMP_Salary, EMP_DeptID,'M.SHIVRAJ',GETDATE()
			FROM deleted

		--DELETED 
		ELSE IF EXISTS(SELECT * FROM DELETED ) AND NOT EXISTS(SELECT * FROM inserted)
			INSERT INTO employeeHistory
			SELECT EMP_ID, EMP_Name,EMP_Salary,EMP_DeptID,'M.SHIVRAJ',GETDATE()
			FROM deleted

		ELSE 
			BEGIN
				PRINT('NOTHING CHANGED...!')
			END;
  END;

 SELECT * FROM employeeHistory;
 SELECT * FROM employee ORDER BY EMP_DeptID;
 SELECT * FROM employee;


 INSERT INTO EMPLOYEE VALUES (109,'VIJAY',50000,'D1');

 UPDATE EMPLOYEE SET EMP_DeptID ='D5' WHERE EMP_ID =120; 

 DELETE FROM EMPLOYEE WHERE EMP_ID = 120;


 /*
 ---(2.)----------------------------------------DDL Trigger-------------------------------------------------------------

. DDL trigger fire in response to different DDL evenst correspond to SQL statement 
such as CREATE, ALTER, DROP,GRANT, REVOKE etc
. Also, some system stored procedures that perform DDL- LIKE operations
(for example, sp_rename)can aslo fire DDL triggers.

why DDL trigger? 
.Prevent certain changes to your database schema.
.Have something occur  in the db in response to a change 
in your database schema.
.Record changes or events in the database schema.

SYNTAX:
		CREATE TRIGGER tr_name
		ON {ALL SERVER | DATABASE}

		[WITH DDL_trigger_option]

		{FOR | AFTER}{event_type1,event_type2,.....}

		AS
			BEGIN 
				  (SQL Statement)
			END;


EXAMPLE: Create a trigger when new table is created in a database.
                                                                                                */
create trigger tr_onTableCreate
ON database
FOR create_table
AS 
	BEGIN
		print('new table is created successfully')
	END;

CREATE TABLE SAMPLETABLE(ID INT, NAME VARCHAR(20));


drop table SAMPLETABLE


create OR alter trigger tr_onTableCreate
ON database
FOR create_table,drop_table
AS 
	if 
	BEGIN
		print('new table is created or dropped successfully.')
	END;


drop table SAMPLETABLE;

CREATE OR ALTER TRIGGER tr_onTableCreate
ON DATABASE
FOR CREATE_TABLE, DROP_TABLE
AS
BEGIN
    IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)') = 'CREATE_TABLE'
    BEGIN
        PRINT 'A new table has been created in the database.';
    END
    ELSE IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)') = 'DROP_TABLE'
    BEGIN
        PRINT 'A table has been dropped from the database.';
    END
END;

CREATE TABLE SimpleTable(ID INT, NAME VARCHAR(20));
drop table SimpleTable;

--------------------------------------------- sp_rename------------------------------------------
/*
*EVENTDATA():
          . t is a built-in function.
          .It returns the information about the events executed the DDL trigger.
          .The infromation is in XML format.
	.EVENTTYPE(Create Table,Alter Tbale, DropTable,etc..)
	.PostTime(Event Trigger Time)
	.SPID(SQL Server session ID)
	.ServerName(SQL Server instance name)
	.LoginName(SQL Server Login Name)
	.UserName(Username for login, by default dbo schema as username)
	.DatabaseName(name of database where DDL trigger was executed)
	.SchemaName(schema name of the table)
	.ObjectName(Name of the table)
	.ObjectType(Object Types such as Table View, Procedure, etc..)
	.TSQLCommand(Schema delpyment Query which is executed by user)
	.SetOptions(SET Option which are applied while creating table or Modify it)
	.CommandTaxt(Create, Alter or Drop object command)
*/

select eventdata()
drop trigger tr_tableRename
CREATE OR ALTER TRIGGER tr_tableRename
ON DATABASE
FOR RENAME
AS	
	BEGIN
		PRINT' A TABLE RENAMED...!';
	END;

sp_rename 'newtemp','triggerdemo';


CREATE TABLE ddl_logs(
	id int identity primary key,
	event_data xml,
	performed_by sysname,
	event_type varchar(200)
);
 
drop trigger tr_ddlEventTrigger;

create or alter trigger tr_ddlEventTrigger
on database
for create_table, drop_table,rename
as 
	begin
		insert into ddl_logs(event_data,performed_by,event_type)
		values(eventdata(),USER, eventdata().value('(/EVENT_INSTANCE/EventType)[1]','varchar(max)'));
	end;
	
sp_rename 'customers','customer';

drop table SimpleTable;

select * from SimpleTable;

CREATE TABLE DEMO(ID INT, VALUE VARCHAR (20));

select * from ddl_logs;
drop table DEMO
use employeeDB

------------------------------------------------Merge statement in MS SQL------------------------------------------------

/*
Merge:
		 . Merge is a logical combination of an insert and an update.
		 .It combines the sequence of conditional INSERT, UPDATE, and DELETE statement in a 
		  single statement.
		 .Using Merge statement, you can sync two different tables so that the content of the 
		  target table is modified based on differences found in the source table.

why using Merge?
		.It is Specially used to maintain a history of data warehousing during the ETL(Extract, Transform,Load)cycle.

	Scenario: Suppose, tables need to be refreshed periodically with new data arriving from online transaction processing
	(OLTP) systems. This new data may contain changes to existing rows in tables and?or new rows that need to be inserted.

Actions?Conditions
		.Rows in the source table are not found in the target table.Then, rows 
		  from the source will be added to the target table.
		.Rows in the target table are not found in the sourde table. Then delete 
		 rows from the target table.
		.Rows in the source and target table have the same keys but, they have different values in the non_key columns. 
		 Then, Update the rows in the target table with data from the source table.

	SYNTAX:
			MERGE TagetTable              |  MERGE TargetTable
			                              |
			USING SourceTable             |   USING sourceTable
			                              |
			ON join_Conditions            |   ON join_conditions
			                              |
			WHEN Matched                  |   WHEN Matched
			                              |
				THEN DML Statement        |	    	THEN Update
				                          |
			WHEN NOT MATCHED BY TARGET    |	 WHEN NOT MATCHED BY TARGET
			                              |			
				THEN DML Statement        |         THEN Insert	
				                          |
			WHEN NOT MATCHED BY SOURCE    |  WHEN NOT MATCHED BY SOURCES
				                          |
				THEN DML Statement:       |        THEN Delete;
				                          |
States:
	1. MATCHED: These are the rows that match the merge conditio. for the matching rows, 
	   you need to update the rows columns in the target table with values from the 
	   source table.
	
	2. NOT MATCHED BY TARGET: These are the rows from the source table yaht does not have 
	   any matching rows in the target table. In this case. you need to add the rows from 
	   the source table to the target table.

	3. NOT MATCHED BY SOURCE:These are the rows in the target table that does not match any 
	   rows in the source table. if you want to synchronize the target table with the data 
	   from the source table, then you will need to use this match condition to delete rows 
	   from the target table.

	EXAMPLE:                                                                                           */

CREATE DATABASE Airlines;

USE Airlines;

CREATE TABLE FLIGHTPASSENGERS
(
	flightid int identity primary key,
	firstName varchar (20) not null,
	flightCode varchar(20) not null,
	flightDate date not null,
	seat varchar (5)
);
INSERT INTO FLIGHTPASSENGERS(FIRSTNAME,FLIGHTCODE,FLIGHTDATE,SEAT)
VALUES ('SMITH','SQL2022',GETDATE(),'7F'),
	   ('ADAM','SQL2022',GETDATE(),'20A'),
	   ('MIKE','SQL2022',GETDATE(),'4B');

CREATE TABLE CheckIN
(
	flightid int identity primary key,
	firstName varchar (20) not null,
	flightCode varchar(20) not null,
	flightDate date not null,
	seat varchar (5)
);
INSERT INTO CheckIN(FIRSTNAME,FLIGHTCODE,FLIGHTDATE,SEAT)
VALUES ('SMITH','SQL2022',GETDATE(),'7F'),
	   ('ADAM','SQL2022',GETDATE(),'2B'),
	   ('MIKE','SQL2022',GETDATE(),'17A');

SELECT * FROM  FLIGHTPASSENGERS;
select * from CheckIN ;



MERGE  FLIGHTPASSENGERS f
USING CheckIN c

ON c.firstName = f.firstname
AND c.flightCode = f.flightCode
AND c.flightDate = f.flightDate

WHEN MATCHED
	THEN UPDATE SET f.seat = c.seat
WHEN NOT MATCHED BY TARGET
	THEN Insert(FIRSTNAME,FLIGHTCODE,FLIGHTDATE,SEAT)
		values(FIRSTNAME,FLIGHTCODE,FLIGHTDATE,SEAT)
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE;


SELECT * FROM  FLIGHTPASSENGERS as TargetTable;
select * from CheckIN as SourceTable;


/*------------------------------------ INDEXING-------------------------------------------

INDEX:
		. In general, index is used to measure the performance.
		. Database systems uses indices to provide fast  access to relational data.
		. It is a special type of physical data structure used to access one or more data rows fast.
		. Database index can change each time the corresponding data is changed.

Differences of Index:
1. Book Index:
	.A Book reader can decide whether or not to use book's index.
	.A particular book's index is edited together with the book and does not change at all.
	 This means that you can find a topic exactli on the page where it is determined in the index.

2. Database Index:
	.The sysmtem component called the query optimizer decides whether or not to use an existing index.
	.A database index can change each time the corresponding data is changed.


	SYNTAX: 
		          CREATE INDEX index_name
			      on table_name(column_name>|DESC>);
*/


use employeeDB;

drop table emps
create  table emps(
ID int,
Name varchar(50),
salary decimal,
Location Varchar(50)
);

insert into emps values
(3,'SMITH',65000,'USA'),
(1,'JAMES',30000,'INDIA'),
(2,'MIKE',48000,'INDIA'),
(4,'JOHN',55000,'USA');


SELECT * FROM EMPS where salary > 50000;
 select * from emps

CREATE INDEX idX_salary 
ON empS (Salary ASC);


/*
------------------------------------ Clustered Index in MS SQL Server ------------------------------------------
Clustered Index: 
		. A clustered index determines the physical order of the data in a table. 
		  Hence, a table can have only one clusterde index.
		.When a clustered index is created, the database engine sorts the datat in the 
		  table based on the defined index key(s) and stores the table in that order.
		
	Example: A telephon book. A telephone book is always in storeds order , based on 
		      the last name of the individual followed by the first name. The sorted order 
			  makes it easy to find the phone number of the person you are looking for.
			  
		Things to remember............
			.A primary key constraint creates clustered index automatically if there is no 
			  clusterd index exists on the table.
			.An index can contain multiple columns, known as composite index.
			  
			  
	SYNATX: 
			 CREATE CLUSTERED INDEX index_name
			 on table_name(column_name>|DESC>);
			  
*/


SELECT * FROM emps

CREATE CLUSTERED INDEX IDX_EMP_Name
ON emps (Name asc);

create clustered index idx_emp_loc
on emps(id desc , location asc);

/*                                          NONCLUSTERED INDEX 

Nonclustered index:
			. A nonclustered index does not change the physical order of the rows in the table.
			. In other(simple) words, a nonclustered index in similar to an index in a textbook. 
			  the data is stored in one place, the index in another place, The index will have 
			  pointer to the storage location of the data.
			  . Since, the index is tsored separately from the actual data, a table can have more 
			  than one nonclustered index.

	SYNTAX:
			CRREATE NONCLUSTERED INDEX index_name
			ON table_name(column_name <asc | desc> );
  */
  ;
 
 select * from emp

select * from emp where name = 'smith' ;

create nonclustered index idx_emp_name
ON emp (Name asc );

/*                                             UNIQUE INDEX


Unique index:
          . A unique index ensures that the index key contains no duplicate values.
		  . There are no differences between creating a UNIQUE constraint and creating a unique index.
		  . Creating a UNIQUE constraint on the column makes the purpose of the index clear.

Implementation:
	1. Primary key:
		. when you create a primary key constraint, a unique clustered indexon the column or columns 
		  is automatically.
    2. UNIQUE constraint:
		. When you create a UNIQUE constraint a unique nonclustereed index is created to enforce 
		  a UNIQUE constraint by default.
	3. Index independent of a constraint:
		Multiple unique nonclustered  indexes can be defined on a table.

SYSNTAX: 

		CREATE UNIQUE NONCLUSTERED INDEX index_name
		ON table_name(column_name);
*/

select * from emps

create UNIQUE NONCLUSTERED INDEX 
idx_emp_id ON emps(id);
drop table Dept;
create table Dept
(
	Did int primary key,
	Dname varchar(50),
	Dloc varchar(50)
);
insert into Dept values 
(2,' sales','mumbai'),
(1,'accounts','pune'),
(4,' sales','channai'),
(3,'accounts','banglor');
select * from Dept 

alter table Dept  
add constraint UQ_Dept_Name unique (dname);
	         
ALTER TABLE Dept  
add constraint UQ_Dept_Did 
unique clustered (Did);

-- Independent of constraint

create UNIQUE nonclustered index idx_Dept_Dloc
ON Dept(Dloc);


/*                                         VIEW 
  VIEW:
		. A  VIEW does not require any storage in a database.
		. It is Saved Query. It acts as a filter on the tables referenced in the view query.
		. The main use case of view to maintain the security st row and column level.

SYNATX:
		CREATE VIEW view_name
		AS [ simple select query] [join query];

*/

select * from Dept;
select * from emps;



--- display employee name and salary;
select e.name, e.salary, e.Location,d.Dname
from emps e inner join Dept d
on d.did = e. id
where Dname = 'accounts';

----- creating view for better optimization.

create view v_empdetails
as select e.name, e.salary, e.Location,d.Dname
from emps e inner join Dept d
on d.did = e. id

select * from v_empdetails;

create view v_empdept
AS select e.name, e.salary, e.Location,d.Dname
from emps e inner join Dept d
on d.did = e. id
where Dname = 'accounts';

select * from v_empdept;




-- display employees details without salary. here, we maintain confidentiality about employee's salary.
create view v_empSalary
AS select name , location, dname
from emps e inner join dept d
on e.id = d.Did 

select * from v_empSalary

sp_helptext v_empSalary

/*                                                   CTE 
CTE (Comman Table Expression):
		.CTE is a temporary named result set.
		.A  CTE must be followed byb a single SELECT, INSERT, UPDATE or DELETE satement that references some or all the CTE columns.
		.A CTE can also be specified in a CREATE VIEW staement as part of the defining SELECT statement of the view.
		.Multiple CTE query definitions can be defined.

SYNTAX:
1.     
                    WITH cte_name AS (cte_query) followed_query

2. 
                    WITH cte_name(col1,col2,....) AS (cte_query)      --PARAMETERIZED.
					followed_query                                                                            */
use employeeDB
SELECT * FROM employee;
SELECT * FROM Department;

WITH cte_avgSalary AS
(
		SELECT AVG(EMP_Salary)as AvgSalary FROM employee
)
SELECT AvgSalary FROM cte_avgSalary;



-- PARAMETERIZED.

SELECT COUNT(*) FROM employee;

select * from emps;
select * from Dept;

WITH cte_empCount(id,employeeCount) As
(
		SELECT did,count(*) AS employeeCount
		FROM employee group by id
	)

	select Dept_Name, employeeCount from 
	Department join cte_empCount 
	on Department.Dept_ID = cte_empCount.id;




select avg(EMP_Salary) as AvgSalary from employee;



/*                                   TRANSACTION CONTROL LANGUAGE

.If a transaction is successful, all of the data modifications made during the transaction are committed 
 and become a permanent part of the database. if a transaction encounters error and must be canceled or 
 rolled back, then of the data modifications are erased.
.ROLLBACK
.COMMIT
.SAVE


SYNTAX: 
       BEGIN TRANSACTION

		sal statement
		
	 COMMIT|ROLLBACK|SAVE

*/


CREATE TABLE SIMPLETABLE (ID INT);

INSERT INTO SIMPLETABLE  VALUES (1);
INSERT INTO SIMPLETABLE  VALUES (2);
INSERT INTO SIMPLETABLE  VALUES (3);


SELECT * FROM SIMPLETABLE;

-- 1. ROLLBACK.

BEGIN TRANSACTION;
	INSERT INTO SIMPLETABLE  VALUES (4);
	INSERT INTO SIMPLETABLE  VALUES (5);
	INSERT INTO SIMPLETABLE  VALUES (6);


	SELECT * FROM SIMPLETABLE;


ROLLBACK; -- HERE IT ERAISE THE ALL INSERATION AFTER APPLY TRANSACTION AND RETURN BACK THE BEFORE INSERTION DATA.

--2. SAVE:
BEGIN TRANSACTION;
		INSERT INTO SIMPLETABLE  VALUES (7);
		INSERT INTO SIMPLETABLE  VALUES (8);
	SAVE TRANSACTION A;

	   	INSERT INTO SIMPLETABLE  VALUES (9);
		INSERT INTO SIMPLETABLE  VALUES (10);
	SAVE TRANSACTION B;


	ROLLBACK TRANSACTION A;
	SELECT * FROM SIMPLETABLE;

	-- 3. COMMIT

	COMMIT;


