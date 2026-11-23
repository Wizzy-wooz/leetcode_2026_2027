-- 2988. Manager of the Largest Department
-- https://leetcode.com/problems/manager-of-the-largest-department/
--
-- Employees(emp_id, emp_name, dep_id, position)
-- Write a solution to find the name of the manager from the largest department. There may be
-- multiple largest departments when the number of employees in those departments is the same.
-- Return the result table sorted by dep_id in ascending order.

WITH T AS (
  SELECT
    dep_id,
    COUNT(1) AS cnt
  FROM Employees
  GROUP BY
    1
)
SELECT
  emp_name AS manager_name,
  t.dep_id
FROM T AS t
JOIN Employees AS e
  ON t.dep_id = e.dep_id AND e.position = 'Manager'
WHERE
  cnt = (
    SELECT
      MAX(cnt)
    FROM T
  )
ORDER BY
  2 NULLS FIRST;
