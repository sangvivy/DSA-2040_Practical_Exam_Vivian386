-- rollup_sales.sql
SELECT 
    c.Country, 
    t.Year, 
    t.Quarter, 
    SUM(f.TotalSales) AS TotalSales
FROM SalesFact f
JOIN CustomerDim c ON f.CustomerID = c.CustomerID
JOIN TimeDim t ON f.TimeID = t.TimeID
GROUP BY c.Country, t.Year, t.Quarter
ORDER BY c.Country, t.Year, t.Quarter;

-- drilldown_sales_uk.sql
SELECT 
    t.Year, 
    t.Month, 
    SUM(f.TotalSales) AS TotalSales
FROM SalesFact f
JOIN CustomerDim c ON f.CustomerID = c.CustomerID
JOIN TimeDim t ON f.TimeID = t.TimeID
WHERE c.Country = 'UK'
GROUP BY t.Year, t.Month
ORDER BY t.Year, t.Month;

-- slice_electronics.sql
SELECT 
    t.Year, 
    t.Month, 
    SUM(f.TotalSales) AS TotalSales
FROM SalesFact f
JOIN TimeDim t ON f.TimeID = t.TimeID
WHERE f.Category = 'Electronics'
GROUP BY t.Year, t.Month
ORDER BY t.Year, t.Month;
