USE northwind;

-- 1. Ciudades que empiezan con "A" o "B".
-- Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias 
-- que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, 
-- el nombre de la compañia y el nombre de contacto.

SELECT city, company_name, contact_name
	FROM customers
	WHERE city LIKE "A%" OR city LIKE "B%";
    
-- 2. En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior 
-- el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".

SELECT c.city, c.company_name, c.contact_name, COUNT(o.order_id) AS total_orders
	FROM customers AS c
    INNER JOIN orders AS o ON c.customer_id = o.customer_id
    WHERE city LIKE "L%"
    GROUP BY c.city, c.customer_id;

-- Todos los clientes cuyo "country" no incluya "USA". Nuestro objetivo es extraer 
-- los clientes que no sean de USA. Extraer el nombre de contacto, su pais y el nombre de la compañia.

SELECT company_name, contact_name, country
FROM customers
WHERE country NOT IN ("USA");

-- Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto.

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE "_A%";

-- HOLA!!!!
SELECT "HOLA" AS tipo_nombre, contact_name, "Ya es Navidad!!"  AS mensaje
FROM customers
WHERE contact_name NOT LIKE "_A%";




