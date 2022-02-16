USE publications;

---------------
-- 1️⃣ MÁXIMO -- 
---------------
select * from titles;
SELECT pub_id ,MAX(price) as max_price FROM titles -- y luego seleccionamos el pub_id y calculamos el precio máximo para cada uno de los grupos
GROUP BY pub_id; -- primero agrupamos por pub_id

---------------
-- 2️⃣ MÍNIMO -- 
---------------

SELECT pub_id ,MIN(price) as min_price FROM titles -- y luego seleccionamos el pub_id y calculamos el precio mínimo para cada uno de los grupos
GROUP BY pub_id; -- primero agrupamos por pub_id

---------------
-- 3️⃣ MEDIA -- 
---------------

SELECT pub_id ,AVG(price) as median_price FROM titles -- y luego seleccionamos el pub_id y calculamos el precio media para cada uno de los grupos
GROUP BY pub_id; -- primero agrupamos por pub_id

---------------
-- 3️⃣ SUMA -- 
---------------

SELECT pub_id ,SUM(price) as m_price FROM titles -- y luego seleccionamos el pub_id y calculamos el precio media para cada uno de los grupos
GROUP BY pub_id; -- primero agrupamos por pub_id

---------------------
-- 4️⃣ OPERACIONES -- 
---------------------

SELECT pub_id ,ROUND(MAX(price) - MIN(price), 2) as max_diferencia FROM titles -- y luego calculamos la diferencia entre el precio máximo y mínimo
GROUP BY pub_id; -- primero agrupamos por pub_id