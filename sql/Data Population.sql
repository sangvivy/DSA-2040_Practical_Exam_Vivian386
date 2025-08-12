SHOW TABLES;
-- Populate dim_time
INSERT INTO dim_time VALUES
(20240101, '2024-01-01', 1, 1, 1, 2024, 1, 0),
(20240215, '2024-02-15', 15, 2, 1, 2024, 4, 0),
(20240410, '2024-04-10', 10, 4, 2, 2024, 3, 0),
(20240720, '2024-07-20', 20, 7, 3, 2024, 6, 1);

-- Populate dim_product
INSERT INTO dim_product VALUES
(1, 'ELEC001', 'Smartphone X', 'Electronics', 'Phones', 'TechBrand', 'piece', 300.00, 500.00),
(2, 'ELEC002', 'Laptop Pro', 'Electronics', 'Computers', 'CompTech', 'piece', 800.00, 1200.00),
(3, 'CLOT001', 'T-Shirt Cotton', 'Clothing', 'Tops', 'FashionCo', 'piece', 5.00, 15.00),
(4, 'CLOT002', 'Jeans Slim Fit', 'Clothing', 'Bottoms', 'DenimWorld', 'piece', 20.00, 45.00);

-- Populate dim_customer
INSERT INTO dim_customer VALUES
(1, 'Alice', 'Johnson', 'Female', '1990-05-14', '25-34', 'alice@example.com', '555-1234', 'Central', 'Nairobi'),
(2, 'Bob', 'Smith', 'Male', '1985-09-23', '35-44', 'bob@example.com', '555-5678', 'Coast', 'Mombasa'),
(3, 'Carol', 'Adams', 'Female', '2000-03-10', '18-24', 'carol@example.com', '555-8765', 'Rift Valley', 'Nakuru');

-- Populate dim_store
INSERT INTO dim_store VALUES
(1, 'Downtown Store', 'Central', 'Nairobi', 'Retail'),
(2, 'Coastal Mall', 'Coast', 'Mombasa', 'Retail');

-- Populate fact_sales
INSERT INTO sales_fact (time_id, product_id, customer_id, store_id, quantity_sold, unit_price, sales_amount, discount, cost_amount, payment_method, transaction_id) VALUES
(20240101, 1, 1, 1, 2, 500.00, 1000.00, 0.00, 600.00, 'Credit Card', 'TXN001'),
(20240215, 2, 2, 1, 1, 1200.00, 1200.00, 50.00, 800.00, 'Cash', 'TXN002'),
(20240410, 3, 3, 2, 5, 15.00, 75.00, 0.00, 25.00, 'Mobile Money', 'TXN003'),
(20240720, 4, 1, 2, 3, 45.00, 135.00, 10.00, 60.00, 'Debit Card', 'TXN004');




