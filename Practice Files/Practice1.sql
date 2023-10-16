show databases;
create database practicebd4;
use practicebd4;
create table students(sid integer, sname char(30), age integer, courses char(30));
show tables;
desc students;
-- inserting records. This i s a comment.
insert into students values (1, 'Ritik', 22, 'MYSQL'); 
insert into students values (2, 'Vaibhav', 25, 'DA'); 
insert into students values (3, 'Sneha', 21, 'DS'); 
insert into students values (4, 'Swarup', 22, 'Java');
select * from students; 
select 5+5 as result;
select 5 = 5 as result;
select 5 != 5 as result;
select 5!=6 as result;
select 5 <> 5 as result;
select 5+null as result;
select 5 = null as result;

create table patients ( pid integer, pname varchar(255), toa datetime);
show tables;
desc patients;
insert into patients values (1,"Ritik",'2023-04-04 08:30:34');
insert into patients values (2,"Harry",'2023-04-05 11:32:56');
insert into patients values (3,"Musky",'2023-04-16 13:12:48');
insert into patients values (4,"Pusher",'2023-04-16 13:17:23');
select * from patients;

create table if not exists patients ( pid integer, pname varchar(255),toa datetime);
show tables;

-- DDl Commands started
create table test ( id integer);
show tables;
drop table test; -- once droped cannot retrive the table.
show tables;

-- Alter Command
alter table students add column marks integer default 0;
select * from students;
alter table students drop column age;
select * from students;
alter table students change column sid std_id integer; -- rename is only used to change the name of the table.
select * from students;
desc students;
alter table students modify column sname varchar(30);
desc students;
alter table students rename to myclass ;
show tables;

-- Rename commands
rename table myclass to students;
show tables;

-- DML Commands
select * from students;
insert into students values (5,'Siri',null,50); -- insert type 1
select * from students;
insert into students(std_id, sname,marks) values (6,'jimmy',60); -- insert type 2
select * from students;
insert into students(std_id, sname,courses) values (7,'Mark','Python'); -- Default value is taken for marks as we have set it somewhere upwards.
select * from students;
insert into students values (8,'Harry', 'MYSQL', 70),(9, 'Peter','Python', 78),(10, 'Pat','MYSQL', 67); -- insert type 3
select * from students;
-- update students set sname = 'Natasha' WHERE std_id = 7;
update students
set sname = 'Natasha'
where std_id = 7;

set sql_safe_updates = 0; -- for disabling safe updates which came in mysql safe mode.

select * from students;
update students set marks = null where marks = 0;
select * from students;
update students set courses = 'Dance' , marks = 87 where std_id = 5;
select * from students;
update students set courses = 'MYSQL';
select * from students;

-- Delete command
delete from students where std_id = 2;
select * from students;
delete from students where marks = null; -- does not affect as null is not comparable.
select * from students;
delete from students where isnull(marks); -- where marks isnull;
select * from students;
delete from students; -- deletes all the records in the table
select * from students;

insert into students values (1,'ritesh','Mysql',70);
insert into students values (2,'Raj','Mysql',80);
insert into students values (3,'Saloni','Mysql',90);
select * from students;

-- DDL TRUNCATE Command - SELECT Command

show tables;
truncate students;
select * from students;
show databases;
show create table students;

-- DQL Data Query Languaage
show tables;
select * from myemp;
select * from myemp limit 10;
select emp_id, first_name, last_name, dep_id from myemp;
select emp_id, first_name, last_name, dep_id from myemp limit 10;
select * from myemp limit 10;
select emp_id, first_name, last_name, dep_id, salary, salary*0.2 from myemp; -- derived column(numeric)
select emp_id, first_name, last_name, dep_id, salary, salary*0.2 as bonus, salary+salary*0.2 as total_salary from myemp;


-- UNIQUE Records - DISTINCT
select * from myemp;
select dep_id from myemp;
select distinct dep_id from myemp;
select distinct job_id from myemp;

