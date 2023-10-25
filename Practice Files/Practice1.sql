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
/* GRANT select on hrdb.myemp to hruser;
REVOKEselect from hruser on hrdb.myemp;
TCL: ROLLBACK: To undo actions that you have done by mistake.
UNDO: go back to previous state before any action.

DBMS is responsible to store and retrive data to / from server.
But sctualy it doesn't do this directly.
It does this through Cache/Buffer.

eg. insert into emp values(1,'Jon', 32);
HEre, Jon does not go directly to Hard DIsk. He 1st goes to cache.
As long as he is present in cache it can be undone i.e. you can 'ROLLBACK'.
If after inserting, we excute 'COMMIT' command, Jon's record will be flushed out
i.e. it will be moved to Hard Disk. After that you can't undo.
Only option is to DELETE it from Hard Disk. 


In server there is a setup command AUTOCOMMIT set to 1, But we have to set it to 0 then only ROLLBACK command will work.


Transaction in TCL: It is a set of commands that behaves like a single atomis unit (single
eg.   Account1   	Account2
	Balance = 50k 	Balance = 10k
    Transfer 20k from Acc1 to Acc2
    In backend there might be a table called
    Accounts Table 
    Accno	Name	Balance
    Acc1	Tom		50k
    Acc2	Mary	10k
    
    When transfer happens following queries will be excuted for each account:
    For Acc1: update accounts set balance = 30k where accno = acc1;
    For Acc2: update accounts set balance = 30k where accno = acc32;
    
    There will ve a log transactions table also
    Log_transaction table
    accno	transaction	amount
    Acc1	debit		20k
    Acc2	credit		20k
    
    i.e backend following 4 transactions are excetued
    1. Debit acc1
    2. credit acc2
    3. logtransaction fro debit operation
    4. log transaction for credit operation
    
    what if from above only transaction number 1,3,and 4 only excuted successfully?
    for acc1
    1. as 1st transaction is executed: Bal = 50k -20k will be debited
    2. As 2nd transaction is not executed : amount will not be credited to acc2
    3. as 3rd transaction is executed: acc1 balance  = 30k
    4. as 4th transaction is executed: acc2 balance = 30k (But actually the amount is not credited
    You will neve know where 20k has gone from acc1. This is called incosistency.
    This should never happem. So as part of transction control what do we need to de?
    - Make sure that all 4 commands behave like 1 unit
    - Either all should execute or all transcations shoud fail.
    
    "When you "START TRANSACTION", AUTOCOMMIT will be turned off temporarity at backend".
    Then 4 commands will be executed sequentially
    At the end we will write COMMIT
    If all 4 commands executed successfully, commit will happed & results will be updated in persistent2
    
    
    INDEX:
    1. Index is used to improve the performance i.e data retrieval becomes faster.
    eg. book and book index, serarch word 'Primary Key' in 700 pg.
    if index is there P -Primary Key: 530,670
    we will directly go to pg no. 530 & 670 and have information about primary key 
    2. Indexes are seperated database object. So they take up space in memory unlike views
    3. Indexes have thier own structure / need memory
    eg. searching a sid from table where index is not set (Full Table Scn)
    4. Indexes are created on collumns. eg. Emp table: eid, ename, job, salary
    select * from emp where eid = 9740; It will search only eid column & will extract record of eid = 9740.
    select * from emp where ename = 'Tom'; It will be excuted as normal query i.e. will scan entire table.
    5. There are different types of indexs:
    Based on Data Type:
    a. Unique index
    b. Special index
    c. Full text index
    Based on structure
    a. B-Tree (Balanced) Index
    b. Hash Index
	
    B-Tree (Balanced) Index:
    -It uses binary tree search technique.
    - suppose index is created on eid: 23,31,35,45,51,61,65 (8 records are in table)
    - eid is sorted in ascending order:(it is)
    - if we want to search eid = 53, center is taken (45+51/2 = 48)
    - 1st search: compare 53 & 48 , 53>48 so records less that 478 are eliminated and it will search on right side
    - 2nd search take center (57) of remaining records. 53<57 so search on left of 57
    - 3rd search: center is 53, 53>52 so search on right of 52. You will get rocord no 53.
    
    If there are 8 records any rocord can be searched in 3 searches only. 2^3 =8
    If there are 1000 records any record can be srarched in 10 searches only. 2^10 = 1000.
    If no index it would have done 7 searches.
    In tree structure Leaf Nodes have actual eid along with memory address.
    When aid is ofund it goes to that memory address directly where entire record is stored and then that record is extracted
    
    
    HASH INDEX: 
    It uses Hash Function
    - Hash function points to the location where you can store record.
    eg. suppose hash function is: (add 1000 to x)
    if x=20, hash(x) = 1020
    if x=35, hash(x) = 1035
    This hashed calue 1020 or 1035 will be used as memory address.
    Query: insert into emp(35,'jon',40), this record will be stored at 1035 memory lication
    Query: select * from emp where eid = 35.
    Again hash(35) will be taken as 1035. It will go to 1035 mem location and will extract the record.
    
    Hash function is faster tha B-tree
    - But there are restrictions
    - Inside db server there are different enginer.
    - DB engine is responsible for doing all the work.
    - When DBA creates a server he/she will also choose what kind of engine is most suited for your application
    - By default you will have innodb engine
    - eg. show create table books;
    - It will show how books table is created
    - Below, it shows engine name: InnoDB (default)
    -DBA can change this default engine
    - MemoryDB: only this engine supports hashing
    - Balanced tree is most commonly used
    
    Question: Why Indexes are not created on ebery column?
    Ans: 1. More store/space is required for every colummn tree structure
    2. If DML queries are frequent commands on table, then its not a good idea to create index because 
    everytime you have to recreate that index which will eventually slow down your system instead of making it faster
    3. If very few records (5lach) don't create index
    4. If millions of records, create index
    5. If you are only reading data from a table,create an index
    
    Based on Data Types, Index are:
    1. Unique Index
    2. Special Index
    3. Fulltext Index - 2 & 3 are based on specialized data types
    
    1. Special index: Special Data datatype is used to store geometric shapes(points rectangles triangles etc.)
    2. Fulltext Index: created on text type of data (text, tinytext, longtext- can store upto 4GB of data, entire pdf bnook can be stored in this)
		If data type of a column is declared as full text which contains entire book it will allow you for flexible search within those contents.
        
	3. Unique Index: Can create unique index on char, varchar, numeric, data types
		When unique constraints is applied at the back end unique index is applied.
        2 wayas to create unique index:
        1. Implicitly:
        - By creating unique constraint or
        - by defining a column as primary key. Here indexes are automatically created
        2. Explicitly:
        - By command: create unique index uidx on emp(eid);
        - Syntax: create [unique/special/fulltext] index
						[using Hash/BTree]
                        On <table_name> (col_name);
		eg. create Hash Index on book_id of books table:
        create index hidx using hash on books(bid);
        But as we are using INNODB by default, it will raise as error.
    
    
    
*/
-- TCL Commit dna RollBack
select * from students;
insert  into students values(4, 'Classy', 25, 'Mysql');
select * from students;
ROLLBACK;
select * from students;
set AUTOCOMMIT = 0;
insert into students values(6,'Kumar', 21, 'Python');
select * from students;
ROLLBACK; -- after setting AUTOCOMMIT = 0
select * from students;
insert into students values(6,'Kumar', 21, 'Python');
select  * from students;
COMMIT; -- once commit data does into permenant memory
ROLLBACK; -- that's why unable to rollback
select * from students;

