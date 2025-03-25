--MOVIES
use movies

--1
SELECT title, year, length
FROM movie
WHERE (length > 120 AND year < 2000) OR length IS NULL


--2
SELECT name, gender
FROM moviestar
WHERE name LIKE 'J%' AND birthdate >= 1948
ORDER BY name DESC


--3
SELECT studioname, COUNT(DISTINCT starname) AS num_actors
FROM starsin st
JOIN movie m ON m.title = st.movietitle
JOIN studio s ON s.name = m.studioname
GROUP BY studioname


--4
SELECT a.name, COUNT(m.title) AS num_movies
FROM starsin s
JOIN movie m ON m.title = s.movietitle
RIGHT JOIN moviestar a ON a.name = s.starname
GROUP BY a.name


--5
SELECT studioname, title, year 
FROM movie m
WHERE year >= ALL(SELECT year FROM movie WHERE studioname = m.studioname)
ORDER BY m.studioname DESC
--сортирането не влиза в задачата


--6
SELECT name
FROM moviestar
WHERE gender = 'M' AND birthdate >= ALL(SELECT birthdate FROM moviestar WHERE gender = 'M')


--7
(SELECT m.studioname, s.starname, COUNT(DISTINCT m.title) AS num_movies
FROM starsin s
JOIN movie m ON m.title = s.movietitle
GROUP BY m.studioname, s.starname)


--8
SELECT movietitle, movieyear, COUNT(starname) AS num_actors
FROM starsin
GROUP BY movietitle, movieyear
HAVING COUNT(starname) > 2


--SHIPS

use ships


--1
SELECT DISTINCT s.name AS ship
FROM ships s 
JOIN outcomes o
ON s.name = o.ship
WHERE s.name LIKE 'C%' OR s.name LIKE 'K%'


--2
SELECT s.name, c.country
FROM ships s 
JOIN classes c
ON s.class = c.class
WHERE s.name NOT IN (SELECT name FROM ships JOIN outcomes ON name = ship WHERE result = 'sunk')


--3
SELECT c.country, COUNT(o.result) AS num_ships
FROM ships s 
RIGHT JOIN classes c ON s.class = c.class
LEFT JOIN outcomes o ON s.name = o.ship
WHERE (o.result = 'sunk') OR (s.name IS NULL) OR (o.result IS NULL)
GROUP BY c.country


--4
SELECT battle, COUNT(*) fought_ships
FROM outcomes
GROUP BY battle
HAVING COUNT(*) > (SELECT COUNT(*) FROM outcomes WHERE battle = 'Guadalcanal')


--5
SELECT battle
FROM outcomes o 
JOIN ships s ON s.name = o.ship
JOIN classes c ON s.class = c.class
GROUP BY battle
HAVING COUNT(DISTINCT country) > 
	(SELECT COUNT(DISTINCT country) 
	FROM outcomes o
	JOIN ships s ON s.name = o.ship
	JOIN classes c ON s.class = c.class
	GROUP BY battle
	HAVING battle = 'Surigao Strait')


--6
SELECT s.name, c.displacement, c.numguns
FROM ships s 
JOIN classes c ON s.class = c.class
WHERE displacement = (SELECT MIN(displacement) FROM classes)
AND numguns = (SELECT MAX(numguns) FROM classes WHERE displacement = (SELECT MIN(displacement) FROM classes))


--7
SELECT COUNT(DISTINCT o1.ship) num_ships
FROM outcomes o1
JOIN battles b1 ON b1.name = o1.battle
JOIN outcomes o2 ON o1.ship = o2.ship
JOIN battles b2 ON b2.name = o2.battle
WHERE o1.result = 'damaged'
AND o2.result = 'ok'
AND b1.date < b2.date


--8
SELECT DISTINCT o1.ship
FROM outcomes o1
JOIN battles b1 ON o1.battle = b1.name
JOIN outcomes o2 ON o1.ship = o2.ship
JOIN battles b2 ON o2.battle = b2.name
WHERE o1.result = 'damaged'
AND o2.result = 'ok' AND b1.date < b2.date
AND
(SELECT COUNT(o3.ship)
FROM outcomes o3
WHERE o3.battle = o1.battle) 
<
(SELECT COUNT(o4.ship)
FROM outcomes o4
WHERE o4.battle = o2.battle)



--PC

use pc

--1
SELECT model, code, screen
FROM laptop l1 
WHERE screen = 11
AND model IN (SELECT model FROM laptop WHERE model = l1.model AND screen = 15)


--2
SELECT DISTINCT pc.model 
FROM pc 
JOIN product p1 ON p1.model = pc.model
WHERE pc.price < 
(SELECT MIN(price) 
FROM laptop 
JOIN product p2 ON laptop.model = p2.model
WHERE p2.maker = p1.maker)


--3
SELECT pc.model, AVG(pc.price) avg_price
FROM pc
JOIN product pr1 ON pr1.model = pc.model
GROUP BY pc.model
HAVING AVG(pc.price) < 
(SELECT MIN(l.price) 
FROM laptop l 
JOIN product pr2 ON pr2.model = l.model)


--4
SELECT pc1.code, pr1.maker, COUNT(pc2.code) num_pc_higher_price
FROM pc pc1 
JOIN product pr1 ON pc1.model = pr1.model
LEFT JOIN pc pc2 ON pc2.price >= pc1.price AND pc2.code != pc1.code
GROUP BY pc1.code, pr1.maker
