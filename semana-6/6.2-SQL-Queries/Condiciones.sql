USE publications;

------------------------------------
-- 1️⃣ SELECCIÓN POR UNA CONDICIÓN -- 
------------------------------------
SELECT * FROM titles;

SELECT title FROM titles -- seleccionamos solo el título de la tabla títulos
WHERE price > 15.000; -- pero solo nos devolverá los que el precio sea mayor a 15.000

SELECT title FROM titles -- seleccionamos solo el título de la tabla títulos
WHERE type = "business"; -- solo aquellos libros que sean de tipo "business"

-------------------------------------------
-- 2️⃣ SELECCIÓN POR MAS DE UNA CONDICIÓN -- 
--    OPERADORES OR, AND, IN Y NOT IN    --
-------------------------------------------

SELECT title FROM titles
WHERE price > 15.000 AND type='business'; -- solo aquellos libros que valgan más de 15.000 y sean de tipo "business"


SELECT title FROM titles
WHERE price > 15.000 OR type='business';  -- solo aquellos libros que valgan más de 15.000 o sean del tipo "business"


SELECT title, type FROM titles
WHERE type IN ("mod_cook" , "business"); -- aquellos libros que sean de tipo "mad_cook" y "business"

SELECT title, type FROM titles
WHERE type NOT IN ("mod_cook" , "business"); -- el opuesto al anterior


----------------
-- 6️⃣️ HAVING -- 
----------------

SELECT COUNT(title_id), type
FROM titles
GROUP BY type
HAVING COUNT(type) > 3;

----------------
-- 7️⃣ BETWEEN -- 
----------------
SELECT * FROM titles
WHERE price BETWEEN 10.0000 AND 20.0000 ;

