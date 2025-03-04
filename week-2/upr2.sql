use movies

--1
SELECT name
FROM moviestar INNER JOIN starsin 
ON starname = name
WHERE movietitle = 'The Usual Suspects' AND gender = 'M'

--2
SELECT starname
FROM starsin INNER JOIN movie
ON movietitle = title
WHERE year=1995 AND studioname = 'MGM'

--3
SELECT DISTINCT name
FROM movieexec INNER JOIN movie
ON producerc# = cert#
WHERE studioname = 'MGM'

--4
SELECT m1.title
FROM movie AS m1 JOIN movie AS m2
ON m2.title = 'Star Wars'
WHERE m1.LENGTH > m2.LENGTH

--5
SELECT m1.name
FROM movieexec AS m1 JOIN movieexec AS m2
ON m2.name = 'Stephen Spielberg'
WHERE m1.networth > m2.networth



use pc


--1
SELECT maker, speed
FROM product JOIN laptop ON product.model = laptop.model
WHERE hd > 9

--2
(SELECT laptop.model, price 
FROM laptop JOIN product ON product.model = laptop.model
WHERE maker = 'B')
UNION
(SELECT pc.model, price 
FROM pc JOIN product ON product.model = pc.model
WHERE maker = 'B')
UNION
(SELECT printer.model, price 
FROM printer JOIN product ON product.model = printer.model
WHERE maker = 'B')

SELECT * FROM product

--3
SELECT DISTINCT maker
FROM product JOIN laptop ON product.model = laptop.model
EXCEPT
(SELECT DISTINCT maker
FROM product JOIN pc ON product.model = pc.model)

--4
SELECT DISTINCT pc1.hd
FROM pc AS pc1 JOIN pc AS pc2 ON pc1.code != pc2.code
WHERE pc1.hd = pc2.hd

--5
SELECT pc1.model, pc2.model
FROM pc AS pc1 JOIN pc AS pc2 ON pc1.ram = pc2.ram AND pc1.speed = pc2.speed
WHERE pc1.model < pc2.model

--6
SELECT DISTINCT p1.maker
FROM product AS p1 JOIN pc AS pc1 ON p1.model = pc1.model
JOIN (product AS p2 JOIN pc AS pc2 ON p2.model = pc2.model) ON p1.maker = p2.maker
WHERE pc1.speed >= 400 AND pc2.speed >= 400 AND pc1.code != pc2.code



use ships

SELECT * FROM ships

--1
SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement >= 50000

--2
SELECT name
FROM ships JOIN outcomes ON name = ship
WHERE battle = 'Guadalcanal'

--3
SELECT DISTINCT c1.country
FROM classes AS c1 JOIN classes AS c2 ON c1.country = c2.country
WHERE c1.type = 'bb' AND c2.type = 'bc'

--4
SELECT DISTINCT o1.ship
FROM outcomes AS o1
JOIN battles b1 ON o1.battle = b1.name
JOIN outcomes o2 ON o1.ship = o2.ship
JOIN battles b2 ON o2.battle = b2.name
WHERE o1.result = 'damaged'
AND b2.date > b1.date
