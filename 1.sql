SELECT * FROM pizza_types;
select * from order_details;
select * from pizzas;

--Retrieve the total number of orders placed.
select  count(order_id) as total_orders
from orders;

