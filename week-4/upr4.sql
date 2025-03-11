use movies

--MOVIES
--1
SELECT title, name 
FROM movie JOIN movieexec ON producerc# = cert# 
WHERE name = (SELECT name FROM movieexec JOIN movie ON producerc# = cert# WHERE movie.title = 'Star Wars')



--2
SELECT DISTINCT name
FROM (movieexec exec1 JOIN movie m1 ON cert# = producerc#)
JOIN starsin s1 ON title = movietitle AND year = movieyear
WHERE starname = 'Harrison Ford'


--3
SELECT DISTINCT sm.studioname, starname FROM 
starsin JOIN
(SELECT * 
FROM studio JOIN movie ON studio.name = movie.studioname) AS sm
ON starsin.movietitle = sm.title
ORDER BY sm.studioname


--4
SELECT starname, networth, title
FROM starsin JOIN movie ON starsin.movietitle = movie.title
JOIN movieexec ON movieexec.cert# = producerc#
WHERE networth >= ALL (SELECT networth FROM movieexec)


--5
SELECT name, movietitle 
FROM moviestar LEFT JOIN starsin 
ON name = starname
WHERE movietitle IS NULL




use pc
--PC
--1
SELECT * FROM product
WHERE model NOT IN
((SELECT model FROM pc)
UNION
(SELECT model FROM printer)
UNION
(SELECT model FROM laptop))

--2
SELECT DISTINCT p1.maker
FROM product p1 JOIN laptop ON p1.model = laptop.model
JOIN product p2 ON  p1.maker = p2.maker JOIN printer
ON p2.model = printer.model


--3
SELECT DISTINCT l1.hd FROM laptop l1 JOIN
laptop l2 ON l1.hd = l2.hd AND l1.code != l2.code 


--4
SELECT * FROM pc 
LEFT JOIN product ON pc.model = product.model
WHERE product.maker IS NULL


use ships
--SHIPS
--1
SELECT * FROM
ships JOIN classes ON ships.class = classes.class


--2
SELECT * FROM
ships RIGHT JOIN classes ON ships.class = classes.class
WHERE ships.name IS NULL OR classes.class IN (SELECT name FROM ships)


--3
SELECT country FROM classes
JOIN ships ON ships.class = classes.class
LEFT JOIN outcomes ON ships.name = outcomes.ship
WHERE outcomes.ship IS NULL
ORDER BY country


--4
SELECT name AS 'Ship Name' FROM ships
JOIN classes ON ships.class = classes.class
WHERE numguns >= 7 AND launched = 1916


--5
SELECT ship, outcomes.battle, date FROM ships
JOIN outcomes ON outcomes.ship = ships.name
JOIN battles ON battles.name = outcomes.battle
WHERE result = 'sunk'
ORDER BY battles.name


--6
SELECT name, displacement, launched
FROM ships JOIN classes ON ships.class = classes.class
WHERE ships.name = classes.class


--7
SELECT classes.class, type, country, numguns, bore, displacement
FROM ships RIGHT JOIN classes ON ships.class = classes.class
WHERE ships.name IS NULL

--8
SELECT name, displacement, numguns, result
FROM classes JOIN ships ON classes.class = ships.class
JOIN outcomes ON ships.name = outcomes.ship
WHERE battle = 'North Atlantic'






