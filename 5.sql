 -- Identify the most common pizza size ordered.
 
-- select count(*) from pizzas;

 
 

SELECT 
    pizzas.size, 
    COUNT(order_detils.order_id) AS order_count
FROM 
    pizzahut.pizzas
JOIN 
    pizzahut.order_detils ON pizzas.pizza_id = order_detils.pizza_id
GROUP BY 
    pizzas.size
ORDER BY 
    order_count DESC;

