USE pandas_datasets;

-- find top 10 highest revenue generating products 
SELECT product_id, sum(sale_price) as total_sales
FROM df_orders
GROUP BY product_id
ORDER BY total_sales desc
LIMIT 10;


-- find top 5 highest selling products in each region
WITH RankedSales as (
SELECT region,  product_id, sum(sale_price) as total_sales, ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(sale_price) DESC) AS rn
FROM df_orders
GROUP BY region, product_id
ORDER BY region, total_sales)

SELECT * 
FROM RankedSales
WHERE rn <= 5
ORDER BY region, total_sales desc;


-- find month over month growth comparison for 2022 vs 2023 sales: jan 2022 vs jan 2023
WITH CTE as (
SELECT year(order_date) as order_year, month(order_date) as order_month, sum(sale_price) as sales
FROM df_orders
GROUP BY order_year, order_month)

SELECT order_month, 
	   sum(case when order_year =  2022 then sales else 0 end) sales_2022, 
       sum(case when order_year =  2023 then sales else 0 end) sales_2023
FROM CTE 
GROUP BY order_month
ORDER BY order_month;


-- for each category which month had the highest sales 
WITH CategorySales as (
SELECT category,  
	   format(order_date, 'yyyyMM') as order_year_month, 
       sum(sale_price) as total_sales, 
       ROW_NUMBER() OVER (PARTITION BY category ORDER BY sum(sale_price) DESC) AS rn
FROM df_orders
GROUP BY category, format(order_date, 'yyyyMM'))

SELECT * 
FROM CategorySales
WHERE rn = 1
ORDER BY category, total_sales desc;


-- show sub categories having the highest growth by profit in 2023 compare to 2022
WITH CTE as (
SELECT sub_category, year(order_date) as order_year, sum(sale_price) as sales
FROM df_orders
GROUP BY sub_category, order_year)

,CTE2 as (
SELECT sub_category, 
	   sum(case when order_year =  2022 then sales else 0 end) sales_2022, 
       sum(case when order_year =  2023 then sales else 0 end) sales_2023
FROM CTE 
GROUP BY sub_category
ORDER BY sub_category)

SELECT *, (sales_2023 - sales_2022)*100/sales_2022 as profit_growth
FROM  CTE2
ORDER BY profit_growth desc;