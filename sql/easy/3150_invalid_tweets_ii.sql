-- 3150. Invalid Tweets II
-- https://leetcode.com/problems/invalid-tweets-ii/
--
-- Tweets(tweet_id, content)
-- Write a solution to find invalid tweets. A tweet is considered invalid if it meets any of the
-- following criteria:
-- It exceeds 140 characters in length.
-- It has more than 3 mentions.
-- It includes more than 3 hashtags.
-- Return the result table ordered by tweet_id in ascending order.

SELECT
  tweet_id
FROM Tweets
WHERE
  LENGTH(content) > 140
  OR (
    CASE TYPEOF(content)
      WHEN 'BLOB'
      THEN OCTET_LENGTH(CAST(content AS BLOB))
      ELSE LENGTH(CAST(content AS TEXT))
    END - CASE TYPEOF(REPLACE(content, '@', ''))
      WHEN 'BLOB'
      THEN OCTET_LENGTH(CAST(REPLACE(content, '@', '') AS BLOB))
      ELSE LENGTH(CAST(REPLACE(content, '@', '') AS TEXT))
    END
  ) > 3
  OR (
    CASE TYPEOF(content)
      WHEN 'BLOB'
      THEN OCTET_LENGTH(CAST(content AS BLOB))
      ELSE LENGTH(CAST(content AS TEXT))
    END - CASE TYPEOF(REPLACE(content, '#', ''))
      WHEN 'BLOB'
      THEN OCTET_LENGTH(CAST(REPLACE(content, '#', '') AS BLOB))
      ELSE LENGTH(CAST(REPLACE(content, '#', '') AS TEXT))
    END
  ) > 3
ORDER BY
  1 NULLS FIRST;
