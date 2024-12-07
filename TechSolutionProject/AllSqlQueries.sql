create database Tech_Solutions;

create table Employees (employee_id int primary key auto_increment,   first_name varchar(50) not null,
last_name varchar(50) not null, email varchar(100) unique not null, phone_number varchar(15), hire_date date not null, job_title varchar(50), salary decimal(10, 2) );

create table Departments ( department_id int primary key auto_increment, department_name varchar(50) not null, manager_id int, foreign key (manager_id) references Employees(employee_id) );

alter table Employees add column department_id int;
alter table Employees add constraint department_id foreign key(department_id) references Departments(department_id);

create table Projects(
project_id int primary key auto_increment, 
project_name varchar(100) not null,  
start_date date, end_date date, 
budget decimal(10, 2), 
department_id int,
 foreign key (department_id) references Departments(department_id));

 create table Clients( client_id int primary key auto_increment, client_name varchar(100)
 not null, contact_person varchar(100),  phone_number varchar(15), email varchar(100) unique);

 insert into Departments (department_name, manager_id) values     ('Engineering', null),     ('Human Resources', null),     ('Marketing', null),     ('Sales', null);

 insert into Employees (first_name, last_name, email, phone_number, hire_date, job_title, salary, department_id) values     ('Alice', 'Smith', 'alice.smith@techsolutions.com', '555-1234', '2022-01-10', 'Software Engineer', 75000, 1),     ('Bob', 'Brown', 'bob.brown@techsolutions.com', '555-5678', '2021-06-15', 'HR Specialist', 50000, 2),     ('Charlie', 'Johnson', 'charlie.johnson@techsolutions.com', '555-8765', '2023-03-20', 'Marketing Manager', 65000, 3),     ('Dana', 'Lee', 'dana.lee@techsolutions.com', '555-4321', '2020-09-25', 'Sales Executive', 55000, 4);

 update Departments set manager_id = 1 where department_id = 1;
 update Departments set manager_id = 2 where department_id = 2;
 update Departments set manager_id = 3 where department_id = 3;
 update Departments set manager_id = 4 where department_id = 4;

insert into Projects (project_name, start_date, end_date, budget, department_id)
values
    ('Website Redesign', '2023-01-01', '2023-06-30', 20000, 1),
    ('Employee Onboarding', '2023-02-01', '2023-05-01', 10000, 2),
    ('Social Media Campaign', '2023-04-01', '2023-08-01', 15000, 3);

insert into Clients (client_name, contact_person, phone_number, email)
values
 ('Acme Corp', 'John Doe', '555-9876', 'johndoe@acmecorp.com'),
 ('Global Solutions', 'Jane Roe', '555-5432', 'janeroe@globalsolutions.com');


Query: Retrieve all columns and rows from the Employees table.
select * from Employees;

Query: Retrieve only the first name, last name, and job title of each employee.
select  first_name, last_name, job_title from Employees;

Query: Find employees in the "Engineering" department.
select department_id where department_name = 'Engineering';
select * from Employees where department_id = 1;

Query: Retrieve employees and sort them by hire_date in descending order.
select first_name, last_name, hire_date from Employees order by hire_date  desc;

Query: Retrieve the top 3 highest-paid employees.
select first_name, last_name, salary  from Employees order by salary  desc limit 3;

Query: Update Bob’s job title to "HR Manager" and increase his salary to 60,000.
select employee_id from Employees where first_name = 'Bob' and last_name = 'Brown';
update Employees set job_title = 'HR Manager', salary = 60000 where employee_id = 2;

Query: Delete the record for "Global Solutions" from the Clients table.
select client_id from Clients where client_name = 'global solutions';
delete from Clients where client_id = 2;

Query: Suppose you need to delete only the oldest project.
delete from Projects order by start_date asc limit 1;

INNER JOIN 
Scenario: Get a list of all employees and the departments they belong to.
select Employees.first_name, Employees.last_name, Departments.department_name from Employees inner join Departments on Employees.department_id = Departments.department_id;

LEFT JOIN 
Scenario: List all departments and any associated projects, including departments with no projects.
select Departments.department_name, Projects.project_name from Departments left join Projects  on Projects.department_id =
Departments.department_id;

