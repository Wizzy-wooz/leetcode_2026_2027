-- 2010. The Number of Seniors and Juniors to Join the Company II
-- https://leetcode.com/problems/the-number-of-seniors-and-juniors-to-join-the-company-ii/
--
-- Candidates(employee_id, experience, salary)
-- A company wants to hire new employees. The budget of the company for the salaries is $70000.
-- The company's criteria for hiring are:
-- Keep hiring the senior with the smallest salary until you cannot hire any more seniors.
-- Use the remaining budget to hire the junior with the smallest salary.
-- Keep hiring the junior with the smallest salary until you cannot hire any more juniors.
-- Write a solution to find the ids of seniors and juniors hired under the mentioned criteria.
-- Return the result table in any order.
-- The result format is in the following example.

WITH s AS (
  SELECT
    employee_id,
    SUM(salary) OVER (ORDER BY salary NULLS FIRST, employee_id NULLS FIRST) AS cur
  FROM Candidates
  WHERE
    experience = 'Senior'
), j AS (
  SELECT
    employee_id,
    COALESCE((
      SELECT
        MAX(cur)
      FROM s
      WHERE
        cur <= 70000
    ), 0) + SUM(salary) OVER (ORDER BY salary NULLS FIRST, employee_id NULLS FIRST) AS cur
  FROM Candidates
  WHERE
    experience = 'Junior'
)
SELECT
  employee_id
FROM s
WHERE
  cur <= 70000
UNION
SELECT
  employee_id
FROM j
WHERE
  cur <= 70000;
