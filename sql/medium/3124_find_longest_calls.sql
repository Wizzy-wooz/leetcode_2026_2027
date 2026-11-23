-- 3124. Find Longest Calls
-- https://leetcode.com/problems/find-longest-calls/
--
-- Contacts(id, first_name, last_name)
-- Calls(contact_id, type, duration)
-- Write a solution to find the three longest incoming and outgoing calls.
-- Return the result table ordered by type, duration, and first_name in descending order and
-- duration must be formatted as HH:MM:SS.

SELECT
  first_name,
  type,
  PRINTF('%02d:%02d:%02d', duration // 3600, (
    duration // 60
  ) % 60, duration % 60) AS duration_formatted
FROM Calls
JOIN Contacts
  ON contact_id = id
QUALIFY
  ROW_NUMBER() OVER (PARTITION BY type ORDER BY duration DESC, first_name) <= 3
ORDER BY
  type DESC,
  duration DESC,
  first_name;
