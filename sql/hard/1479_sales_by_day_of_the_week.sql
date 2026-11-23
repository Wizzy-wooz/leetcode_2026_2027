-- 1479. Sales by Day of the Week
-- https://leetcode.com/problems/sales-by-day-of-the-week/
--
-- Orders(order_id, customer_id, order_date, item_id, quantity)
-- Items(item_id, item_name, item_category)
-- You are the business owner and would like to obtain a sales report for category items and the
-- day of the week.
-- Write a solution to report how many units in each category have been ordered on each day of the
-- week.
-- Return the result table ordered by category.

SELECT
  item_category AS category,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 1 THEN quantity ELSE 0 END) AS Monday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 2 THEN quantity ELSE 0 END) AS Tuesday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 3 THEN quantity ELSE 0 END) AS Wednesday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 4 THEN quantity ELSE 0 END) AS Thursday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 5 THEN quantity ELSE 0 END) AS Friday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 6 THEN quantity ELSE 0 END) AS Saturday,
  SUM(CASE WHEN DAYOFWEEK(CAST(order_date AS DATE)) = 0 THEN quantity ELSE 0 END) AS Sunday
FROM Orders AS o
RIGHT JOIN Items AS i
  ON o.item_id = i.item_id
GROUP BY
  category
ORDER BY
  category NULLS FIRST;
