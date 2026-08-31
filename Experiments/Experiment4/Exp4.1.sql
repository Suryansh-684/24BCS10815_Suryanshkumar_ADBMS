SELECT c1.customer_name, o1.order_date
FROM customers AS c1
LEFT JOIN orders AS o1
ON c1.customer_id = o1.customer_id
WHERE o1.customer_id IS NOT NULL;

SELECT c.customer_name, o.product_name
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;


SELECT p.product_name, o.order_date
FROM products AS p
INNER JOIN orders AS o
ON p.product_name = o.product_name;
