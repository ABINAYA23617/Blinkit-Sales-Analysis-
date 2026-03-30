CREATE VIEW sales_summary AS 
SELECT item_type, SUM(total_sales) AS revenue 
FROM blinkit_data 
GROUP BY item_type;

SELECT * FROM sales_summary;