-- ===============================================
-- The E-Store Sample Database
-- For SQL Learning At Advanced Level
-- This script sets up the full database for all advanced exercises.								
-- It MUST be run in a PostgreSQL environment (like db-fiddle.com).								
-- ================================================

-- ================================================
-- ADD EXTENSIONS (for GIS)
-- ================================================

CREATE EXTENSION IF NOT EXISTS postgis;

-- ================================================
--CREATING TABLES
-- ================================================

CREATE TABLE Customers (								
customer_id SERIAL PRIMARY KEY,								
name TEXT,								
email TEXT UNIQUE,								
join_date DATE								
);								
								
CREATE TABLE Products (								
product_id SERIAL PRIMARY KEY,								
product_name TEXT,								
category TEXT,								
price REAL,								
stock_quantity INTEGER,								
specs JSONB -- For Module 6								
);								
								
CREATE TABLE Inventory (								
inventory_id SERIAL PRIMARY KEY,								
product_id INTEGER REFERENCES Products(product_id),								
warehouse_id INTEGER, -- Will reference Warehouses table								
quantity_on_hand INTEGER NOT NULL,								
UNIQUE(product_id, warehouse_id)								
);								
								
CREATE TABLE Warehouses (								
warehouse_id SERIAL PRIMARY KEY,								
city TEXT NOT NULL,								
location GEOMETRY(Point, 4326) -- For Module 6								
);								
								
CREATE TABLE Orders (								
order_id SERIAL PRIMARY KEY,								
customer_id INTEGER REFERENCES Customers(customer_id),								
order_date TIMESTAMPTZ,								
status TEXT								
);								
								
CREATE TABLE Order_Items (								
order_item_id SERIAL PRIMARY KEY,								
order_id INTEGER REFERENCES Orders(order_id),								
product_id INTEGER REFERENCES Products(product_id),								
quantity INTEGER,								
price_at_time REAL								
);								
								
-- Audit table for Module 3								
CREATE TABLE Product_Price_History (								
history_id SERIAL PRIMARY KEY,								
product_id INTEGER,								
old_price REAL,								
new_price REAL,								
changed_at TIMESTAMPTZ DEFAULT now()								
);								
								
-- Data Warehouse tables for Module 5								
CREATE TABLE Dim_Customer (								
customer_key SERIAL PRIMARY KEY,								
customer_id INTEGER, -- Source ID								
name TEXT,								
email TEXT								
);								
								
CREATE TABLE Dim_Product (								
product_key SERIAL PRIMARY KEY,								
product_id INTEGER, -- Source ID								
product_name TEXT,								
category TEXT								
);								
								
CREATE TABLE Fact_Sales (								
sale_id SERIAL PRIMARY KEY,								
order_id INTEGER,								
customer_key INTEGER REFERENCES Dim_Customer(customer_key),								
product_key INTEGER REFERENCES Dim_Product(product_key),								
order_date_key INTEGER, -- e.g., 20251001								
revenue REAL,								
quantity INTEGER								
);			

-- ================================================
-- INSERTING SAMPLE DATA
-- ================================================


INSERT INTO Customers (name, email, join_date) VALUES								
('Alice Smith', 'alice@email.com', '2024-01-15'),								
('Bob Johnson', 'bob@email.com', '2024-02-20');								
								
INSERT INTO Products (product_name, category, price, stock_quantity, specs) VALUES								
('Laptop', 'Electronics', 1500.00, 50, '{"color": "silver", "weight_kg": 2.1, "ports": ["usb-c", "hdmi"]}'),								
('Mouse', 'Electronics', 75.00, 200, '{"color": "black", "wireless": true}'),								
('Coffee Cup', 'Homeware', 25.00, 500, '{"material": "ceramic", "capacity_oz": 12}');								
								
INSERT INTO Warehouses (city, location) VALUES								
('New York', ST_SetSRID(ST_MakePoint(-74.0060, 40.7128), 4326)),								
('Los Angeles', ST_SetSRID(ST_MakePoint(-118.2437, 34.0522), 4326));								
								
INSERT INTO Inventory (product_id, warehouse_id, quantity_on_hand) VALUES								
(1, 1, 30), (1, 2, 20), (2, 1, 150), (2, 2, 50), (3, 1, 500);								
								
-- Insert a series of orders for Gap-and-Islands analysis								
INSERT INTO Orders (customer_id, order_date, status) VALUES								
(1, '2025-10-01 09:00:00', 'Shipped'),								
(2, '2025-10-02 10:00:00', 'Shipped'),								
(1, '2025-10-04 11:00:00', 'Shipped'), -- 1-day gap								
(1, '2025-10-05 14:00:00', 'Shipped'),								
(2, '2025-10-06 15:00:00', 'Shipped'),								
(1, '2025-10-08 10:00:00', 'Processing'); -- 1-day gap								
								
-- Populate Dim tables								
INSERT INTO Dim_Customer (customer_id, name, email)								
SELECT customer_id, name, email FROM Customers;								
								
INSERT INTO Dim_Product (product_id, product_name, category)								
SELECT product_id, product_name, category FROM Products;


-- ================================================
-- DATABASE READY FOR USE
-- ================================================													