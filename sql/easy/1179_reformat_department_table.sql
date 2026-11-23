-- 1179. Reformat Department Table
-- https://leetcode.com/problems/reformat-department-table/
--
-- Department(id, revenue, month)
-- Reformat the table such that there is a department id column and a revenue column for each
-- month.
-- Return the result table in any order.

SELECT
  id,
  SUM(CASE month WHEN 'Jan' THEN revenue END) AS Jan_Revenue,
  SUM(CASE month WHEN 'Feb' THEN revenue END) AS Feb_Revenue,
  SUM(CASE month WHEN 'Mar' THEN revenue END) AS Mar_Revenue,
  SUM(CASE month WHEN 'Apr' THEN revenue END) AS Apr_Revenue,
  SUM(CASE month WHEN 'May' THEN revenue END) AS May_Revenue,
  SUM(CASE month WHEN 'Jun' THEN revenue END) AS Jun_Revenue,
  SUM(CASE month WHEN 'Jul' THEN revenue END) AS Jul_Revenue,
  SUM(CASE month WHEN 'Aug' THEN revenue END) AS Aug_Revenue,
  SUM(CASE month WHEN 'Sep' THEN revenue END) AS Sep_Revenue,
  SUM(CASE month WHEN 'Oct' THEN revenue END) AS Oct_Revenue,
  SUM(CASE month WHEN 'Nov' THEN revenue END) AS Nov_Revenue,
  SUM(CASE month WHEN 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY
  1;
