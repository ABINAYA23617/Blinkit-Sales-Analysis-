-- ITEMS
 
CREATE TABLE items (
    item_id VARCHAR(50) NOT NULL PRIMARY KEY,
    item_type VARCHAR(100),
    item_fat_content VARCHAR(50)
);

INSERT INTO items
SELECT DISTINCT item_id, item_type, item_fat_content
FROM blinkit_data;

-- OUTLETS 
CREATE TABLE outlets (
    outlet_id VARCHAR(50) NOT NULL PRIMARY KEY,
    outlet_type VARCHAR(100),
    outlet_size VARCHAR(50),
    outlet_location VARCHAR(100)
);
TRUNCATE TABLE outlets;

INSERT IGNORE INTO outlets
SELECT DISTINCT outlet_id, outlet_type, outlet_size, outlet_location
FROM blinkit_data;

SELECT COUNT(*) FROM outlets;

ALTER TABLE sales
ADD CONSTRAINT fk_sales_outlet
FOREIGN KEY (outlet_id)
REFERENCES outlets(outlet_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_item
FOREIGN KEY (item_id)
REFERENCES items(item_id);

SHOW CREATE TABLE sales;

ALTER TABLE sales 
MODIFY outlet_id VARCHAR(50);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_outlet
FOREIGN KEY (outlet_id)
REFERENCES outlets(outlet_id);

-- SALES 
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id VARCHAR(50) NOT NULL,
    outlet_id VARCHAR(50) NOT NULL,
    total_sales DOUBLE,
    rating INT,

    CONSTRAINT fk_sales_item
    FOREIGN KEY (item_id) REFERENCES items(item_id),

    CONSTRAINT fk_sales_outlet
    FOREIGN KEY (outlet_id) REFERENCES outlets(outlet_id)
);

INSERT INTO sales (item_id, outlet_id, total_sales, rating)
SELECT item_id, outlet_id, total_sales, rating
FROM blinkit_data;



-- JOIN QUERY

SELECT i.item_type, o.outlet_location, SUM(s.total_sales) AS revenue
FROM sales s 
JOIN  items i ON s.item_id = i.item_id
JOIN outlets o ON s.outlet_id = o.outlet_id
GROUP BY i.item_type, o.outlet_location; 

SHOW CREATE TABLE items;
