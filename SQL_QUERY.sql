USE MyDatabase;

/* 
SELECT 
DISTINCT
FROM
LIMIT
WHERE
GROUP BY
HAVING 
ORDER BY
*/

SELECT 
	first_name,
    score
FROM customers;

SELECT 
	first_name,
    score,
    country
FROM customers
WHERE score != 0 AND country = 'USA';	

-- ORDER BY

SELECT * FROM customers ORDER BY country ASC, score DESC;

-- GROUP BY, Faz um samash
-- Encontrando a pontuacao total e o total de coustomers por country

SELECT 
	country,
    SUM(score) AS total_pontos,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country;

-- HAVING, usado apenas com GROUP BY. Diferente do WHERE, o HAVING filtra apos a agregacao \
/* Find avarage score for each country considering  only customers  with a score not equal to 0
and return only  those  countries whit an avarage score greater than  430 */

SELECT 
	country,
    AVG(score) AS pontuacao_media
FROM customers
WHERE score != 0
GROUP BY country
HAVING pontuacao_media > 430;

-- DISTINCT, remove duplicatas ( operacao cara )
-- Return Unique list of all countries

SELECT DISTINCT
	country 
FROM customers;

-- LIMIT, restringe o numero de linhas retornadas
-- Retrive  the top 3 Customers whit the highest Scores

SELECT *
FROM customers
ORDER BY score desc
LIMIT 3;

-- Get the Two Most Recent Orders
SELECT * FROM orders ORDER BY order_date DESC LIMIT 2;

-- Valores estaticos

select 123 as static_number;

-- adicino um coluna vinda de mim, chamada customer_type e com valor 'New Customers'

EXPLAIN SELECT
	id,
    first_name,
	'New Customers' AS custumer_type 
FROM customers
WHERE country = 'USA'	


