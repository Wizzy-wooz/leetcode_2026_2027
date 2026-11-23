-- 585. Investments in 2016
-- https://leetcode.com/problems/investments-in-2016/
--
-- Insurance(pid, tiv_2015, tiv_2016, lat, lon)
-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all
-- policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute
-- pairs must be unique).
-- Round tiv_2016 to two decimal places.
-- The result format is in the following example.

WITH T AS (
  SELECT
    tiv_2016,
    COUNT(1) OVER (PARTITION BY tiv_2015) AS cnt1,
    COUNT(1) OVER (PARTITION BY lat, lon) AS cnt2
  FROM Insurance
)
SELECT
  ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM T
WHERE
  cnt1 > 1 AND cnt2 = 1;
