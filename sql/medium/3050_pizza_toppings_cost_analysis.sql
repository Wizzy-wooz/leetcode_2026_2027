-- 3050. Pizza Toppings Cost Analysis
-- https://leetcode.com/problems/pizza-toppings-cost-analysis/
--
-- Toppings(topping_name, cost)
-- Write a solution to calculate the total cost of all possible 3-topping pizza combinations from
-- a given list of toppings. The total cost of toppings must be rounded to 2 decimal places.
-- Note:
-- Do not include the pizzas where a topping is repeated. For example, ‘Pepperoni, Pepperoni,
-- Onion Pizza’.
-- Toppings must be listed in alphabetical order. For example, 'Chicken, Onions, Sausage'. 'Onion,
-- Sausage, Chicken' is not acceptable.
-- Return the result table ordered by total cost in descending order and combination of toppings
-- in ascending order.

WITH T AS (
  SELECT
    *,
    RANK() OVER (ORDER BY topping_name NULLS FIRST) AS rk
  FROM Toppings
)
SELECT
  t1.topping_name || ',' || t2.topping_name || ',' || t3.topping_name AS pizza,
  t1.cost + t2.cost + t3.cost AS total_cost
FROM T AS t1
JOIN T AS t2
  ON t1.rk < t2.rk
JOIN T AS t3
  ON t2.rk < t3.rk
ORDER BY
  2 DESC,
  1 ASC NULLS FIRST;
