--Calculate the percentage contribution of each pizza type to total revenue.

-- select (select pt.category,
-- (sum(od.quantity * p.price)) 
-- as revenue / (select 
-- round(sum(order_details.quantity * pizzas.price), 2) 
-- as total_revenue
-- from order_details join pizzas
-- on pizzas.pizza_id = order_details.pizza_id;)*100 as revenue
-- from pizza_types pt join pizzas p
-- on pt.pizza_type_id = p.pizza_type_id
-- join order_details od 
-- on od.pizza_id = p.pizza_id
-- group by pt.category 
-- order by revenue desc);


SELECT 
    pt.category,
    -- The entire math block comes before the "AS"
    (SUM(od.quantity * p.price) / 
        (SELECT SUM(od2.quantity * p2.price) 
         FROM order_details od2 
         JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id)
    ) * 100 AS percentage_contribution
FROM pizza_types pt
JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY percentage_contribution DESC;
