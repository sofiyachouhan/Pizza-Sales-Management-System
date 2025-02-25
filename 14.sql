-- Determine the top 3 most ordered pizza types 
-- based on revenue for each pizza category.




select name , revenue from 
(select category, name , revenue,
rank() over( partition by category order by revenue desc ) 
as rn 
from 
(select pizza_types.category, pizza_types.name,
sum((order_detils.quantity)* pizzas.price) as revenue 
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_detils
on order_detils.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a)
as b where rn <=3  ;