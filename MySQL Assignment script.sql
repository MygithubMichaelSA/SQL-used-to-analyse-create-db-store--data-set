#Query 1
USE sql_store;
SELECT * FROM customers
-- WHERE CUSTOMER_ID=1
ORDER BY first_name;

#Query 2
SELECT last_name, first_name, points, points + 10 FROM customers;

#Query 3
SELECT last_name, first_name, points, (points*10)+100 FROM customers;
SELECT last_name, first_name, points, (points+10)*100 AS discount_factor FROM customers;

#Query 4
SELECT * FROM products;
SELECT name, unit_price, (unit_price*1.1) AS new_price FROM products;

#Query 5
SELECT * FROM customers
WHERE birth_date > '1990-01-01';

-- I then went to the Database tab, and selected the 'Reverse Engineer' option, to follow the steps to create an EER diagram.

#Additional Queries
SELECT * FROM customers
WHERE customer_id < '10'
AND first_name LIKE 'I%'
AND last_name LIKE '%s%'
AND birth_date < '1994-02-01'
AND state LIKE '%a%'
AND points < '2000';

SELECT Customers.first_name, Customers.last_name, Orders.order_id, Orders.order_date, Orders.shipped_date FROM customers
JOIN orders
ON orders.customer_id = customers.customer_id
ORDER BY first_name ASC
LIMIT 4;

SELECT Customers.first_name, Customers.last_name, Orders.order_id, Orders.order_date, Orders.shipped_date FROM customers
JOIN orders
ON orders.customer_id = customers.customer_id
WHERE last_name LIKE 'B%' OR last_name LIKE 'M%';

SELECT Customers.first_name, Customers.last_name, Orders.order_id, Orders.order_date, Orders.shipped_date FROM customers
JOIN orders
ON orders.customer_id = customers.customer_id
ORDER BY order_date DESC;

SELECT orders.customer_id, orders.order_date, orders.shipped_date, order_items.quantity, order_items.unit_price FROM order_items
JOIN orders
ON orders.order_id = order_items.order_id
ORDER BY unit_price DESC
LIMIT 6;

SELECT orders.customer_id, orders.order_date, orders.shipped_date, order_items.quantity, order_items.unit_price FROM order_items
JOIN orders
ON orders.order_id = order_items.order_id
WHERE quantity > '5';

SELECT orders.customer_id, orders.order_date, orders.shipped_date, order_items.quantity, order_items.unit_price FROM order_items
JOIN orders
ON orders.order_id = order_items.order_id
ORDER BY customer_id ASC
LIMIT 5;

SELECT orders.order_id, orders.customer_id, orders.order_date, orders.shipped_date, order_statuses.name FROM order_statuses
JOIN orders
ON orders.status = order_statuses.order_status_id
WHERE order_date > '2017-12-31';

SELECT COUNT(name) AS num_name FROM products;
SELECT SUM(unit_price), MAX(unit_price), MIN(unit_price), AVG(unit_price) FROM products;
SELECT COUNT(customer_id) AS num_customers FROM customers;
SELECT * FROM customers WHERE phone LIKE '4%';

#Primary and Foreign keys
- Customers table:
-- The primary key for the Customers table is customer_id, which is an integer entity.
-- This means it can only accept whole number values (depending on its precision).
-- Also there is no foreign key for the Customers table, as it has a one-to-many relationship with the Orders table.
-- This means that entities are being borrowed by other tables, from this table, instead of this table borrowing entities from other tables.

- Products table:
-- The primary key for this table is product_id.
-- This is an integer entity which means it can only accept whole number values (depending on its precision).
-- There is no foreign key for this table, as it has a one-to-many relationship with other tables (order_items and order_item_notes).
-- This means that entities are being borrowed by other tables, from this table, instead of this table borrowing entities from other tables.

- shippers table:
-- The primary key for this table is shipper_id.
-- This entity has a SMALLINT datatype, meaning it can only take small whole number values that are positive or negative (range from -32k to 32k).
-- There is no foreign key for the shippers table, as it has a one-to-many relationship with the Orders table.
-- This means that entities are being borrowed by other tables, from this table, instead of this table borrowing entities from other tables.

- orders table:
-- The primary key for the Orders table is order_id, which is an integer entity.
-- With regards to the foreign key(s), one of the foreign keys in this table is customer_id. This is because it is a borrowed entity from the Customers table.
-- The other foreign key is status. This is because this is a borrowed entity from the order_statuses table. 
-- This has a TINYINT datatype which means it can take a maximum of 255 string values.

- order_items table:
-- The primary key for this table is item_id, which is an integer entity, meaning it can only accept whole number values (depending on its precision).
-- With regards to the foreign key(s), one of the foreign keys in this table is order_id. This is because it is a borrowed entity from the Orders table.
-- This is an integer entity which means it can only accept whole number values (depending on its precision).
-- The other foreign key is product_id. This is because it is a borrowed entity from the products table.
-- This is also an integer entity which means it can only accept whole number values (depending on its precision).

- order_items_notes table:
-- The primary key for this table is note_id, which is an integer entity, meaning it can only accept whole number values (depending on its precision).
-- With regards to the foreign key(s), one of the foreign keys in this table is order_id. This is because it is a borrowed entity from the Orders table.
-- This is an integer entity which means it can only accept whole number values (depending on its precision).
-- The other foreign key is product_id. This is because it is a borrowed entity from the products table.
-- This is also an integer entity which means it can only accept whole number values (depending on its precision).

- order_statuses table:
-- The primary key for this table is order_status_id.
-- This entity has a TINYINT datatype, which means it can take a maximum of 255 string values.
-- There is no foreign key for the order_statuses table, as it has a one-to-many relationship with the Orders table.
-- This means that entities are being borrowed by other tables, from this table, instead of this table borrowing entities from other tables.
