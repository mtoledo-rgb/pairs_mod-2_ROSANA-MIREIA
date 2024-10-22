USE northwind;

SELECT MAX(unit_price) AS highest_price, MIN(unit_price) AS lowest_price
	FROM products;
    
SELECT COUNT(product_id) AS numero_productos, AVG(unit_price) AS precio_medio
	FROM products;
    
SELECT MAX(freight) AS max_freight, MIN(freight) AS min_freight
	FROM orders
    WHERE ship_country = 'UK';
    
SELECT product_id, unit_price 
	FROM products
    WHERE unit_price > 28.87
    ORDER BY unit_price DESC;
    
SELECT COUNT(product_id) AS discontinuedCount 
	FROM products 
	WHERE Discontinued = 1;

SELECT product_id, product_name 
	FROM products 
	WHERE discontinued = 0 
	ORDER BY product_id DESC 
	LIMIT 10;

SELECT employee_id, MAX(freight) AS carga_maxima, COUNT(order_id)
	FROM orders
	GROUP BY employee_id;

SELECT  employee_id, MAX(freight) AS carga_maxima, COUNT(order_id)
	FROM orders
    GROUP BY employee_id
    HAVING shipped_date = 1
	ORDER BY employee_id DESC;


