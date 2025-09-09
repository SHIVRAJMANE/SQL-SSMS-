-- BOOLEAN OPERATOR

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

