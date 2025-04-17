use movies
--MOVIES

SELECT * FROM moviestar

--1
INSERT INTO moviestar(name, birthdate, gender)
VALUES ('Nicole Kidman', '1967-06-20', 'F');


--2
DELETE FROM movieexec 
WHERE networth <= 30000000

--3
DELETE FROM moviestar 
WHERE address IS NULL


--PC
use pc

SELECT * FROM pc

--4
INSERT INTO pc(code, model, speed, ram, hd, cd, price)
VALUES (12, '1100', 2400, 2048, 500, '52x', 299)

INSERT INTO product(maker, model, type)
VALUES('C', '1100', 'pc')


--5
DELETE FROM pc WHERE model = '1100'


--6
DELETE FROM laptop WHERE model
IN
(SELECT model FROM product WHERE type='Laptop'
AND maker NOT IN (SELECT DISTINCT maker FROM product WHERE type='Printer'))


--7
UPDATE product
SET maker = 'A'
WHERE maker = 'B'


--8
UPDATE pc
SET price = price / 2, 
	hd = hd + 20


--9
UPDATE laptop
SET screen = screen + 1
WHERE model IN 
(SELECT model FROM laptop
JOIN product ON laptop.model = product.model
WHERE product.maker = 'B' AND product.type = 'Laptop')



--SHIPS
use ships

--10
INSERT INTO CLASSES (CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT)
VALUES ('Nelson', 'bb', 'Great Britain', 9, 16, 34000)

INSERT INTO SHIPS (NAME, CLASS, LAUNCHED)
VALUES ('Nelson', 'Nelson', 1927),
('Rodney', 'Nelson', 1927)


--11
DELETE FROM ships
WHERE name IN (SELECT DISTINCT name FROM outcomes WHERE result = 'sunk')


--12
UPDATE Classes
SET bore = bore * 2.5,
    displacement = displacement / 1.1;













