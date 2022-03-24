select * from customers
limit 10;

select * from orders
limit 10;

select * from books
limit 10;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

explain analyze select original_language, title,sales_in_millions 
from books
where original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));

create index order_idx on orders(customer_id, book_id);


create index book_order_idx on books(original_language, title,sales_in_millions);

--repeating step one and two
select * from customers
limit 10;

select * from orders
limit 10;

select * from books
limit 10;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT NOW();
drop index if exists order_idx;
\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
create index order_idx on orders(customer_id, book_id);
SELECT NOW();


create index first_name_and_email_idx on customers(first_name, email_address);
