-- 3198. Find Cities in Each State
-- https://leetcode.com/problems/find-cities-in-each-state/
--
-- cities(state, city)
-- Write a solution to find all the cities in each state and combine them into a single comma-
-- separated string.
-- Return the result table ordered by state and city in ascending order.

SELECT
  state,
  LISTAGG(city, ', '
  ORDER BY
    city NULLS FIRST) AS cities
FROM cities
GROUP BY
  1
ORDER BY
  1 NULLS FIRST;
