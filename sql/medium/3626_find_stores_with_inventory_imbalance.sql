-- 3626. Find Stores with Inventory Imbalance
-- https://leetcode.com/problems/find-stores-with-inventory-imbalance/
--
-- stores(store_id, store_name, location)
-- inventory(inventory_id, store_id, product_name, quantity, price)
-- Write a solution to find stores that have inventory imbalance - stores where the most expensive
-- product has lower stock than the cheapest product.
-- For each store, identify the most expensive product (highest price) and its quantity
-- For each store, identify the cheapest product (lowest price) and its quantity
-- A store has inventory imbalance if the most expensive product's quantity is less than the
-- cheapest product's quantity
-- Calculate the imbalance ratio as (cheapest_quantity / most_expensive_quantity)
-- Round the imbalance ratio to 2 decimal places
-- Only include stores that have at least 3 different products
-- Return the result table ordered by imbalance ratio in descending order, then by store name in
-- ascending order.

WITH T AS (
  SELECT
    store_id,
    product_name,
    quantity,
    RANK() OVER (PARTITION BY store_id ORDER BY price DESC, quantity DESC) AS rk1,
    RANK() OVER (PARTITION BY store_id ORDER BY price NULLS FIRST, quantity DESC) AS rk2,
    COUNT(1) OVER (PARTITION BY store_id) AS cnt
  FROM inventory
), P1 AS (
  SELECT
    *
  FROM T
  WHERE
    rk1 = 1 AND cnt >= 3
), P2 AS (
  SELECT
    *
  FROM T
  WHERE
    rk2 = 1
)
SELECT
  s.store_id AS store_id,
  store_name,
  location,
  p1.product_name AS most_exp_product,
  p2.product_name AS cheapest_product,
  ROUND(p2.quantity / NULLIF(p1.quantity, 0), 2) AS imbalance_ratio
FROM P1 AS p1
JOIN P2 AS p2
  ON p1.store_id = p2.store_id AND p1.quantity < p2.quantity
JOIN stores AS s
  ON p1.store_id = s.store_id
ORDER BY
  imbalance_ratio DESC,
  store_name NULLS FIRST;
