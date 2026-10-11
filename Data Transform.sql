SELECT
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN Revenue IS NULL OR TRIM(Revenue) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_revenue
FROM grid_sales.orders_2023;
SET SQL_SAFE_UPDATES = 0;
UPDATE grid_sales.orders_2023
SET Revenue = NULL
WHERE TRIM(Revenue) = '';
SELECT Revenue
FROM grid_sales.orders_2023
WHERE Revenue IS NOT NULL
  AND TRIM(Revenue) NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$';
ALTER TABLE grid_sales.orders_2023
MODIFY COLUMN Revenue DECIMAL(12,2) NULL;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN Revenue IS NULL OR TRIM(Revenue) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_revenue
FROM grid_sales.orders_2024;
UPDATE grid_sales.orders_2024
SET Revenue = NULL
WHERE TRIM(Revenue) = '';
SELECT Revenue
FROM grid_sales.orders_2024
WHERE Revenue IS NOT NULL
  AND TRIM(Revenue) NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$';
ALTER TABLE grid_sales.orders_2024
MODIFY COLUMN Revenue DECIMAL(12,2) NULL;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN Revenue IS NULL OR TRIM(Revenue) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_revenue
FROM grid_sales.orders_2025;
UPDATE grid_sales.orders_2025
SET Revenue = NULL
WHERE TRIM(Revenue) = '';
SELECT Revenue
FROM grid_sales.orders_2025
WHERE Revenue IS NOT NULL
  AND TRIM(Revenue) NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$';
ALTER TABLE grid_sales.orders_2025
MODIFY COLUMN Revenue DECIMAL(12,2) NULL;

ALTER TABLE grid_sales.orders_2023
MODIFY COLUMN OrderDate DATE;
ALTER TABLE grid_sales.orders_2024
MODIFY COLUMN OrderDate DATE;
ALTER TABLE grid_sales.orders_2025
MODIFY COLUMN OrderDate DATE;