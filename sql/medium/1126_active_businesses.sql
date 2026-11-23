-- 1126. Active Businesses
-- https://leetcode.com/problems/active-businesses/
--
-- Events(business_id, event_type, occurrences)
-- The average activity for a particular event_type is the average occurrences across all
-- companies that have this event.
-- An active business is a business that has more than one event_type such that their occurrences
-- is strictly greater than the average activity for that event.
-- Write a solution to find all active businesses.
-- Return the result table in any order.

SELECT
  business_id
FROM EVENTS AS t1
JOIN (
  SELECT
    event_type,
    AVG(occurrences) AS occurrences
  FROM EVENTS
  GROUP BY
    event_type
) AS t2
  ON t1.event_type = t2.event_type
WHERE
  t1.occurrences > t2.occurrences
GROUP BY
  business_id
HAVING
  COUNT(1) > 1;
