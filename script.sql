SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_Indexes
WHERE tablename = 'customers'
OR tablename = 'books'
OR tablename = 'orders';

EXPLAIN ANALYZE SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

CREATE INDEX orders_customer_id_quantity_greater_than_18 ON orders(customer_id, quantity)
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT * FROM customers
WHERE customer_id < 10000;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT * FROM customers
WHERE customer_id < 10000;

SELECT * FROM customers
LIMIT 10;

CLUSTER customers USING customers_pkey;

SELECT * FROM customers
LIMIT 10;

CREATE INDEX orders_customer_id_book_id_idx ON orders(customer_id, book_id);

DROP INDEX IF EXISTS orders_customer_id_book_id_idx;

EXPLAIN ANALYZE SELECT customer_id, book_id, quantity
FROM orders
WHERE customer_id < 10000;

CREATE INDEX orders_customer_id_book_id_quantity_idx ON orders(customer_id, book_id, quantity);

EXPLAIN ANALYZE SELECT customer_id, book_id, quantity
FROM orders
WHERE customer_id < 10000;

CREATE INDEX books_author_title_idx ON books(author, title);

SELECT * FROM pg_Indexes
WHERE tablename = 'books';

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;

CREATE INDEX orders_product_quantity_price_base_above_100_idx ON orders(quantity, price_base)
WHERE quantity * price_base > 100;

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;





