-- HW2.sql -- Homework 2
--
-- Clemens Lee
-- UT EID: czl67, UTCS username: czl
-- C S 347, Fall 2014, Dr. P. Cannata
-- Department of Computer Science, The University of Texas at Austin
--
 
-- 4-01
SELECT c.category_name, p.product_name, p.list_price
FROM categories c, products p
WHERE c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

-- 4-02
SELECT first_name, last_name, line1, city, state, zip_code
FROM(
  SELECT c.first_name, c.last_name, c.email_address, a.line1, a.city, a.state, a.zip_code
  FROM customers c, addresses a
  WHERE c.customer_id = a.customer_id AND c.email_address = 'allan.sherwood@yahoo.com'
);

-- 4-03
SELECT first_name, last_name, line1, city, state, zip_code
FROM (
  SELECT c.*, a.*
  FROM customers c, addresses a
  WHERE c.SHIPPING_ADDRESS_ID = a.address_id AND c.customer_id = a.customer_id
);

-- 4-04
SELECT last_name, first_name, order_date, product_name, item_price, 
  discount_amount, quantity
FROM (
  SELECT c.*, o.*, oi.*, p.*
  FROM customers c, orders o, order_items oi, products p
  WHERE c.customer_id = o.customer_id AND o.order_id = oi.order_id
    AND oi.product_id = p.product_id
)
ORDER BY last_name, order_date, product_name;

-- 4-05
SELECT a.product_name, a.list_price
FROM products a, products b
WHERE a.list_price = b.list_price AND a.product_name <> b.product_name
ORDER BY a.product_name;

-- 4-06
SELECT c.category_name, p.product_id
FROM categories c 
FULL OUTER JOIN products p
ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

-- 4-07
SELECT 'SHIPPED' as ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED' as ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;

--- self note, please ignore for grading ---
-- another way to do 07
--SELECT order_id, order_date,
--  CASE WHEN ship_date IS NULL
--    THEN 'NOT SHIPPED'
--    ELSE 'SHIPPED'
--  END AS ship_status
--FROM orders
--ORDER BY order_date;