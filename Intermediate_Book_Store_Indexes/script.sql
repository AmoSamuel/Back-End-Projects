select * from customers
limit 10;
select * from orders
limit 10;
select * from books
limit 10;

--checking indexes that exist on each database
select *
from pg_indexes
where tablename = 'customers';

select *
from pg_indexes
where tablename = 'orders';


select *
from pg_indexes
where tablename = 'books';


explain analyze select customer_id, orders.quantity
from customers
left join orders
on customers.customer_id = orders.customer_id
where quantity > 18;

explain analyze select quantity
from orders
where quantity > 18;

--index to query quantity more than 18
create index quantity_ordered_index on orders(quantity)
where quantity > 18;

explain analyze select quantity
from orders
where quantity > 18;

explain analyze select customer_id
from customers;

create index customer_idx on customers(customer_id);

explain analyze select customer_id
from customers;

cluster customers using customer_idx;

create index customer_and_book_idx
on orders(customer_id, book_id);
drop index if exists customer_and_book_idx;

create index customer_and_book_quantity_idx
on orders(customer_id, book_id,quantity);

create index author_title_idx
on books(author, title);

CREATE INDEX orders_shipping_delay_idx ON orders ((ship_date - order_date));

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;

DROP INDEX IF EXISTS books_author_idx;
DROP INDEX IF EXISTS orders_customer_id_quantity;

CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;

