create database Tech_Solutions;

create table Employees (employee_id int primary key,   first_name varchar(50) not null,
last_name varchar(50) not null, email varchar(100) unique not null, phone_number varchar(15), hire_date date not null, job_title varchar(50), salary decimal(10, 2) );

create table Departments ( department_id int primary key auto_increment, department_name varchar(50) not null, manager_id int, foreign key (manager_id) references Employees(employee_id) );