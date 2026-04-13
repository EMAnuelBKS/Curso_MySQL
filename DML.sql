INSERT INTO customers (id, first_name, country, score) 
VALUES 
	(6, 'Anna', 'USA', NULL), -- Must be in the same order and types
    (7, 'Sam', NULL, 100),
    (9,'Andreas', 'Germany', NULL);

INSERT INTO customers(id, first_name)
VALUES (10, 'Sara');



-- Insert data from customers into persons

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
	id,
    first_name,
    NULL,
    'Unknown'
FROM customers;	


-- UPDATE table_name SET column1 = value1 WHERE <condition>

UPDATE customers 
SET score = 0 
WHERE id = 6;

UPDATE customers 
SET 
	country = 'UK', 
    score = 0 
WHERE id =10;

--  Update all  customers whit NULL score by setting their score to 0

UPDATE customers
SET score = 0
WHERE score IS NULL;

-- DELET FROM table_name WHERE <condition>

DELETE FROM customers WHERE id > 5;

-- DELETE ALL DATA FROM THE TABLE person
TRUNCATE table persons;
DROP TABLE persons

/* Creat a new table called persons
with columns: id, person_name, birth_date, and phone */

CREATE TABLE persons (
-- column Name, Data Type, Constraint
	id INT NOT NULL, 
	person_name VARCHAR(51) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
);

-- Add a email column  to the persons table

ALTER TABLE persons 
ADD email VARCHAR(51) NOT NULL;

-- Remove de column phone  from the persons table

ALTER TABLE persons
DROP COLUMN email;

-- DROP the  table persons from de the Database 

DROP TABLE persons 