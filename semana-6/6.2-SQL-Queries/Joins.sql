-- Una cláusula JOIN se utiliza para combinar filas de dos o más tablas, basándose en una columna relacionada entre ellas.

USE publications;

-------------------
-- 1️⃣ INNER JOIN -- 
-------------------

SELECT titles.title, titles.price, titles.title_id
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id;

-------------------
-- 2️⃣ LEFT JOIN -- 
-------------------
SELECT titles.title, titles.price, titles.title_id
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id;

-------------------
-- 3️⃣ RIGHT JOIN -- 
-------------------
SELECT titles.title, titles.price, titles.title_id
FROM titles
RIGHT JOIN titleauthor ON titles.title_id = titleauthor.title_id
WHERE type = "business";


----------------------------------------------------------------
-- PODEMOS COMBINAR VARIOS JOIN SEGUIDOS, VEAMOS COMO HACERLO --
----------------------------------------------------------------

SELECT titles.title, titles.price, titles.title_id, sales.payterms, stores.city
FROM titles
INNER JOIN sales ON titles.title_id = sales.title_id
INNER JOIN stores ON sales.stor_id = stores.stor_id;
