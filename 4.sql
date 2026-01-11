--Identify the most common pizza size ordered.

select p.size, count(od.order_details_id) as od_count
from pizzas p join order_details od
on p.pizza_id = od.pizza_id 
group by p.size
order by od_count desc ;