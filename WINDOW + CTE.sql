-- RANKING 

SELECT item_type, 
	SUM(total_sales) AS revenue, 
    RANK() OVER(ORDER BY SUM(total_sales) DESC) AS rank_position
FROM blinkit_data 
GROUP BY item_type;

-- TOP 5 ITEMS 

SELECT item_type,
	SUM(total_sales) AS revenue 
FROM blinkit_data
GROUP BY item_type
ORDER BY revenue DESC
LIMIT 5;

-- YEAR GROWTH ANALYSIS 

SELECT outlet_year,
	SUM(total_sales) AS revenue, 
    LAG(SUM(total_sales)) OVER(ORDER BY outlet_year) AS prev_year,
    (SUM(total_sales) - LAG(SUM(total_sales)) OVER(ORDER BY outlet_year)) AS  growth
FROM blinkit_data
GROUP BY  outlet_year;


-- CTE 
WITH sales_summary AS(
	SELECT item_type, SUM(total_sales) AS revenue
    FROM blinkit_data
    GROUP BY item_type
)
SELECT * 
FROM sales_summary
ORDER BY  revenue DESC;

