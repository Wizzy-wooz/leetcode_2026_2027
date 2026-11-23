-- 1468. Calculate Salaries
-- https://leetcode.com/problems/calculate-salaries/
--
-- Salaries(company_id, employee_id, employee_name, salary)
-- Find the salaries of the employees after applying taxes. Round the salary to the nearest
-- integer.
-- The tax rate is calculated for each company based on the following criteria:
-- 0% If the max salary of any employee in the company is less than $1000.
-- 24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
-- 49% If the max salary of any employee in the company is greater than $10000.
-- Return the result table in any order.

SELECT
  s.company_id,
  employee_id,
  employee_name,
  ROUND(
    CASE
      WHEN top < 1000
      THEN salary
      WHEN top >= 1000 AND top <= 10000
      THEN salary * 0.76
      ELSE salary * 0.51
    END
  ) AS salary
FROM Salaries AS s
JOIN (
  SELECT
    company_id,
    MAX(salary) AS top
  FROM Salaries
  GROUP BY
    company_id
) AS t
  ON s.company_id = t.company_id;
