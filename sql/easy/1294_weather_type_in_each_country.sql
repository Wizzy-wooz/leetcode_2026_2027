-- 1294. Weather Type in Each Country
-- https://leetcode.com/problems/weather-type-in-each-country/
--
-- Countries(country_id, country_name)
-- Weather(country_id, weather_state, day)
-- Write a solution to find the type of weather in each country for November 2019.
-- The type of weather is:
-- Cold if the average weather_state is less than or equal 15,
-- Hot if the average weather_state is greater than or equal to 25, and
-- Warm otherwise.
-- Return the result table in any order.

SELECT
  country_name,
  CASE
    WHEN AVG(weather_state) <= 15
    THEN 'Cold'
    WHEN AVG(weather_state) >= 25
    THEN 'Hot'
    ELSE 'Warm'
  END AS weather_type
FROM Weather AS w
JOIN Countries
  USING (country_id)
WHERE
  STRFTIME(CAST(day AS TIMESTAMP), '%Y-%m') = '2019-11'
GROUP BY
  1;
