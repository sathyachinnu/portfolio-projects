create database pizza;
use pizza;
select * from pizza;

select sum(total_price) as Total_revenue from pizza;

select sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizza;

select sum(quantity) as Total_Pizza_Sold from pizza;

select count(distinct order_id) as Total_orders from pizza;

select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id)as decimal(10,2))
 as decimal(10,2)) as Avg_Pizza_Per_order from pizza;
 
 
set sql_safe_updates = 0;
select * from pizza;
update pizza
set order_date = str_to_date(order_date,'%d-%m-%Y');

alter table pizza
modify order_date date;

select extract(week from order_date) as week_number,year(order_date) as Order_year,
count(distinct order_id)as Total_orders from pizza
group by extract(week from order_date),year(order_date)
order by extract(week from order_date),year(order_date);

 select extract(hour from order_time) as order_hour, sum(quantity) as Total_pizzas_sold
 from pizza
 group by extract(hour from order_time)
 order by extract(hour from order_time);
 
 select pizza_category,sum(total_price) as Total_Sales, sum(total_price)*100/(select sum(total_price) from pizza) as PCT
 from pizza
 group by pizza_category;
 
 select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_Sales , cast(sum(total_price)*100/(select sum(total_price) from pizza)
 as decimal(10,2))as PCT
 from pizza
 group by pizza_size
 order by PCT desc;
 
 select pizza_name ,count(distinct order_id) as Total_Orders from pizza 
 group by pizza_name
 order by total_Orders 
 limit 5;
 
 describe pizza;