use movies

-- MOVIES

SELECT * FROM studio
SELECT * FROM moviestar
SELECT * FROM starsin
SELECT * FROM movieexec

--1
SELECT address
FROM studio
WHERE name = 'Disney'

--2
SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson'


--3
SELECT starname
FROM starsin
WHERE movieyear = 1980
OR movietitle LIKE '%knight%'


--4
SELECT name
FROM movieexec
WHERE networth > 10000000 


--5
SELECT name
FROM moviestar
WHERE gender = 'M'
OR address = 'Prefect Rd.'


-- PC

--1
SELECT model, speed as MHz, hd as GB
FROM pc
WHERE price <= 1200


--2
SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'


--3
SELECT model, ram, screen
FROM laptop
WHERE price >= 1000



--4
SELECT * FROM printer
WHERE color = 'y'



--5
SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' OR cd = '16x') 
AND price < 2000


use ships

-- SHIPS

SELECT * FROM outcomes

--1
SELECT class, country
FROM classes
WHERE numguns < 10

--2
SELECT name as shipname 
FROM ships
WHERE launched < 1918


--3
SELECT ship
FROM outcomes
WHERE result = 'sunk'


--4
SELECT name 
FROM ships
WHERE name = class


--5
SELECT name
FROM ships
WHERE name LIKE 'r%'


--6
SELECT name
FROM ships
WHERE name LIKE '% %'