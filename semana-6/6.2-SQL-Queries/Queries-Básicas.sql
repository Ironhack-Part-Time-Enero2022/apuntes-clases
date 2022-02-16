-- Antes de empezar seleccionamos la BBDD con la que trabajaremos
USE publications;

------------------------------
-- 1️⃣ SELECCIÓN DE COLUMNAS -- 
------------------------------

SELECT * FROM titles; -- seleccionamos todas las columnas de una tabla

SELECT pub_id, title, price FROM titles; -- selecionamos solo la columna pub_id title y price de la tabla titles

SELECT pub_name, country FROM publishers; -- seleccionamos solo la columna pub_name y country de la tabla publishers

-------------------------
-- ️2️⃣ VALORES ÚNICOS -- 
-------------------------


SELECT DISTINCT pub_name FROM publishers -- obtenemos todos los valores distintos para la columna pub_name 
LIMIT 3; -- limitamos los resultados a tres

-- o todos los autores
SELECT DISTINCT au_lname from authors;

----------------------------
-- ️3️⃣️ ORDENAR RESULTADOS -- 
----------------------------

-- 📌 En el caso de string nos ordena en orden alfabético (de A a Z)
SELECT DISTINCT au_lname FROM authors
ORDER BY au_lname; -- nos devuelve únicamente los nombres de los autores ordenados alfabeticamente. 

-- En caso de que lo queramos de la Z-A
SELECT DISTINCT au_lname FROM authors
ORDER BY au_lname DESC;

-- 📌 En el caso de variables numéricas, por defecto ordena de mayor a menor:
SELECT * FROM titles
ORDER BY price;

-- Para ordenar en sentido decreciente
SELECT * FROM titles
ORDER BY price DESC;

-- 🤔 Y si lo quisieramos hacer sobre varias columnas?

SELECT * FROM authors
ORDER BY au_lname, au_fname;

------------------
-- ️4️⃣ CONTAR -- 
------------------
-- ¿Y si quisieramos saber el número de editores o escritores?

SELECT COUNT(DISTINCT pub_name) FROM publishers; -- nos devuelve el número de editores distintos que tenemos en la BBDD

SELECT COUNT(DISTINCT au_lname) from authors;

SELECT COUNT(au_lname) FROM AUTHORS; -- ⚠️ Sin el DISTINCT nos devolvera el número de filas con datos que tenemos en nuestra tabla para la columna especificada

------------------
-- ️5️⃣️ GROUP BY -- 
------------------

SELECT type, COUNT(title_id) from titles -- y luego nos devuelve solo la columna tipo y el conteo para cada grupo
GROUP BY type; -- agrupamos por tipo de libro

select pub_id, COUNT(title_id) as num_autores FROM titles -- nos devuelve el id del editor y el número 
GROUP BY pub_id; -- ordenamos por editor


select pub_id, COUNT(title_id) as num_autores FROM titles -- nos devuelve el id del editor y el número 
GROUP BY pub_id;
