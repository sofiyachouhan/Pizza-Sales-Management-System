-- analyze the cumulative revenue genrated over time .

SELECT order_date, 
       SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue
FROM (
    SELECT orders.order_date, 
           SUM(order_detils.quantity * pizzas.price) AS revenue
    FROM order_detils
    JOIN pizzas ON order_detils.pizza_id = pizzas.pizza_id
    JOIN orders ON orders.order_id = order_detils.order_id
    GROUP BY orders.order_date
) AS sales;


