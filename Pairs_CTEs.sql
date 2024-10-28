USE northwind;

/* 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente 
y el nombre de la compañia de la tabla Customers.
*/

WITH clientes AS (
	SELECT customer_id, company_name
    FROM customers
    )

SELECT *
FROM clientes;

/* 2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, 
pero solo queremos los que pertezcan a "Germany".
*/

WITH clientes AS (
	SELECT customer_id, company_name
    FROM customers
    WHERE country = "Germany"
    )

SELECT *
FROM clientes;


/* 3. Extraed el id de las facturas y su fecha de cada cliente. En este caso queremos extraer 
todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
NOTA: En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name)
*/

WITH facturas_clientes AS (
	SELECT c.customer_id, company_name, order_id, order_date
    FROM customers AS c 
    INNER JOIN orders AS o ON c.customer_id = o.customer_id
    )

SELECT *
FROM facturas_clientes;

/* 4. Contad el número de facturas por cliente. Mejoremos la query anterior. 
En este caso queremos saber el número de facturas emitidas por cada cliente.
*/

WITH facturas_clientes AS (
	SELECT c.customer_id, company_name, COUNT(order_id) AS total_orders
    FROM orders AS o
    INNER JOIN customers AS c ON o.customer_id = c.customer_id
    GROUP BY customer_id, company_name
    )

SELECT *
FROM facturas_clientes;

/* 5. 
Cuál la cantidad media pedida de todos los productos ProductID. Necesitaréis extraer la suma de las 
cantidades por cada producto y calcular la media.
*/

WITH media_stock AS (
	SELECT od.product_id, SUM(od.quantity) AS cantidad_total
    FROM order_details AS od
    GROUP BY od.product_id
    )
SELECT p.product_name, AVG(cantidad_total) AS media
FROM media_stock AS ms
JOIN products AS p ON ms.product_id = p.product_id
GROUP BY p.product_name;










