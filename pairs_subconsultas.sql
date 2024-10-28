use northwind;
-- max order_date para un empleado
SELECT *
FROM orders;

SELECT MAX(order_date)
	FROM orders 
    WHERE employee_id = 5;

SELECT order_id,employee_id, order_date 
	FROM orders AS o1
    WHERE order_date = (SELECT MAX(order_date)
						FROM orders AS o2
						WHERE o1.employee_id = o2.employee_id);
                        
-- Extraed el precio unitario máximo (unit_price) de cada producto vendido.
-- Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y 
-- su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.

SELECT MAX(unit_price)
	FROM products;

SELECT product_id, unit_price AS max_unit_price_sold
	FROM products AS p1
	WHERE unit_price = (SELECT MAX(unit_price)
						FROM products AS p2
                        WHERE p1.product_id = p2.product_id
                        );

-- En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto.
-- En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del 
-- producto y su ID de categoría.

SELECT category_id
FROM categories
WHERE category_name = 'beverages';

SELECT product_id, product_name
FROM products
WHERE category_id = 1;

SELECT product_id, product_name, category_id
		FROM products
		WHERE category_id IN (SELECT category_id
									FROM categories
									WHERE category_name = 'beverages');

-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
-- Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría 
-- dirigirse a estos países para buscar proveedores adicionales.

SELECT DISTINCT country
FROM customers;

SELECT DISTINCT country
FROM suppliers;

SELECT DISTINCT country
FROM customers 
WHERE country NOT IN (SELECT DISTINCT country
						FROM suppliers);

-- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread" 
-- Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto 
-- "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

SELECT customer_id, order_id
FROM orders;

SELECT product_id
FROM order_details
WHERE product_id = 6 >
