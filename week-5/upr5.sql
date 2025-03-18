--PC

use pc

--1
SELECT AVG(speed) FROM pc as avg_speed


--2
SELECT maker, AVG(screen) avg_speed 
FROM product 
JOIN laptop ON product.model = laptop.model
GROUP BY product.maker


--3
SELECT AVG(speed) avg_speed
FROM laptop
WHERE price >= 1000

--4
SELECT pr.maker, AVG(price) avg_price
FROM product pr 
JOIN pc p
ON pr.model = p.model
GROUP BY pr.maker
HAVING pr.maker = 'A'


--5
SELECT maker, AVG(price) FROM product JOIN
((SELECT code, model, price FROM pc)
UNION
(SELECT code, model, price FROM laptop)) AS lp
ON product.model = lp.model
GROUP BY maker
HAVING product.maker = 'B'


--6
SELECT speed, AVG(price) avg_price
FROM pc
GROUP BY speed

--7
SELECT pr.maker, COUNT(DISTINCT code) pc_count
FROM product pr
JOIN pc
ON pr.model = pc.model
GROUP BY pr.maker
HAVING COUNT(DISTINCT code) >= 3



--8
SELECT pr.maker, pc.price
FROM product pr JOIN pc
ON pr.model = pc.model
WHERE pc.price = (SELECT MAX(price) FROM pc)


--9
SELECT speed, AVG(price) avg_price
FROM pc
WHERE speed > 800
GROUP BY speed


--10
SELECT maker, AVG(hd) avg_HDD FROM product
JOIN pc ON product.model = pc.model
WHERE maker IN (SELECT DISTINCT maker FROM product
				JOIN printer ON product.model = printer.model)
GROUP BY maker


--SHIPS

use ships


--1
SELECT COUNT(DISTINCT class) FROM classes
WHERE type = 'bb'


--2
SELECT class, AVG(numguns) avg_guns 
FROM classes
WHERE type = 'bb'
GROUP BY class


--3
SELECT AVG(numguns) avg_guns FROM classes
WHERE type = 'bb'


--4
SELECT c.class, MIN(launched) first_year , MAX(launched) last_year
FROM classes c JOIN ships s ON c.class = s.class
GROUP BY c.class


--5
SELECT c.class, COUNT(*) sunk_ships
FROM classes c JOIN ships s ON c.class = s.class
JOIN outcomes ON outcomes.ship = s.name
WHERE result = 'sunk'
GROUP BY c.class


--6
SELECT c.class, COUNT(*) sunk_ships
FROM classes c JOIN ships s ON c.class = s.class
JOIN outcomes ON outcomes.ship = s.name
WHERE result = 'sunk' 
AND c.class IN (SELECT class FROM ships
					GROUP BY class
					HAVING COUNT(*) > 2)
GROUP BY c.class


--7
SELECT c.country, AVG(bore) avg_bore
FROM classes c 
JOIN ships s 
ON c.class = s.class
GROUP BY country









