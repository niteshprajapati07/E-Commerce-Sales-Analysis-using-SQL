-- ============================================================
-- E-Commerce Sales Analysis using SQL
-- Task 3: SQL for Data Analysis
-- Tool: MySQL
-- ============================================================

USE ecommerce_db;

-- ============================================================
-- 1. SELECT
-- Display all records
-- ============================================================

SELECT *
FROM Orders;

-- ============================================================
-- 2. WHERE
-- Orders with Sales greater than 10,000
-- ============================================================

SELECT
`Order ID`,
`Customer Name`,
`Product Name`,
`Sales`,
`Profit`
FROM Orders
WHERE CAST(`Sales` AS DECIMAL(10,2)) > 10000;

-- ============================================================
-- 3. ORDER BY
-- Highest sales first
-- ============================================================

SELECT
`Order ID`,
`Product Name`,
`Sales`,
`Profit`
FROM Orders
ORDER BY CAST(`Sales` AS DECIMAL(10,2)) DESC;

-- ============================================================
-- 4. GROUP BY + SUM
-- Category-wise total sales
-- ============================================================

SELECT
`Category`,
SUM(CAST(`Sales` AS DECIMAL(10,2))) AS Total_Sales
FROM Orders
GROUP BY `Category`
ORDER BY Total_Sales DESC;

-- ============================================================
-- 5. AGGREGATE FUNCTIONS
-- Total Sales, Profit, Average Sales and Orders
-- ============================================================

SELECT
SUM(CAST(`Sales` AS DECIMAL(10,2))) AS Total_Sales,
SUM(CAST(`Profit` AS DECIMAL(10,2))) AS Total_Profit,
AVG(CAST(`Sales` AS DECIMAL(10,2))) AS Average_Sales,
COUNT(*) AS Total_Orders
FROM Orders;

-- ============================================================
-- 6. SEGMENT ANALYSIS
-- ============================================================

SELECT
`Segment`,
COUNT(*) AS Total_Orders,
SUM(CAST(`Sales` AS DECIMAL(10,2))) AS Total_Sales,
SUM(CAST(`Profit` AS DECIMAL(10,2))) AS Total_Profit
FROM Orders
GROUP BY `Segment`
ORDER BY Total_Sales DESC;

-- ============================================================
-- 7. TOP 10 PRODUCTS
-- ============================================================

SELECT
`Product Name`,
SUM(CAST(`Sales` AS DECIMAL(10,2))) AS Total_Sales
FROM Orders
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- ============================================================
-- 8. CUSTOMERS TABLE
-- Create customer table for JOIN analysis
-- ============================================================

CREATE TABLE IF NOT EXISTS Customers AS
SELECT DISTINCT
`Customer ID`,
`Customer Name`,
`Customer Gender`,
`Customer Age`,
`Segment`
FROM Orders;

-- ============================================================
-- 9. INNER JOIN
-- ============================================================

SELECT
o.`Order ID`,
o.`Customer ID`,
c.`Customer Name`,
c.`Segment`,
o.`Sales`,
o.`Profit`
FROM Orders o
INNER JOIN Customers c
ON o.`Customer ID` = c.`Customer ID`;

-- ============================================================
-- 10. LEFT JOIN
-- ============================================================

SELECT
o.`Order ID`,
o.`Customer ID`,
c.`Customer Name`,
c.`Segment`,
o.`Sales`
FROM Orders o
LEFT JOIN Customers c
ON o.`Customer ID` = c.`Customer ID`;

-- ============================================================
-- 11. RIGHT JOIN
-- ============================================================

SELECT
o.`Order ID`,
c.`Customer ID`,
c.`Customer Name`,
c.`Segment`,
o.`Sales`
FROM Orders o
RIGHT JOIN Customers c
ON o.`Customer ID` = c.`Customer ID`;

-- ============================================================
-- 12. SUBQUERY
-- Orders with sales greater than average sales
-- ============================================================

SELECT
`Order ID`,
`Product Name`,
`Sales`
FROM Orders
WHERE CAST(`Sales` AS DECIMAL(10,2)) >
(
SELECT AVG(CAST(`Sales` AS DECIMAL(10,2)))
FROM Orders
);

-- ============================================================
-- 13. VIEW
-- Category-level analysis
-- ============================================================

CREATE OR REPLACE VIEW Category_Sales_Analysis AS
SELECT
`Category`,
COUNT(*) AS Total_Orders,
SUM(CAST(`Sales` AS DECIMAL(10,2))) AS Total_Sales,
SUM(CAST(`Profit` AS DECIMAL(10,2))) AS Total_Profit,
AVG(CAST(`Sales` AS DECIMAL(10,2))) AS Average_Sales
FROM Orders
GROUP BY `Category`;

-- Display the View

SELECT *
FROM Category_Sales_Analysis;

-- ============================================================
-- 14. INDEX OPTIMIZATION
-- Columns are TEXT, therefore prefix lengths are used.
-- ============================================================

CREATE INDEX idx_category
ON Orders (`Category`(50));

CREATE INDEX idx_customer_id
ON Orders (`Customer ID`(50));

CREATE INDEX idx_order_date
ON Orders (`Order Date`(20));

-- ============================================================
-- 15. CHECK INDEXES
-- ============================================================

SHOW INDEX FROM Orders;

-- ============================================================
-- END OF E-COMMERCE SALES ANALYSIS
-- ============================================================
