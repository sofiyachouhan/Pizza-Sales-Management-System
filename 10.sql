-- Group the orders by date and calculate the average number of
-- pizzas ordered per day . 



SELECT 
    ROUND(AVG(quantity), 0) as avg_pizza_ordered_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_detils.quantity) AS quantity
    FROM
        orders
    JOIN order_detils ON orders.order_id = order_detils.order_id
    GROUP BY orders.order_date) AS order_quantity;
