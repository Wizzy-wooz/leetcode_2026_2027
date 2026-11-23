-- 2377. Sort the Olympic Table
-- https://leetcode.com/problems/sort-the-olympic-table/
--
-- Olympic(country, gold_medals, silver_medals, bronze_medals)
-- The Olympic table is sorted according to the following rules:
-- The country with more gold medals comes first.
-- If there is a tie in the gold medals, the country with more silver medals comes first.
-- If there is a tie in the silver medals, the country with more bronze medals comes first.
-- If there is a tie in the bronze medals, the countries with the tie are sorted in ascending
-- order lexicographically.
-- Write a solution to sort the Olympic table.

SELECT
  *
FROM Olympic
ORDER BY
  2 DESC,
  3 DESC,
  4 DESC,
  1 NULLS FIRST;
