-- 3328. Find Cities in Each State II
-- https://leetcode.com/problems/find-cities-in-each-state-ii/
--
-- cities(state, city)
-- Write a solution to find all the cities in each state and analyze them based on the following
-- requirements:
-- Combine all cities into a comma-separated string for each state.
-- Only include states that have at least 3 cities.
-- Only include states where at least one city starts with the same letter as the state name.
-- Return the result table ordered by the count of matching-letter cities in descending order and
-- then by state name in ascending order.

SELECT
  state,
  LISTAGG(city, ', '
  ORDER BY
    replace(lower(city), ' ', ''), city) AS cities,
  COUNT(
    CASE
      WHEN LEFT(city, CASE WHEN 1 < 0 THEN 0 ELSE 1 END) = LEFT(state, CASE WHEN 1 < 0 THEN 0 ELSE 1 END)
      THEN 1
    END
  ) AS matching_letter_count
FROM cities
GROUP BY
  1
HAVING
  COUNT(city) >= 3 AND matching_letter_count > 0
ORDER BY
  3 DESC,
  1 NULLS FIRST;
