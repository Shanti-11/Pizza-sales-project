select * from pizza_sales;

-- METRICS
select count(*) from pizza_sales;
select sum(total_price) as total_Revenue from pizza_sales;
select * from pizza_sales;
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct order_id) as total_orders from pizza_sales;
select sum(quantity) / count(distinct order_id) as avg_pizza_per_order from pizza_sales;


-- DAILY TREND
select DAYNAME(order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME( order_date),WEEKDAY(order_date)
ORDER BY WEEKDAY(order_date);


-- HOURLY TREND
select hour(order_time) AS order_hour, count(DISTINCT order_id) AS total_orders
from pizza_sales
group by hour(order_time)
order by hour(order_time);

-- PERCENTAGE OF SALES BY PIZZA CATEGORY
select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
from pizza_sales
group by pizza_category;


-- PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
from pizza_sales
group by pizza_size
order by pizza_size;

-- Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, 
  SUM(quantity) AS Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold DESC
limit 5;

-- Bottom 5 Best Sellers by Total Pizzas Sold
select pizza_name, 
  SUM(quantity) AS Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC
limit 5;


















