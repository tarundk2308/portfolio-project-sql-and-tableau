create database portfolio_project;
use portfolio_project;
select* from pizza_sales;

--- total_revenue
select sum(total_price) as total_price from pizza_sales;

--- average order value
select sum(total_price) / count(distinct order_id) as avg_value from pizza_sales;

--- total pizzas sold
select sum(quantity) as total_pizza_sold from pizza_sales;

--- total orders
select count(distinct order_id) as total_orders from pizza_sales;

--- average pizzas per order
select sum(quantity) / count(distinct order_id) as avg_pizza from pizza_sales;

--- hourly trend for pizzas sold
select hour(order_time) as hourly, sum(quantity) as sold_q from pizza_sales group by hour(order_time);

--- weekly trend for orders
select count(distinct order_id),week(str_to_date(order_date,'%d-%m-%Y')) from pizza_sales group by week(str_to_date(order_date,'%d-%m-%Y'));

--- % sales from each category
select (sum(total_price) / (select sum(total_price) from pizza_sales))*100,pizza_category from pizza_sales group by pizza_category;

--- % sales from each size
select (sum(total_price) / (select sum(total_price) from pizza_sales))*100,pizza_size from pizza_sales group by pizza_size;

--- total pizzas sold by category
select sum(quantity),pizza_category from pizza_sales group by pizza_category;

--- top 5 pizzas by revenue
select pizza_name,round(sum(total_price),2) as revenue from pizza_sales group by pizza_name order by revenue desc limit 5;

--- bottom 5 pizzas by revenue
select pizza_name,round(sum(total_price),2) as revenue from pizza_sales group by pizza_name order by revenue asc limit 5;

--- top 5 pizzas by quantity
select pizza_name,sum(quantity) as quantity from pizza_sales group by pizza_name order by quantity desc limit 5;

--- bottom 5 pizzas by quantity
select pizza_name,sum(quantity) as quantity from pizza_sales group by pizza_name order by quantity asc limit 5;

--- top 5 pizzas by total orders
select pizza_name,count(distinct order_id) as total_orders from pizza_sales group by pizza_name order by total_orders desc limit 5;

--- bottom 5 pizzas by total_orders
select pizza_name,count(distinct order_id) as total_orders from pizza_sales group by pizza_name order by total_orders asc limit 5;