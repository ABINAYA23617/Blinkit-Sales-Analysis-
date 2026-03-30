SELECT 
    SUM(total_sales) AS total_revenue,
    AVG(total_sales) AS avg_sales,
    COUNT(*) AS total_items,
    AVG(rating) AS avg_rating
FROM blinkit_data;
