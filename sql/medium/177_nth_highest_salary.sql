-- 177. Nth Highest Salary
-- https://leetcode.com/problems/nth-highest-salary/
--
-- Employee(id, salary)
-- Write a solution to find the nth highest distinct salary from the Employee table. If there are
-- less than n distinct salaries, return null.

CREATE OR REPLACE MACRO getNthHighestSalary(n) AS (SELECT max(salary) FROM (SELECT salary, dense_rank() OVER (ORDER BY salary DESC) AS pos FROM Employee) ranked WHERE pos = n);
