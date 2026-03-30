CREATE DATABASE blinkit_db;
USE blinkit_db;
SELECT * FROM blinkit_data;
SELECT COUNT(*) FROM blinkit_data;
ALTER TABLE blinkit_data
RENAME COLUMN `Item Identifier` TO item_id,
RENAME COLUMN `Item Type` TO item_type,
RENAME COLUMN `Outlet Establishment Year` TO outlet_year,
RENAME COLUMN `Outlet Identifier` TO outlet_id,
RENAME COLUMN `Outlet Location Type` TO outlet_location,
RENAME COLUMN `Outlet Size` TO outlet_size,
RENAME COLUMN `Outlet Type` TO outlet_type,
RENAME COLUMN `Item Visibility` TO item_visibility,
RENAME COLUMN `Item Weight` TO item_weight,
RENAME COLUMN `Total Sales` TO total_sales,
RENAME COLUMN `Rating` TO rating;

SET SQL_SAFE_UPDATES = 0;

UPDATE blinkit_data
SET item_fat_content = 
CASE 
	WHEN item_fat_content IN ('LF', 'Low Fat') THEN 'Low Fat'
    WHEN item_fat_content IN ('reg', 'Regular') THEN 'Regular'
    ELSE item_fat_content
END;

SELECT * FROM blinkit_data
WHERE item_weight IS NULL;

SELECT DISTINCT item_fat_content FROM blinkit_data;
SELECT COUNT(*) FROM blinkit_data;