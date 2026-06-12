CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    store_size_sqft INT,
    monthly_target DECIMAL(12,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(100),
    product_level VARCHAR(20),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age_group VARCHAR(20),
    membership_type VARCHAR(20),
    preferred_sport VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    store_id INT,
    product_id INT,
    customer_id INT,
    quantity INT,
    revenue DECIMAL(10,2),
    profit DECIMAL(10,2),
    day_type VARCHAR(20),
    season VARCHAR(20)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    store_id INT,
    product_id INT,
    current_stock INT,
    reorder_level INT,
    lead_time_days INT,
    stock_status VARCHAR(20)
);
