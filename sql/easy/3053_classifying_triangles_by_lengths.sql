-- 3053. Classifying Triangles by Lengths
-- https://leetcode.com/problems/classifying-triangles-by-lengths/
--
-- Triangles(A, B, C)
-- Write a query to find the type of triangle. Output one of the following for each row:
-- Equilateral: It's a triangle with 3 sides of equal length.
-- Isosceles: It's a triangle with 2 sides of equal length.
-- Scalene: It's a triangle with 3 sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Return the result table in any order.

SELECT
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A
    THEN 'Not A Triangle'
    WHEN A = B AND B = c
    THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C
    THEN 'Isosceles'
    ELSE 'Scalene'
  END AS triangle_type
FROM Triangles;
