CREATE TABLE category(pk_category_id SERIAL PRIMARY KEY,
category_name VARCHAR (200),
description VARCHAR (400));

INSERT INTO category VALUES (
    1,
    'Grocery',
    'Daily need products'
);

INSERT INTO category VALUES (
    2,
    'Stationery',
    'Work/School Suppplies'
);

INSERT INTO category VALUES (
    3,
    'Books',
    'Reading'
);



CREATE TABLE products (
    pk_products_id SERIAL PRIMARY KEY,
    product_name VARCHAR (200),
    fk_category_id INT,
    description VARCHAR (400),
    price FLOAT,
    added_date DATE,
    FOREIGN KEY (fk_category_id) REFERENCES category (pk_category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO products VALUES (
    1,
    'Apple Royal Gala',
    1,
    'Fruit',
    100,
    '2023-10-13'
);

INSERT INTO products VALUES (
    2,
    'Potato Egypt',
    1,
    'Vegetable',
    125,
    '2023-10-13'
);

INSERT INTO products VALUES (
    3,
    'Maped ColorPeps (48 pieces)',
    2,
    'Color pencil set of 48',
    300,
    '2023-10-06'
);

INSERT INTO products VALUES (
    4,
    'Red Seedless Californian Grapes',
    1,
    'Fruit',
    250,
    '2023-10-10'
);

INSERT INTO products VALUES (
    5,
    'Scissors',
    2,
    'School and work supplies',
    40,
    '2023-10-09'
);

INSERT INTO products VALUES (
    6,
    'Crime and Punishment',
    3,
    'Fyodor Dostoyevsky',
    315,
    '2023-10-05'
);

INSERT INTO products VALUES (
    7,
    'No Longer Human',
    3,
    'Semi-autobiography of Dazai Osamu',
    225,
    '2023-10-13'
);

INSERT INTO products VALUES (
    8,
    'HB Pencils',
    2,
    'Pencils',
    23,
    '2023-10-02'
);

INSERT INTO products VALUES (
    9,
    'The Great Gatsby',
    3,
    'F. Scott Fitzgerlad',
    210,
    '2023-10-03'
);

INSERT INTO products VALUES (
    10,
    'Jujutsu Kaisen Volume 11',
    3,
    'Gege Akutami',
    399,
    '2023-10-16'
);

SELECT * FROM products WHERE added_date = '2023-10-13'

SELECT * FROM products LIMIT 5;

SELECT * FROM products WHERE product_name LIKE '%Volume%';

SELECT * FROM products WHERE description LIKE '%Dos%';

SELECT * FROM products WHERE product_name LIKE '_p%';

UPDATE products SET product_name = 'Shingeki no Kyojin Volume 16', fk_category_id = 3, price = 399, added_date = '2023-10-16' WHERE pk_products_id = 1;

UPDATE products SET description = 'Hajime Isayama' WHERE pk_products_id = 1;

DELETE FROM products WHERE pk_products_id = 2;



CREATE TABLE bills (
    pk_bill_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(50),
    bill_date DATE
);

INSERT INTO bills VALUES(
    1,
    'Athira',
    '9898765432',
    '2020-10-01'
);

INSERT INTO bills VALUES(
    2,
    'Vishnu',
    '9893452332',
    '2020-06-04'
);

INSERT INTO bills VALUES(
    3,
    'Amir',
    '9999985432',
    '2020-09-30'
);

CREATE TABLE bill_items(
    item_id SERIAL PRIMARY KEY,
    fk_product_id INT,    
    item_price FLOAT,
    item_quantity INT,
    fk_bill_id INT,
    FOREIGN KEY(fk_product_id) REFERENCES products(pk_products_id) ON DELETE CASCADE ON UPDATE CASCADE,  
    FOREIGN KEY(fk_bill_id) REFERENCES bills(pk_bill_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO bill_items VALUES(
    1,
    10,
    45,
    2,
    1
);

INSERT INTO bill_items VALUES(
    2,
    7,
    70,
    1,
    2
);

INSERT INTO bill_items VALUES(
    3,
    9,
    100,
    1,
    2
);
