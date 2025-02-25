-- Calculate the precentage contribution of each pizza type to 
-- total revenue. 

select pizza_types. category,
round(sum(order_detils. quantity * pizzas.price) / (select
	ROUND(sum(order_detils.quantity * pizzas.price),
    2) as total_sales
from 
  order_detils 
  join 
  pizzas on pizzas.pizza_id = order_detils.pizza_id) *100,2)as 
  revenue 
  from pizza_types join pizzas
  on pizza_types.pizza_type_id = pizzas.pizza_type_id
  join order_detils
  on order_detils.pizza_id = pizzas.pizza_id
  group by pizza_types.category order by revenue desc;