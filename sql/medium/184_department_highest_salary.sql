-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/
--
-- Employee(id, name, salary, departmentId)
-- Department(id, name)
-- Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.

SELECT
  d.name AS department,
  e.name AS employee,
  salary
FROM Employee AS e
JOIN Department AS d
  ON e.departmentId = d.id
WHERE
  (d.id, salary) IN (
    SELECT
      departmentId,
      MAX(salary)
    FROM Employee
    GROUP BY
      1
  );