set AUTOCOMMIT = 1;

create table tt(id char);
select * from tt;
insert into tt values('a');
insert into tt values('b');
select * from tt;
set sql_safe_updates = 0;
delete from tt;
select * from tt;

START TRANSACTION; -- AUTOCOMMIT = 0 automatically
insert into tt values('a');
insert into tt values('b');
select  * from tt;
ROLLBACK;
select * from tt;

START TRANSACTION;
select * from tt;
insert into tt values('a');
insert into tt values('b');
savepoint sb;
insert into tt values('c');
insert into tt values('d');
savepoint sd;
insert into tt values('e');
insert into tt values('f');
select * from tt;
ROLLBACK to sd;
select * from tt;
COMMIT; -- AUTOCOMMIT = 1
ROLLBACK;
select * from tt;

/* Start Transaction
Update = AC = 0 
Insert = AC = 0
Drop Table = AC = 1
Insert - AC = 0
Commit -- AutoCommit = 1

*/

-- Database objects:  VIEWs TABLE Index SEQUENCE 
/* VIEWS
View is a virtual table. It doesn't take any sapce in memory.
Suppose myemp table has 15 columns and you want randomly any 3 columns from it, you can create
having only those 3 columns. So view is called 'WIndow on data'.
Then you don't need to write query by selecting those 3 column names.
Instead you can write: select * from viewname;

Updatable view

As long as you create a view by takiung columns directly from table as it is,
your view wqill be an updatab le view i.e. insert, update, delete is possible through view.
But if oyu have anything special in your select command you can create view
*/

