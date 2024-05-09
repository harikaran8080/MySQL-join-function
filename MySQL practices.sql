create database joinmethod;
show databases;
CREATE TABLE branch (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(30) NOT NULL,
addr VARCHAR(200) );

CREATE TABLE employee (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(30) NOT NULL,
job_desc VARCHAR(20),
salary INT,
branch_id INT,
CONSTRAINT FK_branchId FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

INSERT INTO branch VALUES(1,"Chennai","16 ABC Road");
INSERT INTO branch VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO branch VALUES(3,"Mumbai","25 XYZ Road");
INSERT INTO branch VALUES(4,"Hydrabad","32 10th Street");

INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000,2);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000,2);
INSERT INTO employee VALUES(3,'George','SALES',2000000,1);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000,2);
INSERT INTO employee VALUES(5,'Meena','HR',2000000,3);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000,1);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000,1);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000,2);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000,3);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000,3);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000,1);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000,1);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000,2);
INSERT INTO employee VALUES(14,'Vidya','ADMIN',2200000,NULL);
INSERT INTO employee VALUES(15,'Ranjani','ENGINEER',2100000,NULL);

SELECT * FROM employee;
SELECT * FROM branch;

select employee.emp_id,employee.ename,employee.job_desc,employee.branch_id,branch.br_name
from employee
inner join branch
on employee.branch_id=branch.branch_id
order by emp_id;

select employee.emp_id,employee.ename,employee.job_desc,employee.branch_id,branch.br_name
from employee
right join branch
on employee.branch_id=branch.branch_id
order by emp_id;


select employee.emp_id,employee.ename,employee.job_desc,employee.branch_id,branch.br_name
from employee
cross join branch;

select b.br_name,count(e.emp_id) 
from branch as b
left join employee as e
on e.branch_id=b.branch_id
group by b.branch_id;


select * from employee
where branch_id =(select branch_id from branch
where br_name='chennai');

select * from branch
where branch_id =(select branch_id from employee
where job_desc='SALES');


select * from branch
where br_name =(select branch_id from employee
where job_desc='SALES');