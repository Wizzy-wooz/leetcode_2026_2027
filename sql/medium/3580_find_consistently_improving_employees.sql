-- 3580. Find Consistently Improving Employees
-- https://leetcode.com/problems/find-consistently-improving-employees/
--
-- employees(employee_id, name)
-- performance_reviews(review_id, employee_id, review_date, rating)
-- Write a solution to find employees who have consistently improved their performance over their
-- last three reviews.
-- An employee must have at least 3 review to be considered
-- The employee's last 3 reviews must show strictly increasing ratings (each review better than
-- the previous)
-- Use the most recent 3 reviews based on review_date for each employee
-- Calculate the improvement score as the difference between the latest rating and the earliest
-- rating among the last 3 reviews
-- Return the result table ordered by improvement score in descending order, then by name in
-- ascending order.

WITH recent AS (
  SELECT
    employee_id,
    review_date,
    ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rn,
    (
      LAG(rating) OVER (PARTITION BY employee_id ORDER BY review_date DESC) - rating
    ) AS delta
  FROM performance_reviews
)
SELECT
  employee_id,
  name,
  SUM(delta) AS improvement_score
FROM recent
JOIN employees
  USING (employee_id)
WHERE
  rn > 1 AND rn <= 3
GROUP BY
  1,
  name
HAVING
  COUNT(*) = 2 AND MIN(delta) > 0
ORDER BY
  3 DESC,
  2 NULLS FIRST;
