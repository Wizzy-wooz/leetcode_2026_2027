-- 3764. Most Common Course Pairs
-- https://leetcode.com/problems/most-common-course-pairs/
--
-- course_completions(user_id, course_id, course_name, completion_date, course_rating)
-- Write a solution to identify skill mastery pathways by analyzing course completion sequences
-- among top-performing students:
-- Consider only top-performing students (those who completed at least 5 courses with an average
-- rating of 4 or higher).
-- For each top performer, identify the sequence of courses they completed in chronological order.
-- Find all consecutive course pairs (Course A → Course B) taken by these students.
-- Return the pair frequency, identifying which course transitions are most common among high
-- achievers.
-- Return the result table ordered by pair frequency in descending order and then by first course
-- name and second course name in ascending order.

WITH top_students AS (
  SELECT
    user_id
  FROM course_completions
  GROUP BY
    user_id
  HAVING
    COUNT(1) >= 5 AND AVG(course_rating) >= 4
), course_pairs AS (
  SELECT
    course_name AS first_course,
    LEAD(course_name) OVER (PARTITION BY user_id ORDER BY completion_date NULLS FIRST) AS second_course
  FROM top_students
  JOIN course_completions
    USING (user_id)
)
SELECT
  *,
  COUNT(1) AS transition_count
FROM course_pairs
WHERE
  NOT second_course IS NULL
GROUP BY
  1,
  2
ORDER BY
  3 DESC,
  1 NULLS FIRST,
  2 NULLS FIRST;
