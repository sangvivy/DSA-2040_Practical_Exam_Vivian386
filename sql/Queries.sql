-- Total Sales by Product Category per Quarter
SELECT 
    p.category,
    t.quarter,
    SUM(f.sales_amount) AS total_sales
FROM sales_fact f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY p.category, t.quarter
ORDER BY p.category, t.quarter;

-- Top 5 Best-Selling Products by Revenue
SELECT 
    p.product_name,
    SUM(f.sales_amount) AS revenue
FROM sales_fact f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Store Performance – Total Sales by Store and Region
SELECT 
    s.store_name,
    s.region,
    SUM(f.sales_amount) AS total_sales
FROM sales_fact f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.store_name, s.region
ORDER BY total_sales DESC;

