SELECT pk_bill_id, bill_date, customer_name, SUM(item_price*item_quantity) AS total_bill FROM bill_items INNER JOIN bills ON pk_bill_id = fk_bill_id GROUP BY pk_bill_id ORDER BY pk_bill_id;

CREATE TABLE stocks(
    pk_stock_id SERIAL PRIMARY KEY,
    fk_product_id INT, 
    quantity INT,
    FOREIGN KEY(fk_product_id) REFERENCES products(pk_products_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO stocks VALUES(
    1,
    1,
    300
);

INSERT INTO stocks VALUES(
    2,
    3,
    200
);

INSERT INTO stocks VALUES(
    3,
    10,
    150
);

-- LEFT JOIN 

SELECT product_name,quantity FROM products LEFT JOIN stocks ON pk_products_id = fk_product_id;

INSERT INTO category VALUES(
    4,
    'Sports',
    'Sports and Fitness items'
);

INSERT INTO category VALUES(
    5,
    'Electronics',
    'Home appliances and gadgets'
);

-- RIGHT JOIN

SELECT product_name,category_name FROM products RIGHT JOIN category ON fk_category_id = pk_category_id;

-- SUBQUERIES

SELECT * FROM products WHERE fk_category_id IN (SELECT pk_category_id FROM category WHERE category_name = 'Grocery');

