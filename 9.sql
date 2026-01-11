-- Group the orders by date and calculate the average number of pizzas ordered per day.


select round(avg(quant),0) from 
(select o.date, sum(od.quantity) 
as quant from orders o
join order_details od
on o.order_id = od.order_id
group by o.date
order by o.date
) as order_quant ;