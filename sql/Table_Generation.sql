USE dsa2040_schema;

-- Drop fact table first (it references all dims)
DROP TABLE IF EXISTS fact_sales;

-- Now drop dimension tables
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_time;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_store;


-- Time dimension
CREATE TABLE dim_time (
  time_id INT PRIMARY KEY,
  date DATE NOT NULL,
  day INT,
  month INT,
  quarter INT,
  year INT,
  weekday INT,
  is_weekend BOOLEAN
) ENGINE=InnoDB;

-- Product dimension
CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  product_sku VARCHAR(50) UNIQUE,
  product_name VARCHAR(255) NOT NULL,
  category VARCHAR(100),
  sub_category VARCHAR(100),
  brand VARCHAR(100),
  unit VARCHAR(50),
  cost_price DECIMAL(10,2),
  list_price DECIMAL(10,2)
) ENGINE=InnoDB;

-- Customer dimension
CREATE TABLE dim_customer (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  gender VARCHAR(20),
  birth_date DATE,
  age_group VARCHAR(50),
  email VARCHAR(255),
  phone VARCHAR(50),
  region VARCHAR(100),
  city VARCHAR(100)
) ENGINE=InnoDB;

-- Store dimension
CREATE TABLE dim_store (
  store_id INT PRIMARY KEY,
  store_name VARCHAR(255),
  region VARCHAR(100),
  city VARCHAR(100),
  store_type VARCHAR(50)
) ENGINE=InnoDB;

-- Sales fact table
CREATE TABLE sales_fact (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  time_id INT NOT NULL,
  product_id INT NOT NULL,
  customer_id INT,
  store_id INT,
  quantity_sold INT NOT NULL DEFAULT 1,
  unit_price DECIMAL(10,2) NOT NULL,
  sales_amount DECIMAL(12,2) NOT NULL,
  discount DECIMAL(10,2) DEFAULT 0.00,
  cost_amount DECIMAL(12,2),
  payment_method VARCHAR(50),
  transaction_id VARCHAR(100),
  FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
) ENGINE=InnoDB;

-- Helpful indexes
CREATE INDEX idx_sales_time ON sales_fact(time_id);
CREATE INDEX idx_sales_product ON sales_fact(product_id);
CREATE INDEX idx_sales_customer ON sales_fact(customer_id);
CREATE INDEX idx_sales_store ON sales_fact(store_id);
CREATE INDEX idx_product_category ON dim_product(category);
CREATE INDEX idx_customer_region ON dim_customer(region);

