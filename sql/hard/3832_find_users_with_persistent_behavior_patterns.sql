-- 3832. Find Users with Persistent Behavior Patterns
-- https://leetcode.com/problems/find-users-with-persistent-behavior-patterns/
--
-- activity(user_id, action_date, action)
-- Write a solution to identify behaviorally stable users based on the following definition:
-- A user is considered behaviorally stable if there exists a sequence of at least 5 consecutive
-- days such that: The user performed exactly one action per day during that period.
-- The action is the same on all those consecutive days.
-- If a user has multiple qualifying sequences, only consider the sequence with the maximum
-- length.
-- If multiple qualifying sequences have the same maximum length, consider the sequence with the
-- lexicographically smallest action. If there is still a tie, consider the sequence with the
-- latest start date.
-- Return the result table ordered by streak_length in descending order, then by user_id in
-- ascending order.

WITH daily_counts AS (
  /* Step 1: Filter user dates with exactly one record per day (meeting the requirement of "exactly one action per day") */
  SELECT
    user_id,
    action_date,
    action,
    COUNT(*) OVER (PARTITION BY user_id, action_date) AS cnt
  FROM activity
), filtered_activity AS (
  /* Step 2: Filter out data with multiple actions on the same day */
  SELECT
    user_id,
    action_date,
    action
  FROM daily_counts
  WHERE
    cnt = 1
), streak_groups AS (
  /* Step 3: Group consecutive dates using the method of subtracting row number from date */
  SELECT
    user_id,
    action,
    action_date,
    action_date - INTERVAL (ROW_NUMBER() OVER (PARTITION BY user_id, action ORDER BY action_date NULLS FIRST)) DAY AS grp
  FROM filtered_activity
), streak_summary AS (
  /* Step 4: Calculate the length of each consecutive segment and only keep records with length >= 5 */
  SELECT
    user_id,
    action,
    COUNT(*) AS streak_length,
    MIN(action_date) AS start_date,
    MAX(action_date) AS end_date,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY COUNT(*) DESC) AS rnk /* Sort different streaks for each user to facilitate getting the maximum value later */
  FROM streak_groups
  GROUP BY
    user_id,
    action,
    grp
  HAVING
    streak_length >= 5
)
/* Step 5: Extract the longest record for each qualified user and sort */
SELECT
  user_id,
  action,
  streak_length,
  start_date,
  end_date
FROM streak_summary
WHERE
  rnk = 1
ORDER BY
  streak_length DESC,
  user_id ASC NULLS FIRST;
