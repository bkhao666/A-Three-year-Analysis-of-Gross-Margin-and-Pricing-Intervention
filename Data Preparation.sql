-- combining the order years
WITH all_orders AS (
SELECT
	OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Quantity,
    Revenue,
    COGS
FROM orders_2023

UNION ALL

SELECT
	OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Quantity,
    Revenue,
    COGS
FROM orders_2024

UNION ALL

SELECT
	OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Quantity,
    Revenue,
    COGS
FROM orders_2025)

-- building the main dataset query
SELECT 
	a.OrderID,
    a.CustomerID,
    Region,
    a.ProductID,
    a.OrderDate,
    DATE_SUB(OrderDate, INTERVAL WEEKDAY(OrderDate) DAY) AS Week_Date,
    CustomerJoinDate,
    a.Quantity,
    a.Revenue,
    CASE WHEN a.Revenue IS NULL THEN ROUND(p.Price * a.Quantity, 2) ELSE a.Revenue END AS CleanedRevenue,
    ROUND(a.Revenue - a.COGS, 2) AS Profit,
    a.COGS,
    p.ProductName,
    p.ProductCategory,
    p.Price,
    p.Base_Cost
FROM all_orders AS a
LEFT JOIN customers AS c
ON a.CustomerID = c. CustomerID
LEFT JOIN products AS p
ON a.ProductID = p.ProductID
WHERE a.CustomerID != '';-- dropping the non customer ids
