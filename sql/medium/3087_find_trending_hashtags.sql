-- 3087. Find Trending Hashtags
-- https://leetcode.com/problems/find-trending-hashtags/
--
-- Tweets(user_id, tweet_id, tweet_date, tweet)
-- Write a solution to find the top 3 trending hashtags in February 2024. Each tweet only contains
-- one hashtag.
-- Return the result table orderd by count of hashtag, hashtag in descending order.

SELECT
  REGEXP_EXTRACT(tweet, '#[^ ]+') AS hashtag,
  COUNT(*) AS hashtag_count
FROM Tweets
WHERE
  tweet_date >= CAST('2024-02-01' AS DATE)
  AND tweet_date < CAST('2024-03-01' AS DATE)
GROUP BY
  hashtag
ORDER BY
  hashtag_count DESC,
  hashtag DESC
LIMIT 3;
