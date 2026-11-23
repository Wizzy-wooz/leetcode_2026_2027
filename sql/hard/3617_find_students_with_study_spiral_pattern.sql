-- 3617. Find Students with Study Spiral Pattern
-- https://leetcode.com/problems/find-students-with-study-spiral-pattern/
--
-- students(student_id, student_name, major)
-- study_sessions(session_id, student_id, subject, session_date, hours_studied)
-- Write a solution to find students who follow the Study Spiral Pattern - students who
-- consistently study multiple subjects in a rotating cycle.
-- A Study Spiral Pattern means a student studies at least 3 different subjects in a repeating
-- sequence
-- The pattern must repeat for at least 2 complete cycles (minimum 6 study sessions)
-- Sessions must be consecutive dates with no gaps longer than 2 days between sessions
-- Calculate the cycle length (number of different subjects in the pattern)
-- Calculate the total study hours across all sessions in the pattern
-- Only include students with cycle length of at least 3 subjects
-- Return the result table ordered by cycle length in descending order, then by total study hours
-- in descending order.

WITH ranked_sessions AS (
  SELECT
    ss.student_id,
    ss.session_id,
    ss.session_date,
    ss.subject,
    ss.hours_studied,
    DATE_DIFF(
      'DAY',
      LAG(ss.session_date) OVER (
        PARTITION BY ss.student_id
        ORDER BY ss.session_date NULLS FIRST, ss.session_id NULLS FIRST
      ),
      ss.session_date
    ) AS date_diff,
    ROW_NUMBER() OVER (
      PARTITION BY ss.student_id
      ORDER BY ss.session_date NULLS FIRST, ss.session_id NULLS FIRST
    ) AS session_index
  FROM study_sessions AS ss
), contiguous_students AS (
  SELECT
    student_id
  FROM ranked_sessions
  GROUP BY
    student_id
  HAVING
    SUM(CASE WHEN date_diff > 2 THEN 1 ELSE 0 END) = 0
), student_stats AS (
  SELECT
    r.student_id,
    COUNT(*) AS session_count,
    COUNT(DISTINCT r.subject) AS cycle_length,
    SUM(r.hours_studied) AS total_hours
  FROM ranked_sessions AS r
  JOIN contiguous_students AS c
    ON c.student_id = r.student_id
  GROUP BY
    r.student_id
  HAVING
    cycle_length >= 3
    AND session_count >= cycle_length * 2
    AND session_count % NULLIF(cycle_length, 0) = 0
)
SELECT
  s.student_id,
  s.student_name,
  s.major,
  st.cycle_length,
  st.total_hours AS total_study_hours
FROM student_stats AS st
JOIN students AS s
  ON s.student_id = st.student_id
WHERE
  NOT EXISTS(
    SELECT
      1
    FROM ranked_sessions AS cur
    JOIN ranked_sessions AS cyc
      ON cyc.student_id = cur.student_id
      AND cyc.session_index = (
        cur.session_index - 1
      ) % NULLIF(st.cycle_length, 0) + 1
    WHERE
      cur.student_id = st.student_id
      AND NOT (
        cur.subject IS NOT DISTINCT FROM cyc.subject
      )
  )
ORDER BY
  st.cycle_length DESC,
  st.total_hours DESC;
