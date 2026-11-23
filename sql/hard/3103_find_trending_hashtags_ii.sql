-- 3103. Find Trending Hashtags II
-- https://leetcode.com/problems/find-trending-hashtags-ii/
--
-- Tweets(user_id, tweet_id, tweet_date, tweet)
-- Write a solution to find the top 3 trending hashtags in February 2024. Every tweet may contain
-- several hashtags.
-- Return the result table ordered by count of hashtag, hashtag in descending order.

SELECT
  tag AS hashtag,
  COUNT(*) AS hashtag_count
FROM Tweets
JOIN UNNEST(REGEXP_EXTRACT_ALL(tweet, '#[^ ]+')) AS tags(tag)
  ON TRUE
WHERE
  tweet_date >= CAST('2024-02-01' AS DATE)
  AND tweet_date < CAST('2024-03-01' AS DATE)
GROUP BY
  tag
ORDER BY
  hashtag_count DESC,
  tag DESC
LIMIT 3;