select * from person;
select distinct fname from person;
select distinct lname from person;
select distinct fname, lname from person;

-- ORDER: Ascending or Descending
select * from myemp;
select * from myemp order by dep_id;
select * from myemp order by salary, hire_date;
select * from myemp order by dep_id desc;
select * from myemp order by first_name, last_name;
select * from  myemp order by mgr_id, dep_id;
select * from  myemp order by dep_id, mgr_id desc;
select * from myemp order by dep_id, hire_date desc;

-- Distinct dep in ascending order
select distinct dep_id from myemp order by dep_id;

-- WHERE Clause.
select * from myemp where salary>=10000;
select * from myemp where salary>=10000 order by salary desc;
select * from myemp where salary > 10000 and salary < 15000;
select * from myemp where salary between 10000 and 15000;
select * from myemp where hire_date between '1987-01-01' and '1987-12-31';
select * from myemp where dep_id != 80;
select * from myemp;

-- Combining multiple conditions
select * from myemp where dep_id = 80 and salary > 10000;
select * from myemp where dep_id = 80 and mgr_id = 100;
select * from myemp where dep_id = 40 or dep_id = 60 or dep_id = 70;

-- LIKE operator: Pattern Matching (% symbol), (_ symbol)
/* % matches any no. of charecters
_ It matches excatly 1 charecter */

select * from myemp where first_name LIKE 'A%';
select * from myemp where first_name like '%A';
select * from myemp where first_name like 'A%A';
select * from myemp where first_name like '%a' and last_name like 'b%';
select * from myemp where job_id like 'SA%';
select * from myemp where job_id like '%ERK';
select distinct job_id from myemp;
select * from myemp where first_name like '% %'; -- CONTAINS space in betweeen

select * from myemp where first_name like 'J____';
select * from myemp where first_name not like 'a%';

-- GROUPING: 
/* Row level functions - 1 row as input and 1 o/p
Group level functions - set of rows as an input and 1 o/p */

select * from patients;
alter table patients
add column dob date;
select * from patients;
delete from patients;
select * from patients;
delete from patients;
set sql_safe_updates = 0; -- for disabling safe updates which came in mysql safe mode.
delete from patients;
select * from patients;

insert into patients values (1, 'Harry', '2023-04-04 08:30:00', '2000-05-26');
insert into patients values (2, 'Potter', '2023-04-06 12:12:20', '2003-08-12');
insert into patients values (3, 'Jaz', '2023-04-12 07:43:32', '1989-11-24');
insert into patients values (4, 'Tom', '2023-04-13 01:47:41', '1998-01-23');
select * from patients;
select adddate( dob,interval 5 day) as result from patients; -- date increases by 5 days
select adddate( dob,interval 5 month) as result from patients; -- month increases by 5 months
select  year(dob) from patients;
select year(dob), month(dob), monthname(dob) from patients;
select hire_date, year(hire_date), monthname(hire_date) from myemp;
select hire_date, year(hire_date) from myemp limit 10;

-- Group level functions;
create database newdb;
use newdb;
show tables;
select * from cats;
select avg(weight) from cats;
select sum(weight) from cats;
select min(weight) from cats;
select max(weight) from cats;
select stddev(weight) from cats;
select count(weight) from cats;

select * from cats;
select round(weight) from cats;  -- row level function ass it only gives 1 row as an o/p

select count(distinct breed) from cats;
-- select count(distinct breed), avg(weight) from cats;
-- select count(distinct breed), avg(weight) from cats group by breed;
select breed, round(avg(weight)) from cats group by breed;
select breed, round(avg(weight),2) from cats group by breed;

select * from myemp limit 10;
select dep_id, round(avg(salary),2) from myemp group by dep_id;
select dep_id, mgr_id, avg(salary) from myemp group by dep_id, mgr_id;
select dep_id, avg(salary) from myemp group by dep_id;

select * from cats;
select breed, round(avg(weight),2) from cats group by breed;
select sum(weight) from cats;

