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