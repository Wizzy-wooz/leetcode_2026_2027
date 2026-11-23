-- 1495. Friendly Movies Streamed Last Month
-- https://leetcode.com/problems/friendly-movies-streamed-last-month/
--
-- TVProgram(program_date, content_id, channel)
-- Content(content_id, title, Kids_content, content_type)
-- Write a solution to report the distinct titles of the kid-friendly movies streamed in June
-- 2020.
-- Return the result table in any order.

SELECT DISTINCT
  title
FROM TVProgram
JOIN Content
  USING (content_id)
WHERE
  STRFTIME(CAST(program_date AS TIMESTAMP), '%Y%m') = '202006'
  AND kids_content = 'Y'
  AND content_type = 'Movies';
