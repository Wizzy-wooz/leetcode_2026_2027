-- 1990. Count the Number of Experiments
-- https://leetcode.com/problems/count-the-number-of-experiments/
--
-- Experiments(experiment_id, platform, experiment_name)
-- Write a solution to report the number of experiments done on each of the three platforms for
-- each of the three given experiments. Notice that all the pairs of (platform, experiment) should
-- be included in the output including the pairs with zero experiments.
-- Return the result table in any order.
-- The result format is in the following example.

WITH P AS (
  SELECT
    'Android' AS platform
  UNION
  SELECT
    'IOS'
  UNION
  SELECT
    'Web'
), Exp AS (
  SELECT
    'Reading' AS experiment_name
  UNION
  SELECT
    'Sports'
  UNION
  SELECT
    'Programming'
), T AS (
  SELECT
    *
  FROM P, Exp
)
SELECT
  platform,
  experiment_name,
  COUNT(experiment_id) AS num_experiments
FROM T AS t
LEFT JOIN Experiments
  USING (platform, experiment_name)
GROUP BY
  1,
  2;
