-- Olist E-Commerce Marketplace Analytics
-- Business Analysis Queries


-- 1. Total Revenue
SELECT SUM(price) AS total_revenue
FROM order_items;


-- 2. Total Orders
SELECT COUNT(order_id) AS total_orders
FROM orders;


-- 3. Unique Customers
SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;


-- 4. Average Order Value
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT order_id,
           SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;


-- 5. Average Product Price
SELECT ROUND(AVG(price), 2) AS average_product_price
FROM order_items;


-- 6. Highest Order Value
SELECT MAX(order_total) AS highest_order_value
FROM (
    SELECT order_id,
           SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;


-- 7. Orders by Customer State
SELECT c.customer_state,
       COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;


-- 8. Revenue by Customer State
SELECT c.customer_state,
       ROUND(SUM(oi.price), 2) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- 9. Orders by Status
SELECT order_status,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 10. Payment Method Distribution
SELECT payment_type,
       COUNT(*) AS payment_count,
       ROUND(SUM(payment_value), 2) AS total_payment_value
FROM payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;

-- 11. Top Product Categories

SELECT p.product_category_name,
       COUNT(*) AS total_items
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items DESC
LIMIT 10;

-- 12. Revenue by Product Category

SELECT p.product_category_name,
       ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 13. Top Sellers by Items Sold

SELECT seller_id,
       COUNT(*) AS items_sold
FROM order_items
GROUP BY seller_id
ORDER BY items_sold DESC
LIMIT 10;

-- 14. Top Sellers by Revenue

SELECT seller_id,
       ROUND(SUM(price), 2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 15. Average Review Score

SELECT ROUND(AVG(review_score), 2) AS average_review_score
FROM reviews;

-- 16. Review Score Distribution

SELECT review_score,
       COUNT(*) AS review_count
FROM reviews
GROUP BY review_score
ORDER BY review_score;

-- 17. Orders by Payment Type

SELECT payment_type,
       COUNT(DISTINCT order_id) AS total_orders
FROM payments
GROUP BY payment_type
ORDER BY total_orders DESC;

-- 18. Average Installments by Payment Type

SELECT payment_type,
       ROUND(AVG(payment_installments), 2) AS average_installments
FROM payments
GROUP BY payment_type
ORDER BY average_installments DESC;

-- 19. Orders by Month

SELECT DATE_TRUNC('month', order_purchase_timestamp) AS month,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 20. Revenue by Month

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
       ROUND(SUM(oi.price), 2) AS total_revenue
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;