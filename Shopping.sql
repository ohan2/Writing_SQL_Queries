CREATE DATABASE shopping;
USE shopping;


CREATE TABLE product_categories (
    id int NOT NULL auto_increment, 
    title varchar(45), 
    primary key(id));


CREATE TABLE products (
    id int NOT NULL auto_increment, 
    product_category_id int,
    title varchar(45), 
    description mediumtext, 
    price double, 
    quantity int, 
    primary key(id),
    foreign key (product_category_id) REFERENCES product_categories (id));


CREATE TABLE orders (
    id int NOT NULL auto_increment, 
    product_id int,
    name varchar(45), 
    email varchar(45), 
    order_date datetime, 
    primary key(id),
    foreign key (product_id) REFERENCES products (id));


-- Populate product_categories
INSERT INTO product_categories (title) VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Books'),
('Sports & Outdoors');

-- Populate products
INSERT INTO products (product_category_id, title, description, price, quantity) VALUES
(1, 'Smartphone X', 'Latest flagship smartphone with 6.5" display and 128GB storage', 899.99, 25),
(1, 'Wireless Earbuds', 'Bluetooth 5.0 earbuds with noise cancellation and 24h battery', 129.99, 50),
(1, 'Smart Watch', 'Fitness tracker with heart rate monitor and sleep tracking', 199.99, 30),
(2, 'Cotton T-Shirt', 'Comfortable 100% cotton t-shirt available in multiple colors', 24.99, 100),
(2, 'Slim Jeans', 'Classic slim fit jeans with stretch material for extra comfort', 59.99, 75),
(2, 'Winter Jacket', 'Waterproof jacket with thermal insulation for cold weather', 119.99, 40),
(3, 'Stainless Steel Cookware Set', 'Complete kitchen cookware set with 10 pieces', 189.99, 15),
(3, 'Smart Coffee Maker', 'Programmable coffee maker with smartphone control', 149.99, 20),
(3, 'Memory Foam Pillow', 'Ergonomic pillow that adjusts to your sleeping position', 39.99, 60),
(4, 'The Great Adventure', 'Bestselling novel about an unforgettable journey', 15.99, 45),
(4, 'Cooking Masterclass', 'Comprehensive cookbook with 500 recipes', 28.99, 35),
(4, 'Science for Beginners', 'Illustrated science guide for all ages', 19.99, 25),
(5, 'Yoga Mat', 'Non-slip yoga mat with carrying strap', 29.99, 40),
(5, 'Dumbbell Set', 'Adjustable dumbbell set with different weight options', 149.99, 20),
(5, 'Running Shoes', 'Lightweight running shoes with enhanced cushioning', 79.99, 30);

-- Populate orders (with timestamps for the last 30 days)
INSERT INTO orders (product_id, name, email, order_date) VALUES
(1, 'John Smith', 'john.smith@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(3, 'Emma Johnson', 'emma.j@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(2, 'Michael Brown', 'mbrown@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(5, 'Sarah Wilson', 'sarahw@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(8, 'David Miller', 'david.m@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(10, 'Jennifer Lee', 'jlee@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(4, 'Robert Jones', 'rjones@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(7, 'Lisa Garcia', 'lisa.g@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(12, 'James Wilson', 'jwilson@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(6, 'Patricia Moore', 'pmoore@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(11, 'Thomas Anderson', 'tanderson@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(9, 'Mary Taylor', 'mtaylor@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(14, 'Christopher Davis', 'cdavis@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(13, 'Elizabeth Martinez', 'emartinez@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(15, 'Daniel Harris', 'dharris@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(2, 'Jessica Robinson', 'jrobinson@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(5, 'Matthew Clark', 'mclark@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(8, 'Nancy Lewis', 'nlewis@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(1, 'Andrew Walker', 'awalker@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)),
(4, 'Karen Hill', 'khill@example.com', DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY));




-- SQL Queries

-- 1. Get all orders from the most recent to the oldest.

SELECT * from orders ORDER BY order_date DESC;

-- 2. Get all products belonging to a particular category.

SELECT * from products WHERE product_category_id = 1;

-- 3. Get the top three most expensive products in the products table.

SELECT * from products 
ORDER BY price DESC
LIMIT 3;

-- 4. Get the total number of products under each product category.

SELECT product_category_id, COUNT(*) as product_count
FROM products
GROUP BY product_category_id;
 

-- 5. Get the top three selling products based on the number of orders.

SELECT product_id, COUNT(*) as order_count 
FROM orders GROUP BY product_id ORDER BY order_count DESC 
LIMIT 3;