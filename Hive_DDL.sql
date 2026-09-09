-- إنشاء قاعدة البيانات إذا لم تكن موجودة
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ecommerce')
BEGIN
    CREATE DATABASE ecommerce;
END
GO

USE ecommerce;
GO

-- =============================================
-- 1. Drop Tables If They Already Exist
-- =============================================
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_date;
GO

-- =============================================
-- 2. Create Dimension Tables
-- =============================================

CREATE TABLE dim_customer (
    customer_id       INT PRIMARY KEY,
    first_name        VARCHAR(100),
    last_name         VARCHAR(100),
    email             VARCHAR(255),
    city              VARCHAR(100),
    country           VARCHAR(100),
    registration_date DATE
);

CREATE TABLE dim_product (
    product_id        INT PRIMARY KEY,
    product_name      VARCHAR(255),
    category          VARCHAR(100),
    price             Double
);

CREATE TABLE dim_date (
    full_date         DATE PRIMARY KEY,
    day_of_month      INT,
    month_number      INT,
    month_name        VARCHAR(50),
    quarter           VARCHAR(50),
    year              INT
);

-- =============================================
-- 3. Create Fact Table (Fact_Sales)
-- =============================================

CREATE TABLE fact_sales (
    order_item_sk     BIGINT PRIMARY KEY,
    order_line_id     VARCHAR(100),
    order_id          INT,
    customer_id       INT,
    order_date        DATE,
    product_id        INT,
    sales_quantity    INT,
    sales_amount      FLOAT,
    payment_status    VARCHAR(50),
    
    -- تعريف المفاتيح الأجنبية
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    CONSTRAINT fk_product  FOREIGN KEY (product_id)  REFERENCES dim_product(product_id),
    CONSTRAINT fk_date     FOREIGN KEY (order_date)  REFERENCES dim_date(full_date)
);
GO