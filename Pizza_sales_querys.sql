SELECT *
FROM pizza_sales

SELECT SUM(quantity) AS 'Total Pizza Sold'
FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS 'Average Pizzas Per Order'
FROM pizza_sales

SELECT 
	DATENAME(DW, order_date) AS 'Order Day',
	COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
GROUP BY DATENAME(DW, order_date) -- Whene using aggregat functions allways group by for our category column or date or day not by the aggregate function, in this case is group by DATENAME(DW, order_date)


SELECT 
	DATENAME(MONTH, order_date) AS 'Month Name',
	COUNT(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY 'Total Orders' DESC

SELECT 
	pizza_category,
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS 'Percentage of Sales'
FROM pizza_sales
GROUP BY pizza_category

SELECT 
	pizza_category,
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1), 2) AS 'Percentage of Sales' -- filtered by where MONTH is January
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT 
	pizza_size, 
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS 'Percentage of Sales'
FROM pizza_sales
GROUP BY pizza_size

SELECT 
	pizza_size, 
	ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1),2) AS 'Percentage of Sales'
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size

SELECT 
	pizza_category,
	SUM(quantity) AS 'Total Pizzas Sold'
FROM pizza_sales
GROUP BY pizza_category

SELECT TOP 5
	pizza_name, 
	ROUND(SUM(total_price), 2) AS 'Total Revenue'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Revenue' DESC

SELECT TOP 5
	pizza_name, 
	ROUND(SUM(quantity), 2) AS 'Total Quantity'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Quantity' DESC

SELECT TOP 5
	pizza_name, 
	ROUND(COUNT(DISTINCT order_id), 2) AS 'Total Orders'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Orders' DESC


SELECT TOP 5
	pizza_name, 
	ROUND(SUM(total_price), 2) AS 'Total Revenue'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Revenue' ASC

SELECT TOP 5
	pizza_name, 
	ROUND(SUM(quantity), 2) AS 'Total Quantity'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Quantity' ASC


SELECT TOP 5
	pizza_name, 
	ROUND(COUNT(DISTINCT order_id), 2) AS 'Total Orders'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 'Total Orders' ASC