-- JOINS in Mysql
/* Inner Join - Common Records in tables
Left Join - All the records from the left tables( 1st written table)
Right Join - All the records from the left tables( 2nd written table)
Self Join - When the join is done on the table itself it is called SELF Join.
Cross Join - All cross combinations are performed if 3 table and 3 table then 9 combinations.
Outer Join -- Not Supported in Mysql */

show tables;
select * from movies;
select * from members;

select * from movies inner join members on movieid = id;
select * from movies join members on movieid = id; -- not necessary to write inner keyword only in inner join as it automaticaly considers inner join.

-- LEFT Join
select * from movies left join members on movieid = id;

-- RIGHT Join
select * from movies right join members on movieid = id;

select * from authors;
select * from books;

-- inner join
select * from authors inner join books on authors.Authorid = books.BookId; -- ( ambiguous system finds same colmn names in both the table )
select title, name from authors join books on authors.AuthorId  = books.AuthorId;

-- CROSS Join
select * from meals;
select * from drinks;

select * from meals cross join drinks;
select mealname, drinkname,meals.rate + drinks.rate as Total_rate from meals cross join drinks;
SELECT m.mealname, d.drinkname, m.rate + d.rate as Total from meals as m cross join drinks as d; -- look understand ( modified version of above query)

-- SELF Join : finding manager names of all the employes
select emp_id, first_name, last_name, mgr_id from myemp limit 10; -- ( finding the managers of all the employes ex. 101 manager 100)
select emp.emp_id, emp.first_name, emp.last_name,
mgr.first_name as mgr_fname, mgr.last_name as mgr_lname
from myemp as emp join myemp as mgr on emp.mgr_id = mgr.emp_id;

-- DATABASE Constraints
/* Unique, Not Null, Default, Check 
Constraints : Restrictions that are applied on the colunns of the table
# Types:
1. Domain Constraints
2. Key Constraints

# Domain Constraints: 
1.Unique:can't have duplicated values eg. id column
2. Not null: value should be specified
3. Default:
4. Check: allows you to put some conditions eg. age conditions >18

# Key Constraints:
*** There should be atleast 1 column in a table which can uniquely identify records. ***
eg. sid  sname   age   course
     1   Tom    20     DA
     2   Tom    20     DA
     # Here sid is an unique column whose values are unique
     
     *** Key constriants are implemented unsing 'Primary Key' ***
     # Primary key is used to enforce the constrint that it will uniquely identify the records in the table
     By default a primary key is a column which is both unique and not null
     While creating table we can make a column as Primary Key.
     
     # Refrential Integrity Constraints
     Mysql is relational database because you can create table and then you can define connections.
	
	# Foreign Key:
	A foreign key can only point to a Primary kay in some other table. It can not point to any other connection
    * Table that contains Foreign key is called Child Table.
    * Table to which Foreign key is pointing is called Parent Table.
    Students Table: sid in Primary key, so it is CHILD Table.
    Course Table: id is Foreign key, so it is PARENT Table.
    You can add more than one Foreign Keys in a table.
    
    Students Table(CHILD)                      Course Table(PARENT)
    sid   sname   age   cid					cid		cname	duration	Fees
    1      Tom	   20    C10				C10		Mysql	2week		$100
    2      Tim    25     C10				C20		DA		6week		$200
    3      Mary   20    C20					C30		DS		6mon		$500
    
    You cann't put C70 in cid of students as it is not available in the course i.e. Parent
    C70 wll be an orphan record as it don't have any parent
    This is Refrential Integrity.
    
    Refrential Integrity says you can have only values from the parent table in the foreign key column.
    This is called Refrential Integrity Conatraints.
    
    If someone tries to delete say C20 record from parent table realted 3rd record in the Child table will become orphan.
    So Mysql will not allow to delete record.
    - No deletion of Parent record.
    - NO updation in parent 
    - Child take can give permission for parent to be deleted provieded you delete corresponding records from students table also. It was following keywords:
    
    -ON DELETE CASCADE or ON UPDATE are the optional permissions which may or may not be given.
    - Cascade means propogate i.e whatever changes you are doing in parent table, you propogate it to child table also.
    - While creating, Parent table should be created first.
    - While dropping, Child table should be dropped first.alter
    
    SEQUENCE:
    - It is a special object in mysql.
    - In oracle we can say creating sequence <sequence> .... ' but mysql does not support it.
    - In Mysql you have to use 'Auto Increment' Option
    - We don't have that much flexibility in sequence in mysql like you have in oracle and all
    - But you still have basic functionality in mysql 
    - Sequence is a list of numbers like 0,1,2,3,4,....
    - We use sequence elements when we create Primary Keys because primary keys are unique and not null, and sequence elements are unique.
    - Sequence will automatically UPDATE VALUES OF ID (Primary Key) column.
    No need to manually remember last id entered.
*/
show tables;
select * from students;
desc students;
insert into students values (1,'Harry', 'Mysql', 86);
insert into students values (1,'Tom', 'Mysql', 78);
select * from students;
drop table students;

