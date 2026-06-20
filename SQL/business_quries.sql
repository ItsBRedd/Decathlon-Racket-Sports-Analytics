-- =====================================================
-- DECATHLON RACKET SPORTS ANALYTICS PROJECT
-- Business Analysis Queries
-- =====================================================

-- =====================================================
-- Query 1: Business Performance Overview
-- =====================================================

SELECT
    ROUND(SUM(revenue),2) AS Total_Revenue,
    ROUND(SUM(profit),2) AS Total_Profit,
    SUM(quantity) AS Total_Units_Sold
FROM sales;


-- =====================================================
-- Query 2: Top 10 Products by Revenue
-- =====================================================

SELECT
    p.product_name AS Product_Name,
    ROUND(SUM(s.revenue),2) AS Total_Revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC
LIMIT 10;


-- =====================================================
-- Query 3: Revenue by Category
-- =====================================================

SELECT
    p.category AS Category,
    ROUND(SUM(s.revenue),2) AS Total_Revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY Total_Revenue DESC;


-- =====================================================
-- Query 4: Store Performance Analysis
-- =====================================================

SELECT
    st.store_name,
    ROUND(SUM(s.revenue),2) AS Total_Revenue
FROM sales s
JOIN stores st
ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY Total_Revenue DESC;


-- =====================================================
-- Query 5: Monthly Revenue Trend
-- =====================================================

SELECT
    MONTH(sale_date) AS Month_Number,
    ROUND(SUM(revenue),2) AS Total_Revenue
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY Month_Number;


-- =====================================================
-- Query 6: Top 20 Customers by Spending
-- =====================================================

SELECT
    customer_id,
    ROUND(SUM(revenue),2) AS Total_Spending
FROM sales
GROUP BY customer_id
ORDER BY Total_Spending DESC
LIMIT 20;


-- =====================================================
-- Query 7: Inventory Status Distribution
-- =====================================================

SELECT
    stock_status,
    COUNT(*) AS Product_Count
FROM inventory
GROUP BY stock_status;


-- =====================================================
-- Query 8: Products Requiring Reorder
-- =====================================================

SELECT
    COUNT(*) AS Reorder_Required
FROM inventory
WHERE current_stock <= reorder_level;


-- =====================================================
-- Query 9: Average Revenue by Store
-- =====================================================

SELECT
    st.store_name,
    ROUND(AVG(s.revenue),2) AS Average_Revenue
FROM sales s
JOIN stores st
ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY Average_Revenue DESC;


-- =====================================================
-- Query 10: Category Wise Units Sold
-- =====================================================

SELECT
    p.category,
    SUM(s.quantity) AS Units_Sold
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY Units_Sold DESC;


-- =====================================================
-- Query 11: Weekend vs Weekday Sales
-- =====================================================

SELECT
    day_type,
    ROUND(SUM(revenue),2) AS Total_Revenue
FROM sales
GROUP BY day_type;


-- =====================================================
-- Query 12: Peak vs Off-Peak Season Revenue
-- =====================================================

SELECT
    season,
    ROUND(SUM(revenue),2) AS Total_Revenue
FROM sales
GROUP BY season;


-- =====================================================
-- Query 13: Top Revenue Generating Categories by Store
-- =====================================================

SELECT
    st.store_name,
    p.category,
    ROUND(SUM(s.revenue),2) AS Total_Revenue
FROM sales s
JOIN stores st
ON s.store_id = st.store_id
JOIN products p
ON s.product_id = p.product_id
GROUP BY st.store_name, p.category
ORDER BY Total_Revenue DESC;


-- =====================================================
-- Query 14: Products with Low Stock
-- =====================================================

SELECT
    inventory_id,
    product_id,
    current_stock,
    reorder_level,
    stock_status
FROM inventory
WHERE stock_status = 'Low Stock';


-- =====================================================
-- Query 15: Top 5 Most Profitable Products
-- =====================================================

SELECT
    p.product_name,
    ROUND(SUM(s.profit),2) AS Total_Profit
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Profit DESC
LIMIT 5;