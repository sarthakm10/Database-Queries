create database company;
use company;

create table employees(
	-- used to create table in db
	employee_id int primary key auto_increment,
		-- (field name) (data type) (constraints)
        -- primary key it is unique in the table
        -- auto_increment it keeps increment the value by +1
	first_name varchar(50) not null,
    last_name varchar(50) not null,
    hire_date date default (current_date()),
		-- default gives the value idf users doesn't give and here it will give current_date when the value is being added
	salary decimal(10,2) check (salary>1.0),
		-- (10,2) 10 digits with 2 decimal places & checks that it should be greator than 10
	email_id varchar(50) unique check (email_id regexp '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,63}$'),
		-- unique says it should not be duplicated, like for 2 persons you can't have same email_id
	employment_status enum('active', 'on_leave', 'terminated') default 'active',
		-- enum allows user to select options for the field
	created_at timestamp default current_timestamp,
		-- it will list the timestamp when the values are created
	updated_at timestamp default current_timestamp on update current_timestamp
		-- it will get updated when there is an update in the table
);

insert into employees(
	-- used to insert data in the table
    first_name, last_name, salary, email_id
) values
	('John', 'Doe', 60000.00, 'john_doe@gmail.com'),
    ('Jane', 'Smith', 75000.00, 'jane_smith@gmail.com'),
    ('Bob', 'Williams', 72000.00, 'bob_williams@gmail.com');

select * from employees;

alter table employees
	add column contact_no varchar(10);
		-- to add new column 

alter table employees
	modify column contact_no varchar(10) not null;
		-- to modify a column
        
alter table employees
	add column test_col varchar(10);

alter table employees
	drop column test_col;
        
create table department(
	department_id int primary key auto_increment,
    department_name enum('HR', 'IT', 'Sales') default 'IT',
    location enum('Block A', 'Block B', 'Block C') default 'Block A',
    created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp
);

insert into department(department_name, location) values
	('IT', 'Block A'),
    ('HR', 'Block B'),
    ('Sales', 'Block C');
    
select * from department;

alter table employees
	add column department_id INT;
    
alter table employees
	modify column department_id INT not null;
    
alter table employees
	add foreign key(department_id)
    references department(department_id);
		-- to add foreign key in employee table in column department_id taking it from department table in column department_id
        
create table test(
    first_name varchar(50) not null,
    last_name varchar(50) not null
);

drop table test;

drop table if exists test;
