/* Numero de colunas e os tipos devem ser iguais das query's combinadas
   pelos operadores. EX: 1 coluna INT obriga que  1 coluna da segunda 
   query tambem seja INT. Os nomes das colunas da primeira query definem
   os nomes da tabela resultante */
   
SELECT 
	firstname,
    lastname
FROM salesdb.customers;

-- EXCEPT  returns the unique rows in 1st table that not in 2nd table (A - B)
-- UNION ALL N remove duplicatas
-- INTERSECT retunr only the rows who are in the both tables

SELECT 
	firstname,
    lastname
FROM salesdb.employees;


/* Orders data are stored in separte tables (Orderes and OrdersArchive)
   Combine all data into one report whitout duplicates*/

SELECT 
	'Orders' AS SourceTable,
	orders.orderid,
    orders.productid,
    orders.customerid,
    orders.salespersonid,
    orders.orderdate,
    orders.shipdate,
    orders.orderstatus,
    orders.shipaddress,
    orders.billaddress,
    orders.quantity,
    orders.sales,
    orders.creationtime 
FROM salesdb.orders 

UNION

SELECT 
	'Orders_Archive' AS SourceTable, -- informa a fonte das linhas apos a uniao 
	orders_archive.orderid,
    orders_archive.productid,
    orders_archive.customerid,
    orders_archive.salespersonid,
    orders_archive.orderdate,
    orders_archive.shipdate,
    orders_archive.orderstatus,
    orders_archive.shipaddress,
    orders_archive.billaddress,
    orders_archive.quantity,
    orders_archive.sales,
    orders_archive.creationtime 
FROM salesdb.orders_archive
ORDER BY orderid

