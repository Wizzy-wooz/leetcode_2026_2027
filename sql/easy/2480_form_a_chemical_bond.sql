-- 2480. Form a Chemical Bond
-- https://leetcode.com/problems/form-a-chemical-bond/
--
-- Elements(symbol, type, electrons)
-- Two elements can form a bond if one of them is 'Metal' and the other is 'Nonmetal'.
-- Write a solution to find all the pairs of elements that can form a bond.
-- Return the result table in any order.

SELECT
  a.symbol AS metal,
  b.symbol AS nonmetal
FROM Elements AS a, Elements AS b
WHERE
  a.type = 'Metal' AND b.type = 'Nonmetal';
