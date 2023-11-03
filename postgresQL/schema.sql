postgres=# \c .db
connection to server at "localhost" (::1), port 5432 failed: FATAL:  database ".db" does not exist
Previous connection kept
postgres=# \c storedb
You are now connected to database "storedb" as user "postgres".
storedb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | category | table | postgres
(1 row)


storedb=# SELECT * FROM category;
 pk_category_id | category_name | description
----------------+---------------+-------------
(0 rows)


storedb=# ALTER TABLE category ADD image VARCHAR (100);
ALTER TABLE
storedb=# SELECT * FROM category;
 pk_category_id | category_name | description | image
----------------+---------------+-------------+-------
(0 rows)


storedb=#
storedb=# ALTER TABLE category DROP COLUMN image;
ALTER TABLE
storedb=# SELECT * FROM category;
 pk_category_id | category_name | description
----------------+---------------+-------------
(0 rows)


storedb=# ALTER TABLE category ALTER COLUMN description TYPE INT;
ERROR:  column "description" cannot be cast automatically to type integer
HINT:  You might need to specify "USING description::integer".
storedb=# ALTER TABLE category ALTER COLUMN description TYPE INT;
ERROR:  column "description" cannot be cast automatically to type integer
HINT:  You might need to specify "USING description::integer".
storedb=# ALTER TABLE category ADD price FLOAT;
ALTER TABLE
storedb=# SELECT * FROM category;
 pk_category_id | category_name | description | price
----------------+---------------+-------------+-------
(0 rows)


storedb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | category | table | postgres
(1 row)


storedb=# \d
                     List of relations
 Schema |            Name             |   Type   |  Owner
--------+-----------------------------+----------+----------
 public | category                    | table    | postgres
 public | category_pk_category_id_seq | sequence | postgres
(2 rows)


storedb=# \d category;
                                              Table "public.category"
     Column     |          Type          | Collation | Nullable |                     Default
----------------+------------------------+-----------+----------+--------------------------------------------------
 pk_category_id | integer                |           | not null | nextval('category_pk_category_id_seq'::regclass)
 category_name  | character varying(200) |           |          |
 description    | character varying(400) |           |          |
 price          | double precision       |           |          |
Indexes:
    "category_pkey" PRIMARY KEY, btree (pk_category_id)


storedb=# ALTER TABLE category ALTER COLUMN price TYPE INT;
ALTER TABLE
storedb=# \d category;
                                              Table "public.category"
     Column     |          Type          | Collation | Nullable |                     Default
----------------+------------------------+-----------+----------+--------------------------------------------------
 pk_category_id | integer                |           | not null | nextval('category_pk_category_id_seq'::regclass)
 category_name  | character varying(200) |           |          |
 description    | character varying(400) |           |          |
 price          | integer                |           |          |
Indexes:
    "category_pkey" PRIMARY KEY, btree (pk_category_id)




-- 14/10/23 

storedb=# SELECT * FROM products;
 pk_products_id |          product_name           | fk_category_id |            description            | price | added_date
----------------+---------------------------------+----------------+-----------------------------------+-------+------------
              1 | Apple                           |              1 | Fruit                             |   150 | 2023-10-13
              2 | Potato Egypt                    |              1 | Vegetable                         |   125 | 2023-10-13
              4 | Red Seedless Californian Grapes |              1 | Fruit                             |   250 | 2023-10-06
              3 | Maped ColorPeps (48 pieces)     |              2 | Color pencil set of 48            |   300 | 2023-10-10
              5 | Scissors                        |              2 | School and work supplies          |    40 | 2023-10-09
              6 | Crime and Punishment            |              3 | Fyodor Dostoyevsky                |   315 | 2023-10-05
              7 | No Longer Human                 |              3 | Semi-autobiography of Dazai Osamu |   225 | 2023-10-13
              8 | HB Pencils                      |              2 | Pencils                           |    23 | 2023-10-02
              9 | The Great Gatsby                |              3 | F. Scott Fitzgerlad               |   210 | 2023-10-03
             10 | Jujutsu Kaisen Volume 11        |              3 | Gege Akutami                      |   399 | 2023-10-16
(10 rows)


storedb=# SELECT * FROM products WHERE added_date = '2023-10-13';
 pk_products_id |  product_name   | fk_category_id |            description            | price | added_date
----------------+-----------------+----------------+-----------------------------------+-------+------------
              1 | Apple           |              1 | Fruit                             |   150 | 2023-10-13
              2 | Potato Egypt    |              1 | Vegetable                         |   125 | 2023-10-13
              7 | No Longer Human |              3 | Semi-autobiography of Dazai Osamu |   225 | 2023-10-13
(3 rows)


storedb=# SELECT * FROM products WHERE price > 200;
 pk_products_id |          product_name           | fk_category_id |            description            | price | added_date
----------------+---------------------------------+----------------+-----------------------------------+-------+------------
              4 | Red Seedless Californian Grapes |              1 | Fruit                             |   250 | 2023-10-06
              3 | Maped ColorPeps (48 pieces)     |              2 | Color pencil set of 48            |   300 | 2023-10-10
              6 | Crime and Punishment            |              3 | Fyodor Dostoyevsky                |   315 | 2023-10-05
              7 | No Longer Human                 |              3 | Semi-autobiography of Dazai Osamu |   225 | 2023-10-13
              9 | The Great Gatsby                |              3 | F. Scott Fitzgerlad               |   210 | 2023-10-03
             10 | Jujutsu Kaisen Volume 11        |              3 | Gege Akutami                      |   399 | 2023-10-16
