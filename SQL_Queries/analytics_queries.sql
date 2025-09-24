-- ==========================================================
-- Analytics Queries for Global Electronics
-- ==========================================================
-- Author: Moses J
-- Project: Global Electronics EDA
-- Description: Key SQL queries to extract insights
-- ==========================================================

-- 1. Top 5 customers by total spending
SELECT c.Name, c.Country,
       SUM(s.Quantity * p."Unit Price USD") AS Total_Spent
FROM Sales s
JOIN Customers c ON s.CustomerKey = c.CustomerKey
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY c.Name, c.Country
ORDER BY Total_Spent DESC
LIMIT 5;

-- 2. Top 5 products by revenue
SELECT p."Product Name", p.Category,
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY p."Product Name", p.Category
ORDER BY Revenue DESC
LIMIT 5;

-- 3. Top 5 stores by revenue
SELECT st.State, st.Country,
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Stores st ON s.StoreKey = st.StoreKey
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY st.State, st.Country
ORDER BY Revenue DESC
LIMIT 5;

-- 4. Total revenue by product category
SELECT p.Category,
       SUM(s.Quantity * p."Unit Price USD") AS Total_Revenue
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY Total_Revenue DESC;

-- 5. Monthly revenue trend
SELECT strftime('%Y-%m', s."Order Date") AS Month,
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY Month
ORDER BY Month;

-- 6. Average order value (AOV)
SELECT AVG(Order_Total) AS Avg_Order_Value
FROM (
    SELECT s."Order Number",
           SUM(s.Quantity * p."Unit Price USD") AS Order_Total
    FROM Sales s
    JOIN Products p ON s.ProductKey = p.ProductKey
    GROUP BY s."Order Number"
);

-- 7. Top 5 countries by revenue
SELECT c.Country,
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Customers c ON s.CustomerKey = c.CustomerKey
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY c.Country
ORDER BY Revenue DESC
LIMIT 5;

-- 8. Profit margin by category
SELECT p.Category,
       SUM(s.Quantity * (p."Unit Price USD" - p."Unit Cost USD")) AS Profit
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY Profit DESC;

-- 9. Customer demographics - gender-based revenue
SELECT c.Gender,
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Customers c ON s.CustomerKey = c.CustomerKey
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY c.Gender;

-- 10. Currency impact - total sales by currency
SELECT s."Currency Code",
       SUM(s.Quantity * p."Unit Price USD") AS Revenue
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY s."Currency Code"
ORDER BY Revenue DESC;

