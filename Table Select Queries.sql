create database company;
use company;

select * from employees;
	-- to show the table
    
select first_name from employees;
	-- to show only first name

select first_name as 'First Name' from employees;
	-- to just make it visually appearing 

select * from employees
	where employment_status="on_leave";
		-- to show all the fields in table in which employment status is set on on_leave

select * from employees
	where employment_status="active" order by salary;
		-- it will order it according to the salary
        
select * from employees
	where employment_status="active" order by salary desc;
		-- it will order in descending order of salary

select * from employees limit 2;
	-- to only show 2 values
        
select * from employees
	where employment_status="active" order by salary desc limit 1;
		-- it will show the highest salary data
        
select distinct employment_status from employees;
	-- it will show distinct values for that field only
    
select first_name, last_name, salary*1.1 as 'Salary after Raise' from employees;
	-- it will increase the slary by 10%

select concat(first_name, ' ', last_name) as 'Full Name' from employees;
	-- it combines the two rows first and last name into single column

select first_name, year(hire_date) as 'Hire Year', round(salary) from employees;
	-- it takes out year from the date
    -- it rounds up the salary

select * from employees
	where salary > (select avg(salary) from employees);
    -- it selects data for which salary is higher than the avg salary
    
insert into employees(
	-- used to insert data in the table
    first_name, last_name, salary, email_id, contact_no, department_id
) values
    ('Charlie', 'brown', 65000.00, 'charlie_brown@gmail.com', 4444333221, 2);
    
select first_name, last_name from employees where employment_status = "on_leave" union
select first_name, last_name from employees where employment_status = "terminated";
	-- it shows employees having both the status

select count(*), employment_status from employees group by employment_status;
	-- it counts the number of values for the employment_status
    
-- few more 
select now() as 'time';
select 5 * 2;
select length('hello');
select 5>3;

