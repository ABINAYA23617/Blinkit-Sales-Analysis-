-- SALES BY FAT CONTENT 
 
SELECT item_fat_content,
	SUM(total_sales) AS total_sales,
    AVG(total_sales) AS avg_sales,
    COUNT(*) AS items,
    AVG(rating) AS avg_rating
FROM blinkit_data
GROUP BY item_fat_content;

-- TOP ITEM TYPES 

SELECT item_type,
	SUM(total_sales) AS revenue
FROM blinkit_data
GROUP BY item_type
ORDER BY revenue DESC;

-- SALES BY OUTLET 

SELECT outlet_year,
       outlet_location,
       item_fat_content,
       SUM(total_sales) AS revenue
FROM blinkit_data
GROUP BY outlet_year, outlet_location, item_fat_content
ORDER BY outlet_year;

-- OUTLET TYPE ANALYSIS 

SELECT outlet_type, 
	item_fat_content,
    SUM(total_sales) AS revenue
FROM blinkit_data
GROUP BY outlet_type, item_fat_content;

-- VISIBILITY Vs SALES ANALYSIS 
SELECT item_visibility, AVG(total_sales)
FROM blinkit_data
GROUP BY item_visibility;


