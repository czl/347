-- HW1.sql -- Homework 1
--
-- Clemens Lee
-- UT EID: czl67, UTCS username: czl
-- C S 347, Fall 2014, Dr. P. Cannata
-- Department of Computer Science, The University of Texas at Austin
--
 
-- 3-01
SELECT product_code, product_name, list_price, discount_percent 
FROM PRODUCTS
ORDER BY list_price DESC;

-- 3-02
SELECT last_name ||', '|| first_name 
AS full_name 
FROM CUSTOMERS
WHERE last_name > 'M';

-- 3-03
SELECT product_name, list_price, date_added
FROM PRODUCTS
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- 3-04
SELECT product_name, list_price, discount_percent, 
list_price*discount_percent*0.01 AS discount_amount, 
(100-discount_percent)*0.01*list_price AS discount_price
FROM PRODUCTS
WHERE ROWNUM < 6
ORDER BY discount_price DESC;

-- 3-05
SELECT * FROM(
  SELECT item_id, item_price, discount_amount, quantity,
  item_price * quantity AS price_total,
  discount_amount * quantity AS discount_total,
  (item_price - discount_amount) * quantity AS item_total
  FROM ORDER_ITEMS
)
WHERE price_total > 500
ORDER BY item_total DESC;

-- 3-06
SELECT order_id, order_date, ship_date
FROM ORDERS
WHERE ship_date is Null;

-- 3-07
SELECT SYSDATE as today_unformatted, TO_CHAR(SYSDATE, 'MM-DD-YYY') as today_formatted
FROM DUAL;

-- 3-08
SELECT price, tax_amount, price+tax_amount as total
FROM (
  SELECT price, tax_rate, price*tax_rate as tax_amount 
  FROM (
    SELECT 100 as price, 0.07 as tax_rate
    FROM DUAL
  )
  );