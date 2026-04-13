-- Return only the matching rows from the both tables 
USE MyDatabase;

SELECT 
	customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
FROM customers
INNER JOIN orders
ON customers.id =  orders.customer_id;

EXPLAIN SELECT -- Dois loops aninhados 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id =  o.customer_id;

-- Left Join returns all rows from left table and only the matchs from rigth table

SELECT * 
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.customer_id;

SELECT 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id =  o.customer_id;

-- Get all customers along whit their orders, including orders whitout matching customers ( Left Join )

SELECT 
	c.first_name,
    o.order_id
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id;

-- Return all the rows of the Both Tables, eve if there's no match

SELECT 
	c.first_name,
    o.order_id
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id

UNION -- Simula um FULL JOIN  A + B	

SELECT 
	c.first_name,
    o.order_id
FROM orders AS o
RIGHT JOIN customers AS c
ON c.id = o.customer_id;

-- Get all customers who haven't place any order

SELECT
	c.first_name,
    o.customer_id
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL; -- Simula um LEFT ANTI JOIN A - B

-- Faca o contrario B - A

SELECT *  FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL;

-- Find customers without orders and orders whitout customers [(A + B) - (A inter B)]

SELECT * FROM customers AS c
LEFT JOIN orders AS o ON c.id = o.customer_id
WHERE o.customer_id IS NULL

UNION

SELECT * FROM orders AS o
LEFT JOIN customers AS c ON c.id = o.customer_id
WHERE c.id IS NULL;

/* Get all customers along with their oreder, 
but only for customers who have placed  an oreder 
( Without using INNER JOIN)
*/

SELECT * FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;

-- Produto cartesiano  A * B  

SELECT * FROM customers CROSS JOIN orders;


-- QUANDO USAR UM OU OUTRO???

-- Only Macth ->  INNER JOIN
-- All rows and one side is more important  ->  LEFT JOIN. Both Sides is important ->  UNION
-- Only Unmatching data and one side is more important -> LEFT JOIN + WHERE id IS NULL (LEFT ANTI JOIN)
  -- Both side is important -> UNION WHERE both id IS NULL (FULL ANTI JOIN)
  
  
USE salesdb;

/* Using saledb, Retrieve a list of all orders, along with the related customer;
   Product and employs details. For each order display:
   Order ID, Customer's name, Product name, Sales Price, Sales person's name*/
  
 SELECT * FROM orders; 
  
SELECT
	o.orderid,
    c.firstname AS CustomerFirstName,
    c.lastname AS CustomerLastName,
    p.product AS ProductName,
    p.price,
    e.firstname AS EmployeedFirstName
FROM orders AS o LEFT JOIN
customers AS c ON c.customerid = o.customerid
LEFT JOIN products AS p ON o.productid = p.productid
LEFT JOIN employees AS e ON e.employeeid = o. salespersonid;



