use northwind;
-- Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base 
-- de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;
-- refinación

SELECT c.customer_id, company_name, COUNT(order_id) AS order_by_UK 
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.country = 'UK'
GROUP BY c.customer_id, c.country;

-- Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos 
-- una serie de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos 
-- ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y 
-- la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

SELECT YEAR(order_date)
FROM orders;

SELECT *
FROM orders AS o
INNER JOIN order_details AS o_d
ON o.order_id = o_d.order_id;

-- depuración join 1
SELECT o.order_id, quantity 
FROM orders AS o
INNER JOIN order_details AS o_d
ON o.order_id = o_d.order_id;

-- join 2
SELECT o.order_id, YEAR(order_date), company_name
FROM orders AS o
INNER JOIN customers AS c
ON c.customer_id = o.customer_id
GROUP BY o.order_id, c.country
HAVING country = 'UK';

-- join final
SELECT company_name, YEAR(o.order_date) AS year, COUNT(quantity) AS quantity
FROM orders AS o
INNER JOIN order_details AS o_d
	ON o.order_id = o_d.order_id
INNER JOIN customers AS c
	ON c.customer_id = o.customer_id
WHERE c.country = 'UK'
GROUP BY c.company_name, c.country, YEAR(o.order_date);

-- Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han 
-- pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. 
-- Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.
-- nombre, año, cantidad, precio

SELECT unit_price, discount, quantity, 
	(unit_price * quantity)
FROM order_details
WHERE discount > 0;







 