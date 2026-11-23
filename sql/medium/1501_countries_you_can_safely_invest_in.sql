-- 1501. Countries You Can Safely Invest In
-- https://leetcode.com/problems/countries-you-can-safely-invest-in/
--
-- Person(id, name, phone_number)
-- Country(name, country_code)
-- Calls(caller_id, callee_id, duration)
-- A telecommunications company wants to invest in new countries. The company intends to invest in
-- the countries where the average call duration of the calls in this country is strictly greater
-- than the global average call duration.
-- Write a solution to find the countries where this company can invest.
-- Return the result table in any order.

SELECT
  country
FROM (
  SELECT
    c.name AS country,
    AVG(duration) AS duration
  FROM Person
  JOIN Calls
    ON id IN (caller_id, callee_id)
  JOIN Country AS c
    ON LEFT(phone_number, CASE WHEN 3 < 0 THEN 0 ELSE 3 END) = country_code
  GROUP BY
    1
) AS t
WHERE
  duration > (
    SELECT
      AVG(duration)
    FROM Calls
  );
