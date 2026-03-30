-- % CONTRIBUTION 
SELECT item_type,
	SUM(total_sales) AS revenue,
    ROUND((SUM(total_sales) / SUM(SUM(total_sales)) OVER()) * 100, 2) AS percentage_contribution
FROM blinkit_data 
GROUP BY item_type 
ORDER BY revenue DESC;

-- OUTLET RANKING 
SELECT outlet_location, 
	outlet_type, 
    SUM(total_sales) AS revenue, 
    RANK() OVER(PARTITION BY outlet_location ORDER BY SUM(total_sales) DESC) AS rank_position
FROM blinkit_data
GROUP BY  outlet_location, outlet_type;

-- SALES SEGMENTATION 

SELECT 
	CASE 
		WHEN total_sales < 50 THEN 'Low'
        WHEN total_sales BETWEEN 50 AND 150 THEN 'Medium'
        ELSE 'High'
	END AS sales_category,
    COUNT(*) AS items,
    ROUND(AVG(total_sales),2) AS avg_sales
FROM blinkit_data
GROUP BY sales_category;

-- OUTLIER DETECTION 

SELECT * FROM blinkit_data
WHERE total_sales > (
	SELECT AVG(total_sales) + 2 * STDDEV(total_sales)
    FROM blinkit_data
);

