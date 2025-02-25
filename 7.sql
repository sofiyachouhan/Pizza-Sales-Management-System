 -- Join the nessary tables to find the total
  -- quantity of each pizza category orderd.
 
 
SELECT 
    pizza_types.category, SUM(order_detils.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_detils ON order_detils.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;