create database bookstore;
use bookstore;

create table books(
	book_id int primary key,
    title varchar(100),
    author varchar(50),
    price decimal(10,2),
    publication_date date,
    category varchar(30),
    in_stock int
);

insert into books values
(1, 'The MySQL Guide', 'John Smith', 29.99, '2023-01-15', 'Technology', 50),
(2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
(3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
(4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);

insert into books values
(5, 'Cook Book', null, 24.99, '2023-04-05', 'Cooking', 75);

insert into books values
(6, 'Mini Cook Book', 'Gohn Smith', 24.99, '2023-04-05', 'Cooking', 75);

select * from books
	where category = 'Technology';
		-- shows books where category is technology
        
select title, price from books 
	where price < 30.00;
		-- shows title of book for which price is less than 30
        
select title, publication_date from books
	where publication_date >= '2023-03-01';
    
-- Logical Operators
select * from books
	where category = 'Technology'
    and price < 30.00;
		-- shows the books which has category as technology and price less than 30
        
select * from books
	where category = 'Technology'
    or price < 30.00;
		-- shows the books which has category as technology or price less than 30
        
select * from books
	where (category = 'Technology' or category = 'Mystery')
    and price < 25;
		-- combining two or & and operators

select * from books 
	where not category = 'Technology';
		-- shows books where category is not technology
	
-- Finding NULL values
select * from books where author is null;
select * from books where author is not null;

-- Pattern matching
select * from books where title like '%SqL%';
	-- it selects books where title has sql in it anywhere and its case insensitive
    
select * from books where title like 'the%';
	-- it selects books where title starts with the
    
select * from books where title like binary '%SQL%';
	-- it selects books where title has SQL in it anywhere and its case sensitive it has to be SQL only because we are using binary
    
select * from books where author like '_ohn%';
	-- it selects books where author name has ohn and has one letter in front of ohn as we are using _ here
    
-- RANGE OPERATORS 
select * from books where price between 20 and 30;
	-- it shows books where price is b/w 20 and 30 and it includes both the bounds so including 20 30
    
select * from books where category in (
	'Technology', 'MysterY', 'Science'
);
	-- it gives all 3 categories book and its case insensitive
    
select * from books 
	where price between 20.00 and 40.00 
    and publication_date >= '2023-01-01';
    
-- Sub Queries
select * from books
	where price > ( select avg(price) from books);
    
select * from books where category in (
select category from books where in_stock > 40
);

-- Find all books published in 2023 that cost less than the average book price
select * from books
	where price < ( select avg(price) from books)
    and year(publication_date) = '2023';
    
-- List all technology books with "data" in the title that have less than 50 copies in stock
select title, category, in_stock from books
	where category = 'Technology'
    and in_stock < 50
    and title like '%data%';
    
-- Find books that are either in the Technology category with price > $30 or in the Mystery category with price < $20
select title, category, in_stock from books
	where (category = 'Technology' and price > 30) or (category = 'Mystery' and price > 20);

 -- List all books where the author's name contains either 'son' or 'th' and were published after March 2023
select title, author, publication_date from books
	where (author like '%son%' or author like '%th%')
    and year(publication_date) = '2023';

