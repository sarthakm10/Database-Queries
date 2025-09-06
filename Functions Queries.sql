CREATE DATABASE StringFunctionsDB;
USE StringFunctionsDB;

-- Create employees table for string function demonstrations
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);

-- Insert sample employee data
INSERT INTO employees (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');

-- CONCAT: Combine first and last names into full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- LENGTH: Get the length of the first name
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- UPPER and LOWER: Convert first names to uppercase and lowercase
SELECT first_name, UPPER(first_name) AS uppercase, LOWER(first_name) AS lowercase FROM employees;

-- TRIM: Remove leading and trailing spaces
SELECT TRIM(UPPER('      ok.   ')) AS trimmed_sample;

-- SUBSTRING: Extract the first three characters of first names
SELECT first_name, SUBSTRING(first_name, 1, 3) AS first_three_chars FROM employees;

-- LOCATE: Find the position of character 'a' in first names
SELECT first_name, LOCATE('a', first_name) AS position_of_a FROM employees;

-- LOCATE: Find the position of characters 'ch' in first names
SELECT first_name, LOCATE('ch', first_name) AS position_of_ch FROM employees;

-- REPLACE: Replace domain in email addresses
SELECT first_name, REPLACE(email, 'example.com', 'amazon.com') AS new_email FROM employees;

-- REVERSE: Reverse the characters in first names
SELECT first_name, REVERSE(first_name) AS reversed_name FROM employees;

-- LEFT and RIGHT: Get the first two and last two characters of first names
SELECT first_name, 
       LEFT(first_name, 2) AS first_two, 
       RIGHT(first_name, 2) AS last_two 
FROM employees;

-- ASCII: Get ASCII value of the first character in first names (regular and lowercase)
SELECT first_name, 
       ASCII(first_name) AS ascii_value, 
       ASCII(LOWER(first_name)) AS ascii_lowercase_value 
FROM employees;

-- LENGTH vs CHAR_LENGTH: Demonstrate difference with ASCII and multibyte characters
SELECT LENGTH('hello') AS length_in_bytes;          -- Returns 5 (bytes)
SELECT LENGTH('こんにちは') AS multibyte_length;      -- Returns more than 5 because each character is multiple bytes
SELECT CHAR_LENGTH('hello') AS char_count;          -- Returns 5 (characters)
SELECT CHAR_LENGTH('こんにちは') AS multibyte_char_count; -- Returns 5 (characters)

-- SOUNDEX: Compare phonetically similar strings
SELECT SOUNDEX('Smith') AS smith_soundex;  -- Returns 'S530'
SELECT SOUNDEX('Smyth') AS smyth_soundex;  -- Also returns 'S530'
SELECT SOUNDEX('Robert') AS robert_soundex; -- Returns 'R163'
SELECT SOUNDEX('Rupert') AS rupert_soundex; -- Also returns 'R163'

-- Find employees with names that sound like "Jane"
SELECT * FROM employees WHERE SOUNDEX('jane') = SOUNDEX(first_name);

-- =================
-- NUMERIC FUNCTIONS
-- =================

CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);

INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

-- Basic display of all values
SELECT * FROM numbers;

-- Absolute value function
SELECT num_value, ABS(num_value) AS absolute_value FROM numbers;

-- Rounding functions
SELECT num_value, 
       CEIL(num_value) AS rounded_up, 
       FLOOR(num_value) AS rounded_down 
FROM numbers;

SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;
SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;

-- Mathematical operations
SELECT num_value, POWER(num_value, 2) AS squared FROM numbers;
SELECT num_value, MOD(num_value, 3) AS remainder FROM numbers;
SELECT num_value, SQRT(ABS(num_value)) AS sqrt_value FROM numbers;

-- Exponential functions with handling for out-of-range values
SELECT 
    num_value, 
    CASE 
        WHEN num_value > 709 THEN 'Value too large for EXP()' 
        ELSE EXP(num_value) 
    END AS exp_value 
FROM numbers;

-- Logarithmic functions
SELECT num_value, 
       LOG(2, ABS(num_value) + 1) AS log_base2, 
       LOG10(ABS(num_value) + 1) AS log_base10 
FROM numbers;

-- Trigonometric functions
SELECT num_value, 
       SIN(num_value) AS sin_value, 
       COS(num_value) AS cos_value, 
       TAN(num_value) AS tan_value 
FROM numbers;

-- Pi constant and angle conversions
SELECT PI() AS pi_value;
SELECT num_value, 
       RADIANS(num_value) AS radians_value, 
       DEGREES(num_value) AS degrees_value 
FROM numbers;

-- Bitwise operations
SELECT BIT_AND(num_value) FROM numbers;
SELECT BIT_OR(num_value) FROM numbers;
SELECT BIT_XOR(num_value) FROM numbers;

