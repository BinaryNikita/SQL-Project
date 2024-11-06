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