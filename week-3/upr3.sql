--SEMINAR #3

--MOVIES
use movies

--1
SELECT name
FROM moviestar
WHERE gender = 'F' AND name IN (SELECT name FROM movieexec WHERE networth >= 10000000)

--2
SELECT name 
FROM moviestar
WHERE name NOT IN (SELECT name FROM movieexec)

--3
SELECT title
FROM movie
WHERE length > (SELECT length FROM movie WHERE title = 'Star Wars')

--4
SELECT title, name
FROM movie JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE movieexec.networth > (SELECT networth 
							 FROM movieexec 
							 WHERE name = 'Merv Griffin')



--PC
use pc

--1
(SELECT DISTINCT maker 
FROM product JOIN pc ON product.model = pc.model
WHERE speed > 500)

--2
SELECT code, model, price
FROM printer 
WHERE price >= ALL (SELECT price FROM printer)

--3
SELECT * FROM laptop 
WHERE speed < ALL(SELECT speed FROM pc)

--4
SELECT TOP 1 model, price
FROM
(SELECT model, price FROM pc
UNION
SELECT model, price FROM printer
UNION 
SELECT model, price FROM laptop) AS products
ORDER BY price DESC

--5
SELECT maker FROM product JOIN
(SELECT TOP 1 * FROM printer WHERE color = 'y' ORDER BY price) AS color_printers 
ON product.model = color_printers.model 


--6
SELECT DISTINCT maker FROM product JOIN
(SELECT * FROM pc WHERE speed =
(SELECT TOP 1 speed FROM pc WHERE ram <= ALL (SELECT ram FROM pc) ORDER BY speed DESC)
AND ram <= ALL (SELECT ram FROM pc)) new_pc
ON product.model = new_pc.model

--SHIPS
use ships


--1
SELECT DISTINCT country
FROM classes
WHERE numguns = (SELECT TOP 1 numguns FROM classes ORDER BY numguns DESC)

--2
SELECT DISTINCT class 
FROM classes
WHERE class IN (SELECT class FROM ships JOIN outcomes ON ships.name = outcomes.ship WHERE result = 'sunk')


--3
SELECT name, class
FROM ships
WHERE class IN
(SELECT class FROM classes WHERE bore = 16)

--4
SELECT DISTINCT battle FROM outcomes WHERE battle IN
(SELECT battle FROM outcomes JOIN ships ON outcomes.ship = ships.name WHERE class = 'Kongo')

--5
SELECT c.class, s.name
FROM ships s
JOIN classes c ON s.class = c.class
WHERE c.numguns >= ALL (SELECT c2.numguns FROM classes c2 WHERE c2.bore = c.bore)



