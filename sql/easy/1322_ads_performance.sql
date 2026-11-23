-- 1322. Ads Performance
-- https://leetcode.com/problems/ads-performance/
--
-- Ads(ad_id, user_id, action)
-- A company is running Ads and wants to calculate the performance of each Ad.
-- Performance of the Ad is measured using Click-Through Rate (CTR) where:
-- Write a solution to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in
-- case of a tie.

SELECT
  ad_id,
  ROUND(
    COALESCE(SUM(action = 'Clicked') / NULLIF(SUM(action IN ('Clicked', 'Viewed')), 0) * 100, 0),
    2
  ) AS ctr
FROM Ads
GROUP BY
  1
ORDER BY
  2 DESC,
  1 NULLS FIRST;
