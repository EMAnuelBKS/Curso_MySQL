-- Selecione os customers que estao entre 100 e 500 pontos
USE MyDatabase;
SELECT * FROM customers WHERE score BETWEEN 100 and 500; -- score >= 100 and score <= 500

-- Retreive all customers from either Germany or USA

SELECT * FROM customers WHERE country IN ('Germany', 'USA');


-- Finde all customers whose first name  start whit "M"

SELECT * FROM customers WHERE first_name LIKE 'M%';

-- Finde all customers whose first name  contains 'R'

SELECT * FROM customers WHERE first_name LIKE '%r%';

-- Finde all customers whose first name  contains 'R' in the third position

SELECT * FROM customers WHERE first_name LIKE '__r%'

-- MUITOS DESSE FILTROS PODEM SER SUBiSTITUIDOS POR OPERADORES LOGICOS