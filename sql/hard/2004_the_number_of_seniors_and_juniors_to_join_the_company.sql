-- 2004. The Number of Seniors and Juniors to Join the Company
-- https://leetcode.com/problems/the-number-of-seniors-and-juniors-to-join-the-company/
--
-- Candidates(employee_id, experience, salary)
-- A company wants to hire new employees. The budget of the company for the salaries is $70000.
-- The company's criteria for hiring are:
-- Hiring the largest number of seniors.
-- After hiring the maximum number of seniors, use the remaining budget to hire the largest number
-- of juniors.
-- Write a solution to find the number of seniors and juniors hired under the mentioned criteria.
-- Return the result table in any order.

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
  'Senior' AS experience,
  COUNT(employee_id) AS accepted_candidates
FROM s
WHERE
  cur <= 70000
UNION ALL
SELECT
  'Junior' AS experience,
  COUNT(employee_id) AS accepted_candidates
FROM j
WHERE
  cur <= 70000;
