| Table Name | Rows | Columns | Primary Key | Important Columns | Business Meaning |
|---|---:|---:|---|---|---|
| orders |  |  | order_id | order_status, purchase date, delivered date | Tracks order lifecycle |
| order_items |  |  | order_id + order_item_id | product_id, seller_id, price, freight_value | Item-level revenue and seller data |
| payments |  |  | order_id | payment_type, installments, payment_value | Payment behavior |
| reviews |  |  | review_id | review_score, comments | Customer satisfaction |
| customers |  |  | customer_id | customer_unique_id, state, city | Customer location |
| products |  |  | product_id | category, weight, dimensions | Product information |
| sellers |  |  | seller_id | seller_state, seller_city | Seller location |