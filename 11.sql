-- Determine the top 3 most ordered pizza type based on revenue. 


SELECT 
    pizza_types.name,
    SUM(order_detils.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_detils ON order_detils.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;