/* ---------------------------------------------------------------------------------
 * --------------------------- DQL - Data Query Language ---------------------------
 * by Ivan Alducin
 * Base de datos: dvdrental
 */

USE dvdrental;
GO

--1. Vamos a seleccionar el nombre y apellido de los actores
SELECT first_name, last_name
FROM actor;
GO

--2. Vamos a seleccionar el nombre completo del actor en una sola columna
SELECT first_name + ' ' + last_name AS actor_completo
FROM actor;
GO

--3. Selecciona los actores que su nombre empieza con "D"
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'D%';
GO

--4. ¿Tenemos algún actor con el mismo nombre?
SELECT first_name, COUNT(*) AS cantidad
FROM actor
GROUP BY first_name
HAVING COUNT(*) > 1;
GO

--5. ¿Cuál es el costo máximo de renta de una película?
SELECT MAX(rental_rate) AS costo_maximo_renta
FROM film;
GO

--6. ¿Cuáles son las peliculas que fueron rentadas con ese costo?
SELECT title, rental_rate
FROM film
WHERE rental_rate = (
    SELECT MAX(rental_rate)
    FROM film
);
GO

--7. ¿Cuantás películas hay por el tipo de audencia (rating)?
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating
ORDER BY total_peliculas DESC;
GO

--8. Selecciona las películas que no tienen un rating R o NC-17
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'NC-17');
GO

--9. ¿Cuantos clientes hay en cada tienda?
SELECT store_id, COUNT(*) AS total_clientes
FROM customer
GROUP BY store_id
ORDER BY store_id;
GO

--10. ¿Cuál es la pelicula que mas veces se rento?
SELECT TOP 1
    f.title,
    COUNT(*) AS veces_rentada
FROM rental r
INNER JOIN inventory i
    ON r.inventory_id = i.inventory_id
INNER JOIN film f
    ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY veces_rentada DESC;
GO

--11. ¿Qué peliculas no se han rentado?
SELECT f.title
FROM film f
LEFT JOIN inventory i
    ON f.film_id = i.film_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
ORDER BY f.title;
GO

--12. ¿Qué clientes no han rentado ninguna película?
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r
    ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL
ORDER BY c.last_name, c.first_name;
GO

--13. ¿Qué actores han actuado en más de 30 películas?
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS total_peliculas
FROM actor a
INNER JOIN film_actor fa
    ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 30
ORDER BY total_peliculas DESC;
GO

--14. Muestra las ventas totales por tienda
SELECT 
    s.store_id,
    SUM(CAST(p.amount AS DECIMAL(10,2))) AS ventas_totales
FROM payment p
INNER JOIN staff st
    ON p.staff_id = st.staff_id
INNER JOIN store s
    ON st.store_id = s.store_id
GROUP BY s.store_id
ORDER BY s.store_id;
GO

--15. Muestra los clientes que rentaron una pelicula más de una vez
WITH a AS (
    SELECT
        r.customer_id,
        i.film_id,
        COUNT(*) AS veces_rentada
    FROM rental r
    INNER JOIN inventory i
        ON r.inventory_id = i.inventory_id
    GROUP BY r.customer_id, i.film_id
    HAVING COUNT(*) > 1
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    f.title,
    a.veces_rentada
FROM a
INNER JOIN customer c
    ON a.customer_id = c.customer_id
INNER JOIN film f
    ON a.film_id = f.film_id
ORDER BY c.last_name, c.first_name, a.veces_rentada DESC;
GO
