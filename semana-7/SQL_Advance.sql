USE publications;

-- -- -- -- -- -- -- -- -- -- -- -- 
-- OTROS MÉTODOS EXPLORATORIOS --
-- -- -- -- -- -- -- -- -- -- -- -- 


-- si queremos obtener la información básica de una tabla 
DESCRIBE jobs ;


-- LENGTH Si queremos sacar la longitud de algun elemento de una columna 
SELECT au_id, LENGTH (au_id) FROM authors a ;



-- CONCAT junta varios string en una misma columna
SELECT CONCAT(au_lname, " ",  au_fname) as nombre_completo, address , state  from authors; 


-- CONCAT_WS junta varios strings con el separador que le indiquemos
SELECT CONCAT_WS(", ", address, city, state) as full_direcction from authors; 



-- GROUP_CONCAT devuelve una cadena con un valor concatenado no NULL de un grupo.
SELECT  state, GROUP_CONCAT(au_fname)  from authors a 
	GROUP BY state;


-- -- -- -- -- -- -- -- -- 
-- TRABAJANDO CON NULOS --
-- -- -- -- -- -- -- -- -- 



SELECT ISNULL(price) from titles ; -- saber cuantos nulos tenemos para la columna price


SELECT count(ISNULL(price)) as nulos_precio, -- contamos el número de nulos para la columna precio
	   count(ISNULL(type)) as nulos_tipo -- lo mismo para la columna tipo
FROM titles; -- sacar el número de nulos que tenemos para dos columnas


select *, coalesce(price, AVG(price)) from titles;

-- -- -- -- -- -- -- 
-- REGEX EN SQL --
-- -- -- -- -- -- --
SELECT * from jobs s;


SELECT * FROM jobs -- devuelveme todo de la tabla jobs todas las columnas
WHERE job_desc  LIKE "Man%"; -- donde en la columna de descripción empiece por Man"


SELECT * from jobs j 
where job_desc  REGEXP  '^Man'; -- usamos la sentencia regexp. Es exactamente lo mismo que lo anterior


SELECT * from jobs j -- seleccioname todas las columnas de la tabla jobs
WHERE job_desc LIKE  '%Manager' -- donde la columna de descripcion TERMINE en Manager 

SELECT * from jobs j 
where job_desc  REGEXP  'Manager$'; -- exactamente lo mismo que lo anterior solo que son regex

SELECT  * FROM jobs j 
WHERE job_desc REGEXP 'Mark|Man';



SELECT * FROM jobs -- devuelveme todo de la tabla jobs todas las columnas
WHERE job_desc  LIKE "%Man%"; -- donde en la columna de descripción contega la estructura "Man"


          

-- -- -- -- -- -- -- -- -- --
-- TRABAJANDO CON FECHAS --
-- -- -- -- -- -- -- -- -- --

SELECT * FROM titles t ;
SELECT * FROM sales ;

SELECT pub_id, SUM(price) from titles
	group by pub_id ; 
	

SELECT YEAR(pubdate) as years, price 
	FROM titles t; -- para sacar el año de una fecha
	
SELECT MONTH (pubdate) as months 
	FROM titles t;

-- Saquemos el precio medio de los libros por año
SELECT YEAR(pubdate), AVG(price) as precios from titles
	group by YEAR(pubdate); 

-- Pero si nos fijamos tenemos valores nulos y por lo tanto nos devuelve nulos. Que podemos hacer? 

SELECT YEAR(pubdate), AVG(price) as precios from titles
	WHERE price IS NOT NULL 
	GROUP BY YEAR (pubdate)
	
-- Porque ya no tenemos el 2014? Chequeemos que valores tenemos para este año. 
SELECT YEAR(pubdate), price from titles
	WHERE  YEAR(pubdate) =  2014;



SELECT DAYNAME(pubdate) ,  sum(qty) as cantidad, sum(price) as precio ,  (sum(t.price) * sum(s.qty)) as precio_total from titles t 
	INNER JOIN sales as s ON t.title_id = s.title_id
	GROUP BY DAYNAME(pubdate)
	ORDER BY precio_total DESC ; 



-- -- -- --
-- JOINS --
-- -- -- -- 

-- no todos los id de editoriales estan en las dos tablas, por lo tanto, cuando hagamos un left o right jo
SELECT DISTINCT pub_id FROM titles;
SELECT DISTINCT pub_id FROM publishers;

SELECT * FROM titles t    

SELECT DISTINCT p.pub_id  from titles t 
LEFT JOIN publishers p ON t.pub_id = p.pub_id -- nos devuelve los pub_id que hay en la tabla titles

SELECT DISTINCT p.pub_id  from titles t 
RIGHT JOIN publishers p ON t.pub_id = p.pub_id -- nos devuelve los pub_id que hay en la tabla titles

SELECT *  from titles t 
RIGHT JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY t.pub_id DESC  ; -- nos devuelve los pub_id que hay en la tabla titles



CREATE TEMPORARY TABLE full_join
	SELECT p.pub_id, title, `type` , price  FROM titles t
	LEFT JOIN publishers p  ON t.pub_id = p.pub_id 
	UNION
	SELECT p.pub_id, title, `type` , price as id  FROM titles t
	RIGHT JOIN publishers p  ON t.pub_id = p.pub_id 
	ORDER BY pub_id DESC 

SELECT * from full_join


-- -- -- -- -- -- -- -- -- -- -- 
-- EJERCICIOS PARA PRACTICAR --
-- -- -- -- -- -- -- -- -- -- --

-- seleccionamos el nombre y apellido de aquellos escritores que reciben un royalty mayor que el precio del libro

select CONCAT(au_fname, " ", au_fname ) as autor from titles as t
INNER JOIN titleauthor t2 ON t.title_id = t2.title_id 
INNER JOIN authors a ON t2.au_id = a.au_id 
WHERE 'algo_pasa' =  
    (CASE
        WHEN price - royalty > 0 THEN "BIEN"
        ELSE "algo_pasa"
    END);



-- ¿Cuál es el precio medio por tipo de libro para aquellos libros que tengan un royalty sea mayor que 10?


SELECT type, ROUND(AVG(price), 2) as avg_price, title, royalty 
FROM titles t
GROUP BY `type` 
HAVING royalty  > 10;


-- Cuanto ha vendido cada editorial por año?

SELECT YEAR(pubdate) as años,  pub_name , AVG(price) as precio_medio_libros from titles as t
	INNER JOIN publishers as p ON t.pub_id = p.pub_id 
	WHERE price IS NOT NULL 
	GROUP BY YEAR(pubdate), pub_name
	ORDER BY pub_name ; 


-- seleccionamos aquello libros que hayan sido vendidos por editoriales que tengan empleados que hayan sido contratados entre 1990 y 1992

select * from titles t 
where pub_id IN 
	(select DISTINCT pub_id from employee e 
	where year(hire_date) BETWEEN 1990 AND 1992);


-- selecciona aquellos libros donde de aquellas editoriales que tengan diseñadores 
select * from titles t 
WHERE pub_id IN(
	select DISTINCT e.pub_id  -- seleccionamos las editoriales que tienen diseñadores
	FROM jobs j 
	INNER JOIN employee e ON j.job_id = e.job_id 
	WHERE job_desc LIKE "%Des%")



	
	
-- -- -- -- -- --
-- FUNCIONES --
-- -- -- -- -- -- 


CREATE FUNCTION east_from_long (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');


SELECT east_from_long ("Jeancha") -- usamos la función definida previamente