(6 rows)


storedb=# SELECT product_name, fk_category_id FROM products;
          product_name           | fk_category_id
---------------------------------+----------------
 Apple                           |              1
 Potato Egypt                    |              1
 Red Seedless Californian Grapes |              1
 Maped ColorPeps (48 pieces)     |              2
 Scissors                        |              2
 Crime and Punishment            |              3
 No Longer Human                 |              3
 HB Pencils                      |              2
 The Great Gatsby                |              3
 Jujutsu Kaisen Volume 11        |              3
(10 rows)


storedb=# SELECT product_name, fk_category_id FROM products WHERE price BETWEEN 0 AND 210;
   product_name   | fk_category_id
------------------+----------------
 Apple            |              1
 Potato Egypt     |              1
 Scissors         |              2
 HB Pencils       |              2
 The Great Gatsby |              3
(5 rows)

storedb=# SELECT * FROM products LIMIT 5;
 pk_products_id |          product_name           | fk_category_id |       description        | price | added_date
----------------+---------------------------------+----------------+--------------------------+-------+------------
              1 | Apple                           |              1 | Fruit                    |   150 | 2023-10-13
              2 | Potato Egypt                    |              1 | Vegetable                |   125 | 2023-10-13
              4 | Red Seedless Californian Grapes |              1 | Fruit                    |   250 | 2023-10-06
              3 | Maped ColorPeps (48 pieces)     |              2 | Color pencil set of 48   |   300 | 2023-10-10
              5 | Scissors                        |              2 | School and work supplies |    40 | 2023-10-09
(5 rows)

storedb=# SELECT * FROM products WHERE product_name LIKE '%Volume%';
 pk_products_id |       product_name       | fk_category_id | description  | price | added_date
----------------+--------------------------+----------------+--------------+-------+------------
             10 | Jujutsu Kaisen Volume 11 |              3 | Gege Akutami |   399 | 2023-10-16
(1 row)

storedb=# SELECT * FROM products WHERE description LIKE '%Dos%';
 pk_products_id |     product_name     | fk_category_id |    description     | price | added_date
----------------+----------------------+----------------+--------------------+-------+------------
              6 | Crime and Punishment |              3 | Fyodor Dostoyevsky |   315 | 2023-10-05
(1 row)

storedb=# SELECT * FROM products WHERE product_name LIKE '_p%';
 pk_products_id | product_name | fk_category_id | description | price | added_date
----------------+--------------+----------------+-------------+-------+------------
              1 | Apple        |              1 | Fruit       |   150 | 2023-10-13
(1 row)


storedb=# UPDATE products SET product_name = 'Shingeki no Kyojin Volume 16', fk_category_id = 3, price = 399, added_date = '2023-10-16' WHERE pk_products_id = 1;
UPDATE 1
storedb=# SELECT * FROM products;
 pk_products_id |          product_name           | fk_category_id |            description            | price | added_date
----------------+---------------------------------+----------------+-----------------------------------+-------+------------
              2 | Potato Egypt                    |              1 | Vegetable                         |   125 | 2023-10-13
              4 | Red Seedless Californian Grapes |              1 | Fruit                             |   250 | 2023-10-06
              3 | Maped ColorPeps (48 pieces)     |              2 | Color pencil set of 48            |   300 | 2023-10-10
              5 | Scissors                        |              2 | School and work supplies          |    40 | 2023-10-09
              6 | Crime and Punishment            |              3 | Fyodor Dostoyevsky                |   315 | 2023-10-05
              7 | No Longer Human                 |              3 | Semi-autobiography of Dazai Osamu |   225 | 2023-10-13
              8 | HB Pencils                      |              2 | Pencils                           |    23 | 2023-10-02
              9 | The Great Gatsby                |              3 | F. Scott Fitzgerlad               |   210 | 2023-10-03
             10 | Jujutsu Kaisen Volume 11        |              3 | Gege Akutami                      |   399 | 2023-10-16
              1 | Shingeki no Kyojin Volume 16    |              3 | Fruit                             |   399 | 2023-10-16
(10 rows)


storedb=# UPDATE products SET description = 'Hajime Isayama' WHERE pk_products_id =1;
UPDATE 1
storedb=# SELECT * FROM products;
 pk_products_id |          product_name           | fk_category_id |            description            | price | added_date
----------------+---------------------------------+----------------+-----------------------------------+-------+------------
              2 | Potato Egypt                    |              1 | Vegetable                         |   125 | 2023-10-13
              4 | Red Seedless Californian Grapes |              1 | Fruit                             |   250 | 2023-10-06
              3 | Maped ColorPeps (48 pieces)     |              2 | Color pencil set of 48            |   300 | 2023-10-10
              5 | Scissors                        |              2 | School and work supplies          |    40 | 2023-10-09
              6 | Crime and Punishment            |              3 | Fyodor Dostoyevsky                |   315 | 2023-10-05
              7 | No Longer Human                 |              3 | Semi-autobiography of Dazai Osamu |   225 | 2023-10-13
              8 | HB Pencils                      |              2 | Pencils                           |    23 | 2023-10-02
              9 | The Great Gatsby                |              3 | F. Scott Fitzgerlad               |   210 | 2023-10-03
             10 | Jujutsu Kaisen Volume 11        |              3 | Gege Akutami                      |   399 | 2023-10-16
              1 | Shingeki no Kyojin Volume 16    |              3 | Hajime Isayama                    |   399 | 2023-10-16
(10 rows)