SELECT * FROM customers
order by customer_id;

CREATE TRIGGER update_trigger
BEFORE UPDATE ON customers
FOR EACH ROW
EXECUTE PROCEDURE log_customers_change();

UPDATE customers
set first_name = 'Samuel'
where customer_id = 1;

SELECT * FROM customers
order by customer_id;

select * from customers_log;

CREATE TRIGGER customer_insert
AFTER INSERT ON customers
FOR EACH STATEMENT
EXECUTE PROCEDURE log_customers_change();

INSERT INTO customers(first_name, last_name,email_address,home_phone,city,state_name,years_old)
VALUES('Jeffrey','Cook','Jeffrey.Cook@example.com','202-555-0398','Jersey city','New Jersey',66);

select * from customers
order by customer_id;

select * from customers_log;

CREATE TRIGGER customer_min_age
BEFORE UPDATE ON customers
FOR EACH ROW
WHEN(NEW.years_old < 13)
EXECUTE PROCEDURE override_with_min_age();

UPDATE customers
SET years_old = 12
WHERE first_name = 'Campbell';
 
UPDATE customers
SET years_old = 24
WHERE last_name = 'Cook';
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

drop trigger customer_min_age on customers;

