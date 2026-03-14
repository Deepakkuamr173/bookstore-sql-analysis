
drop table if exists books;

create table books(
    Book_ID serial primary key,
	Title  varchar(100),
	Author varchar(100),
	Genre  varchar(100),
	Published_Year  int,
	Price numeric(10,2),
	Stock int
);


drop table if exists customers

create table customers(
	Customer_ID serial primary key,
	Name varchar(50),
	Email varchar(100),
	Phone  varchar(50),
	City   varchar(50),
	Country varchar(100)
);



drop table if exists orders;

create table orders(
	Order_ID serial primary key,
	Customer_ID  int references  customers(Customer_ID),
	Book_ID  int references books(Book_ID),
	Order_Date   date,
	Quantity   int,
	Total_Amount  numeric(15,2)

);


-- import csv file in the sql


-- this is Books table
COPY books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:\Program Files\PostgreSQL\18\book booking project csv file\Books.csv'
DELIMITER ','
CSV HEADER;


-- this is customer table
COPY customers(Customer_ID	,Name	,Email	,Phone	,City	,Country)
FROM 'C:\Program Files\PostgreSQL\18\book booking project csv file\Customers.csv'
DELIMITER ','
CSV HEADER;


-- this is orders table
COPY orders(Order_ID	,Customer_ID,	Book_ID,	Order_Date	,Quantity	,Total_Amount)
FROM 'C:\Program Files\PostgreSQL\18\book booking project csv file\Orders.csv'
DELIMITER ','
CSV HEADER;


select * from books;
select * from customers;
select * from  orders;

-- basic  Queries 

-- 1. Retrive all books in the "Fiction" genre:

select * from books
where genre='Fiction';

-- 2. Find books published after the year 1950:
select * from books 
where published_year>1950;

-- 3. List all customers from the North Brian:
select * from customers
where city='North Brian';

-- 4. show orders placed in November 2023.
select * from orders
where order_date='01-11-2023';  -- this is only for 1 november 2023

select * from orders
where Order_Date between '01-11-2023' and '30-11-2023';
       -- or
select * from orders
where Order_date>='01-11-2023' and Order_date<='30-11-2023';


-- 5. Retrive the total stock of books available.
select sum(stock)  as total_stock
from books;


-- 6. Find the details of the most expensinve book.
select * from books
where price=(select max(price) from books);
   -- or
select * from books
order by price desc
limit 1
;


-- 7. Show all customers who ordered more than 1 quantity of a book.
select customer_id,quantity from orders
where 
quantity>1;


-- 8. Retrieve all orders where the total amount exceeds $20

select * from orders
where total_amount>20;

-- 9. List all genres available in  the books table
        -- distinct are use to remove the dublicate value in the table
		
select  distinct genre  from books;

-- 10. Find the book with the lowest stock
select  * from books
order by stock asc
limit 5;



-- 11. Calculate the total revenue generated from all orders.

select sum(total_amount) as total_revenue_amount
from orders;


select * from books;
select * from customers;
select * from  orders;

-- advanced Queries

-- 1.  Retrive the total number of books sold for each genre

select  b.genre,sum(o.quantity) as Total_sold_books
from orders o
join
books b
on b.book_id=o.book_id
group by b.genre;

-- 2. Find the average price of books in the "Fantasy" genre
select avg(price) as average_price
from books
where genre='Fantasy';


-- 3. List customers who have palced at least 2 orders
select customer_id,count(order_id) as order_count
from orders
group by customer_id
having count(order_id)>=2;

    -- or 
-- if you want to show customer details than useS
select c.customer_id,c.name,c.phone,c.country,
       count(o.order_id) as toatal_order
from customers c
join
orders o
on c.customer_id=o.customer_id
GROUP BY c.customer_id, c.name, c.phone, c.country
having count(o.order_id)>=2;

-- 4. Find the most frequently ordered book.

select o.book_id,b.title ,count(o.order_id) as order_count
from orders o
join
books b
on o.book_id=b.book_id
group by o.book_id,b.title
order by order_count desc limit 1;

-- 5. Show  the top 3 most expensive books of 'Fantasy' Genre
select * from books
where genre='Fantasy'
order by price desc limit 3;

-- 6. Retrive the total quantity of the books sold by each aunthor




select b.author,b.genre,b.stock,
       sum(o.quantity) as total_books_sold
from books b
join
orders o
on b.book_id=o.order_id
group by  b.author,b.genre,b.stock;



-- 7. List the cities where customers whoe spent over  $30 are located
select distinct c.city,o.total_amount
from customers c
join
orders o
on o.customer_id=c.customer_id
where o.total_amount>30;

-- 8. Find the customer who spent the most on orders

               -- here  grouping on the basis of name and email
select distinct c.name,c.email,
       sum(o.total_amount) as order_amount
from customers c
join
orders o
on c.customer_id=o.customer_id
group by c.name,c.email
order by  order_amount desc
limit 1;


                -- here  grouping on the basis of customer_id
select  c.customer_id,
       sum(o.total_amount) as order_amount
from customers c
join
orders o
on c.customer_id=o.customer_id
group by  c.customer_id
order by  order_amount desc
limit 1;



-- 9. Calculate the stock remaining after fulfilling all orders

-- this  is better?
-- Left Join
-- → All books will be displayed, regardless of whether there is an order or not.

-- COALESCE(SUM(o.quantity), 0)
-- → If there is no order, NULL is converted to 0.

select b.book_id, b.title,b.stock,
       coalesce(sum(o.quantity),0)  as total_order_quantity,
	   b.stock-coalesce(sum(o.quantity),0) as remaining_stock_of_quantity
from books b
left join
orders o
on b.book_id=o.book_id
group by b.book_id
order by book_id;


"JOIN → Only those books will be visible which have received orders."
"If there are no orders for a book, it will not show up in the results."

select b.book_id, b.stock,
       sum(o.quantity)  as total_quantity
	   ,b.stock-sum(o.quantity) as remaining_stock 
from books b
join 
orders o
on b.book_id=o.book_id
group by b.book_id, b.stock
order by book_id;


--10 find the customer who order quantity 2
select c.customer_id,c.name,c.phone,c.country,
       o.order_date,o.quantity
from customers c
join
orders o
on c.customer_id=o.customer_id
where quantity=2;
	   


select * from books;
select * from customers;
select * from  orders;




