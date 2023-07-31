SELECT * FROM superstore_sales;

-- Total Profit

SELECT SUM(Profit) AS total_profit FROM superstore_sales;

-- Total Sales

SELECT SUM(Sales) AS total_sales FROM superstore_sales;

-- Total Units Sold

SELECT SUM(Quantity) AS total_units_sold FROM superstore_sales;

-- Total Orders

SELECT COUNT(DISTINCT Order_ID) AS total_orders FROM superstore_sales;

--Daily Orders Trends

SELECT DATENAME(WEEKDAY, Order_Date) order_day,
	   COUNT(DISTINCT Order_ID) total_orders
FROM superstore_sales
GROUP BY DATENAME(WEEKDAY, Order_Date)
ORDER BY total_orders DESC;

-- Monthly Orders Trends

SELECT DATENAME(MONTH, Order_Date) order_month, 
	   COUNT(DISTINCT Order_ID) total_orders
FROM superstore_sales
GROUP BY DATENAME(MONTH, Order_Date)
ORDER BY total_orders DESC;

-- Percentage of Sales by Product Category

SELECT Category, 
	   CAST(SUM(Sales) * 100 / (SELECT SUM(Sales) FROM superstore_sales) AS DECIMAL(10,2))  AS total_sales_percentage,
	   SUM(Sales) AS total_sales,
	   COUNT(DISTINCT Order_ID) AS total_units_sales
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales_percentage DESC;

-- Percentage of Sales by Region

SELECT Region,
	   CAST(SUM(Sales) * 100 / (SELECT SUM(Sales) FROM superstore_sales) AS DECIMAL(10,2)) AS total_sales_percentage,
	   SUM(Sales) AS total_sales,
	   COUNT(DISTINCT Order_ID) AS total_units_sold
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales_percentage DESC;

-- Percentage of Sales by Segment

SELECT Segment,
	   CAST(SUM(Sales) * 100 / (SELECT SUM(Sales) FROM superstore_sales) AS DECIMAL(10,2)) AS total_sales_percentage,
	   SUM(Sales) AS total_sales,
	   COUNT(DISTINCT Order_ID) AS total_units_sold
FROM superstore_sales
GROUP BY Segment
ORDER BY total_sales_percentage DESC;

-- Top 5 Products By Profit, Sales, Units Sold

SELECT TOP 5 Product_Name, SUM(Profit) AS total_profit
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_profit DESC;

SELECT TOP 5 Product_Name, SUM(Sales) AS total_sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_sales DESC;

SELECT TOP 5 Product_Name, SUM(Quantity) AS total_units_sold
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_units_sold DESC;