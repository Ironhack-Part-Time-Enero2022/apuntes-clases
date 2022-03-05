USE publications;


-- Challenge 1 - Most Profiting Authors

-- Paso 1. Tenemos que calcular las ROYALTIES PARA CADA UNA DE LAS VENTAS Y CADA AUTOR. Nos dejan la fórmula en el readme. 

SELECT t.title_id, t2.au_id, t.title, t.advance , s.qty, t.price, t2.royaltyper, (t.price * s.qty * t.royalty / 100 * t2.royaltyper / 100) as ROYALTIES 
FROM titles t 
INNER JOIN sales s ON t.title_id = s.title_id 
INNER JOIN titleauthor t2 ON s.title_id = t2.title_id 
ORDER BY title, au_id 

-- Si nos fijamos en el output tenemos varios títulos. Como nos dicen es porque cada libro se ha podido vender varias veces. 


-- Paso 2. Tenemos que agrupar las ROYALTIES por cada título y autor. 

SELECT title_id, au_id ,title, advance, sum(ROYALTIES) as ROYALTIES  FROM (
		SELECT t.title_id, t2.au_id, t.title, t.advance , s.qty, t.price, t2.royaltyper, (t.price * s.qty * t.royalty / 100 * t2.royaltyper / 100) as ROYALTIES 
			FROM titles t 
			INNER JOIN sales s ON t.title_id = s.title_id 
			INNER JOIN titleauthor t2 ON s.title_id = t2.title_id 
			ORDER BY title, au_id 
								) as tmp 
	GROUP BY title_id, au_id;
		
-- Paso 3. Calcula los beneficios para cada autor. 


SELECT au_id , sum(ROYALTIES + advance) FROM(
SELECT title_id, au_id ,title, advance, sum(ROYALTIES) as ROYALTIES  FROM (
		SELECT t.title_id, t2.au_id, t.title, t.advance , s.qty, t.price, t2.royaltyper, (t.price * s.qty * t.royalty / 100 * t2.royaltyper / 100) as ROYALTIES 
			FROM titles t 
			INNER JOIN sales s ON t.title_id = s.title_id 
			INNER JOIN titleauthor t2 ON s.title_id = t2.title_id 
			ORDER BY title, au_id 
								) as tmp 
	GROUP BY title_id, au_id) as tmp2
GROUP BY au_id ;
	
-- Challenge 2. El mismo que el anterior pero con tablas temporales

DROP TEMPORARY TABLE IF EXISTS temp1;

CREATE TEMPORARY TABLE temp1
SELECT t.title_id, t2.au_id, t.title, t.advance , s.qty, t.price, t2.royaltyper, (t.price * s.qty * t.royalty / 100 * t2.royaltyper / 100) as ROYALTIES 
FROM titles t 
INNER JOIN sales s ON t.title_id = s.title_id 
INNER JOIN titleauthor t2 ON s.title_id = t2.title_id 
ORDER BY title, au_id 



DROP TEMPORARY TABLE IF EXISTS temp2;

CREATE TEMPORARY TABLE temp2
SELECT  au_id, title_id , sum(ROYALTIES) as ROYALTIES
FROM temp1 
GROUP BY au_id, title_id ;

SELECT * FROM temp2;


SELECT  t2.au_id,  sum(t1.advance + t2.ROYALTIES) as PROFITS 
FROM temp2 t2
INNER JOIN temp1 as t1 ON t2.au_id  = t1.au_id 
GROUP BY t2.au_id 
ORDER BY PROFITS 
LIMIT 3;








-- -- -- -- -- -- -- -- -- -- -- 
-- EJERCICIOS PARA PRACTICAR --
-- -- -- -- -- -- -- -- -- -- --

 -- Selecciona los libros que hayan sido publicados entre el 1990 y 2000 y que cuesten mas de 10
select * from titles
where (YEAR(pubdate) BETWEEN 1990 AND 2000) AND price > 10 ;


-- ¿Por qué está mal esta query?


SELECT ROUND(AVG(price), 2) as avg_price , title, royalty 
FROM titles t
GROUP BY title_id 
WHERE royalty  > 10;


-- Cuáles son los libros más vendidos por tienda?

SELECT stor_name ,  t.title, sum(qty) AS ventas FROM stores s
INNER JOIN sales s2 ON s.stor_id = s2.stor_id 
INNER JOIN titles t ON s2.title_id  = t.title_id 
GROUP BY stor_name, t.title_id 
ORDER BY stor_name , ventas DESC;


-- En base a la query anterior selecciona las tiendas (que no se repitan!) que vendieron mas de 30 items. Usa una SUBQUERY o una TABLA TEMPORAL

SELECT DISTINCT (stor_name ), ventas FROM (
	SELECT stor_name ,  t.title, sum(qty) AS ventas FROM stores s
	INNER JOIN sales s2 ON s.stor_id = s2.stor_id 
	INNER JOIN titles t ON s2.title_id  = t.title_id 
	GROUP BY stor_name, t.title_id 
	ORDER BY stor_name , ventas DESC)as tiendas
WHERE ventas > 30;


-- Selecciona el nombre y apellido de aquellos escritores que reciben un royalty mayor que el precio del libro

select CONCAT(au_fname, " ", au_fname ) as autor from titles as t
INNER JOIN titleauthor t2 ON t.title_id = t2.title_id 
INNER JOIN authors a ON t2.au_id = a.au_id 
WHERE 'algo_pasa' =  
    (CASE
        WHEN price - royalty > 0 THEN "BIEN"
        ELSE "algo_pasa"
    END);




-- Calcula los libros y su cantidad vendidos por factura y tienda
   

SELECT stor_name , libros/orders  as avglibros, qty/orders as avgqty FROM 
(SELECT stor_name, sum(qty) as qty, count(distinct ord_num) as orders , count(t.title_id)  as libros
FROM sales s 
INNER JOIN titles t ON s.title_id = t.title_id 
INNER JOIN stores st ON s.stor_id = st.stor_id 
GROUP BY stor_name) as average;