create table students(
sid integer UNIQUE,
sname varchar(20) NOT NULL,
age integer CHECK(age>18),
course varchar(20));

desc students;
insert into students values (1,'Harry', 19, 'Mysql');
insert into students values (2,'Tom', 21, 'Python');
insert into students values (3,'Tim', 19, 'Mysql');
select * from students;
insert into students values (null,'Harry', 19, 'Mysql'); -- YES
insert into students values (null,'Harry', 29, 'Mysql'); -- YES
insert into students values (1,null, 19, 'Mysql'); -- NO
insert into students values (4,'Harry', 16, 'Mysql'); -- NO
desc students;
insert into students (sid,age,course) values (5, 19, 'Mysql'); -- NO (default value not set)
alter table students modify column sname varchar(20) NOT NULL default 'Smith'; -- setting default value or the column sname
desc students;
-- alter table students modify column sid integer UNIQUE and NOT NULL; -- How to give multiple constraints??

-- KEY COnstraints
select * from authors; -- PARENT Table
select * from books; -- CHILD Table
drop table authors;
drop table books;
drop table authors;

Create table authors( authorid integer PRIMARY KEY, name varchar(100)); -- Parent Table
select * from authors;
Create table books(bookid integer PRIMARY KEY, title varchar(255), aid integer, -- Creating CHild Table
FOREIGN KEY(aid) REFERENCES authors(authorid) ON DELETE CASCADE ON UPDATE CASCADE); -- Creating Foreign key and Cascading for direct deletion of the parent table.

insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');
select * from authors;

insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);
select * from books;
select * from authors;

delete from authors where authorid = 1;
select * from authors;
select * from books;

update authors set authorid = 88 where authorid = 8;
select * from authors;
select * from books;

-- SEQUENCE Object: AUTO_INCREMENT
create table test(id integer PRIMARY KEY AUTO_INCREMENT, name varchar(20), age integer);
select * from test;
desc test;
insert into test (name, age) values ('Harry', 20);
select * from test;
insert into test (name, age) values ('Tom', 23);
insert into test (name, age) values ('Mark', 19);
select * from test;

delete from test;
select * from test;
insert into test (name, age) values ('Tom', 23);

truncate test; -- deletes the table whole table and again creates the same table with same constraints, whereas delete only deletes the data in the table.
select * from test;
insert into test (name, age) values ('Tom', 23);
insert into test (name, age) values ('Harry', 20);
insert into test (name, age) values ('Mark', 19);
select * from test;
alter table test  AUTO_INCREMENT = 100;
insert into test (name, age) values ('Jucy', 18);
insert into test (name, age) values ('Clark', 22);
select * from test;

-- Commands
-- DDL - Drop Create Rename Alter Truncate
-- DML - Insert Delete Update
-- DQL - Select 
-- DCL - Grant Revoke
-- TCL - Commit Rollback Savepoint
