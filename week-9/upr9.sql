--1

CREATE DATABASE pc_shop

--à)

CREATE TABLE Product (
	model CHAR(4),
	producer CHAR(1),
	type VARCHAR(7),
)

CREATE TABLE Printer (
	code INTEGER,
	model CHAR(4),
	price DECIMAL(8,2)
)

--á)
--INSERT INTO TABLE VALUES ... 

--â)
ALTER TABLE Printer ADD type VARCHAR(6), color CHAR(1);


--ã)
ALTER TABLE Printer DROP COLUMN price;

--ä)
DROP DATABASE pc_shop


--2

CREATE DATABASE Facebook
--à)

CREATE TABLE Users(
	id INTEGER IDENTITY(1,1),
	email VARCHAR(64),
	password VARCHAR(64),
	registrationDate DATE
)

CREATE TABLE Friends(
	user_id INTEGER NOT NULL,
	friend_with INTEGER NOT NULL
)

CREATE TABLE Walls (
	all_owner_id INTEGER NOT NULL,
    post_author_id INTEGER NOT NULL,
    post_text VARCHAR(256),
    post_date DATE
)

CREATE TABLE Groups (
	id INTEGER IDENTITY(1,1),
	name VARCHAR(64),
	description VARCHAR(512) DEFAULT ''
)

CREATE TABLE GroupMembers (
	user_id INTEGER NOT NULL,
	grop_id INTEGER NOT NULL
)





