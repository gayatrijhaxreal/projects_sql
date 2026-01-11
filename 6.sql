-- Join the necessary 
-- tables to find the total 
-- quantity of each
-- pizza category ordered.


select pt.category, sum(od.quantity) as quant 
from pizza_types pt join pizzas p
on pt.pizza_type_id = p.pizza_type_id 
join order_details od
on od.pizza_id = p.pizza_id
group by pt.category order by quant desc ;