RIGHT JOIN
Scenario: Get a list of projects and any associated department, including projects without a department.
select Projects.project_name, Departments.department_name from Projects inner join Departments on  Departments.department_i
d = Projects.department_id;

Aggregate Functions

Scenario: Count the total number of employees in the company.
select count(*) as Total_Employee from Employees;

Scenario: Calculate the total salary paid to all employees.
select sum(salary) as Total_Salary from Employees;

Scenario: Find the average salary of employees.
select avg(salary) as Average_Salary from Employees;

Scenario: Get the Employee with second highest salary.
select first_name, last_name, salary from Employees where salary = (select max(salary) from Employees where salary < (select max(salary) from Employees));

Scenario: Identify the highest and lowest project budgets.
select min(budget) as Minimum_budget, max(budget) as Maxmium_budget from Projects;

Scenario: Count employees with the same department
select department_id, count(*) as same_department from employees group by department_id;

Scenario: Find employees who earn more than the average salary.
select first_name, last_name, salary  from employees where salary > (select avg(salary) from employees);

Scenario: Find employees who work in the same department as "John Doe".
select first_name, last_name, department_id from employees where department_id = (select department_id from employees where first_name = 'Amit');

Scenario: Get the average salary of employees in each department.
select department_id, avg(salary) as average_Salary from (select department_id, salary from employees)  as subquery group by department_id ;

Scenario: Write a SQL query to generate an enrollment number for each employee by concatenating the following:

The employee's employee_id.
The first two letters of the employee's first_name.
The first two letters of the employee's department name (from the Departments table).
The year part of the employee's hire_date.
The result should include two columns:

employee_id
enrollment_number
The Employees table and Departments table are related by department_id.

For example, given the data:

Employee ID: 36
First Name: Nikita
Department Name: Human Resources
Hire Date: 2024-11-23
The generated enrollment number should be: 36NiHu2024.

 select e.employee_id, concat(e.employee_id,substring(e.first_name, 1),substring(d.department_name, 1, 2),year(e.hire_date)
    ) as enrollment_number from employees e join departments d  on e.department_id = d.department_id;
//
select 
    e.employee_id,
    concat(
        e.employee_id, 
        substring(e.first_name, 1, 2), 
        substring(d.department_name, 1, 2), 
        year(e.hire_date)
    ) as enrollment_number
from 
    employees e
join 
    departments d 
on 
    e.department_id = d.department_id;

Query :find the employees whose names start with the letter A
 select * from employees where first_name like 'a%';

Query :find the employees whose names end with the letter A
select * from employees where first_name like '%a';

Query: retrieves all columns (*) from the employees table for rows where the first_name:

Starts with the letter a, and
Ends with the letter a, with any number (including zero) of characters in between.

select * from employees where first_name like 'a%a';

Query: average salary for all employees grouped by their departments
select 
    d.department_name, 
    avg(e.salary) as average_salary
from 
    employees e
join 
    departments d 
on 
    e.department_id = d.department_id
group by 
    d.department_name;

Query: find employees who joined in the year 2020
select 
    * 
from 
    employees 
where 
    year(hire_date) = 2020;
Query: employee with the maximum salary in each department
select 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    d.department_name, 
    e.salary
from 
    employees e
join 
    departments d 
on 
    e.department_id = d.department_id
where 
    e.salary = (
        select 
            max(salary)
        from 
            employees
        where 
            department_id = e.department_id
    );

Query: find the length of first name and second name

select 
    first_name, 
    last_name, 
    length(first_name) as first_name_length, 
    length(last_name) as last_name_length
from 
    employees;
Query: Trim space and convert employee names to upper case
select 
    first_name, 
    last_name, 
    upper(trim(first_name)) as cleaned_first_name, 
    upper(trim(last_name)) as cleaned_last_name
from 
    employees;
Query:  Full Date Format (Day, Month, Year)
select date_format(hire_date, '%W, %M %d, %Y') as formatted_date from employees;

select date_format(hire_date, '%d-%m-%Y') as formatted_date from employees;

American format
select date_format(hire_date, '%m/%d/%Y') as formatted_date from employees;
year and month only
select date_format(hire_date, '%Y-%m') as year_month from employees;

Query: get the employee whose first name length is 6
select * from employees where length(first_name) = 6;
