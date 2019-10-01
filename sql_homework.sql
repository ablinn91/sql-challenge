--Sql homework 1:

--creating Tables: 
CREATE TABLE Employees (
    emp_no int,
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
    gender varchar(30),
    hire_date date
);

CREATE TABLE Departments (
    dept_no varchar(10),
    dept_name varchar (30)
);    

CREATE TABLE dept_emp (
    emp_no int,
    dept_no varchar(10),
    from_date date,
    to_date date
);

Create Table dept_manager (
    dept_no varchar(10),
    emp_no int,
    from_date date,
    to_datte date
);
Create Table emp_no (
    emp_no int,
    salary int,
    from_date date,
    to_date date
);
Create Table titles (
    emp_no int,
    title varchar(30),
    from_date date,
    to_date date
);

create table saleries (
    emp_no int,
    salary int,
    from_date date,
    to_date date
)

--prbelm 1 
select 
	employees.emp_no,
	last_name,
	first_name,
	Gender,
	salary
from 
employees
Inner Join salaries on salaries.emp_no = employees.emp_no
--problem 2, fining all employees that were hired in 1986
select 
	first_name, 
	last_name,
	hire_date
from employees
	where hire_date between '1986-01-01' and '1986-12-31';
--problem 3
select 
	dept_manager.dept_no,
	dept_manager.emp_no,
	dept_name,
	first_name,
	last_name,
	from_date,
	to_date
from 
	dept_manager
INNER JOIN departments on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no
--probelm 4 
select 
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from employees
INNER JOIN dept_emp on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
--Problem 5 
select 
	last_name, 
	first_name
from 
	employees
where
	first_name = 'Hercules' and last_name like 'B%'
--Problem 6 	
select 
	employees.first_name,
	employees.last_name,
	dept_emp,
	dept_name
from 
	departments
	Join
	dept_emp on departments.dept_no = dept_emp.dept_no
	join
	employees on dept_emp.emp_no = employees.emp_no
	where departments.dept_name = 'Sales'
--Problem 7
select 
	employees.first_name,
	employees.last_name,
	dept_emp,
	dept_name
from 
	departments
	Join
	dept_emp on departments.dept_no = dept_emp.dept_no
	join
	employees on dept_emp.emp_no = employees.emp_no
	where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
--Problem 6 	
select 
	employees.first_name,
	employees.last_name,
	dept_emp,
	dept_name
from 
	departments
	Join
	dept_emp on departments.dept_no = dept_emp.dept_no
	join
	employees on dept_emp.emp_no = employees.emp_no
	where departments.dept_name = 'Sales'
--problem 8
select 
	last_name, 
	count(*) as occurrences
from 
	employees
group by
	last_name
order by 
	occurrences desc, last_name
