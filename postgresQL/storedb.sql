CREATE TABLE category(pk_category_id SERIAL PRIMARY KEY,
category_name VARCHAR (200),
description VARCHAR (400));


-- two types of languages - DDL (Data Definition Language) and DML (Data Manipulation Language)
-- DDL: statements used to create, alter and drop database objects; causes structural changes.
-- DML: doesn't affect the structure of object; insert, retrieve, update, remove, and manage data within a databse object 

ALTER TABLE category ADD image VARCHAR (100);
-- to add a column
ALTER TABLE category DROP COLUMN image;
-- to drop/remove a columnn

ALTER TABLE category ADD price FLOAT;
ALTER TABLE category ALTER COLUMN price TYPE INT;
-- changing type from float to int

ALTER TABLE category RENAME COLUMN price TO cost;
-- renaming column (example below)

storedb=# ALTER TABLE category RENAME COLUMN price TO cost;
ALTER TABLE
storedb=# SELECT * FROM category;
 pk_category_id | category_name | description | cost
----------------+---------------+-------------+------
(0 rows)

ALTER TABLE category RENAME TO product;
-- to change table name

DROP TABLE product;
-- drop/remove the table itself