Show tables;
select * from myemp limit 10;
select emp_id, first_name, last_name, job_id from myemp;
create view myview as select emp_id, first_name, last_name, job_id from myemp;
select * from myview limit 10;

select * from movies;
select * from members;
select mv.title, mm.first_name, mm.last_name from movies as mv left join members as mm on mv.id = mm.movieid;

create view sort as select mv.title, ifnull(mm.first_name, '--') as fname, ifnull(mm.last_name, '--') as lname 
from movies as mv left join members as mm on mv.id = mm.movieid;
select * from sort;

select * from authors;
select * from books;

select * from authors where authorid < 15;
create view aview as select * from authors where authorid < 15;
select * from aview;
 
 insert into aview values (20,'Jon Hamm');
 select * from aview;
 select * from authors;
 drop view aview;
 create view aview as select * from authors where authorid < 15 WITH CHECK OPTION;
 select * from aview;
insert into aview values(20,'Jon Hamm');
insert into aview values(14,'Jon Hamm');
select * from aview;

-- Index
desc students;
show indexes from students;

desc authors;
show indexes from authors;

-- Explicit Index
use employees;
select count(*) from employees;
select * from employess limit 10;
select birth_date, first_name, last_name, gender, hire_date from employees;
show indexes from employees;
drop index hidx on employees;
show indexes from employees;
-- Find all employees who were hired on or later year 2000.
select * from employees where hire_date >= '2000-01-01';

create index hidx on employees(hire_date);
select * from employees where hire_date >= '2000-01-01';


-- Testing commands from comparison
select * from myemp;
select count(*) from myemp;
select * from myemp where emp_id = 106;
show indexes from myemp;
create index  uid on myemp(emp_id);
select * from myemp;




-- STORED PROCEDURE
use practicebd4;
call new_procedure();
call hello();
call myproc(5);
select * from books;



/* STORED PROCEDURES
- 2 Types of variables:
Parameter: used to pass values to stored procedures, functions
Local Variable: It is the one that you declare within BEGIN and END
It is available within that block only
When procedure end, variable also dies
Local variables need to be declared
eg. "Devlare x integer default 0;"
- Whe do we need local variables
To store intermediate results
eg. def avg(x1 x2 x3):
	total = x1 + x2 +x3
	avg = total/3
Local variables are: total, avg

- Main reason of local variable is: you can not take out value of a column outside the selected

- Select aid as author; This line is like print() statement only
= select authorid from books where bookid = authorid; This is actual mysql select command.
- When you take authorid out from actual query, mysql does not understands what authorid is
- When authorid is part of select command, mysql understanfds that it is comiung from books table
and authorid is a columns in books table
- But when you tale out from se;ect command and put it in print command, mysql does not understand
Therefore any column can not be taken out of select command
- Solution:
- When you select any value, store it in a local variable
- "Swlwct authorid from books where bookid=bid;"
and then use that local variable at different place
    
*/
