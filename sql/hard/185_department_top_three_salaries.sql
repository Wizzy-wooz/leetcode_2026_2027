-- 185. Department Top Three Salaries
-- https://leetcode.com/problems/department-top-three-salaries/
--
-- Employee(id, name, salary, departmentId)
-- Department(id, name)
-- A company's executives are interested in seeing who earns the most money in each of the
-- company's departments. A high earner in a department is an employee who has a salary in the top
-- three unique salaries for that department.
-- Write a solution to find the employees who are high earners in each of the departments.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  Department.NAME AS Department,
  Employee.NAME AS Employee,
  Salary
FROM Employee, Department
WHERE
  Employee.DepartmentId = Department.Id
  AND (
    SELECT
      COUNT(DISTINCT e2.Salary)
    FROM Employee AS e2
    WHERE
      e2.Salary > Employee.Salary AND Employee.DepartmentId = e2.DepartmentId
  ) < 3;
