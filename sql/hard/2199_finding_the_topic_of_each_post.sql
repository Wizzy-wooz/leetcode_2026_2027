-- 2199. Finding the Topic of Each Post
-- https://leetcode.com/problems/finding-the-topic-of-each-post/
--
-- Keywords(topic_id, word)
-- Posts(post_id, content)
-- Leetcode has collected some posts from its social media website and is interested in finding
-- the topics of each post. Each topic can be expressed by one or more keywords. If a keyword of a
-- certain topic exists in the content of a post (case insensitive) then the post has this topic.
-- Write a solution to find the topics of each post according to the following rules:
-- If the post does not have keywords from any topic, its topic should be "Ambiguous!".
-- If the post has at least one keyword of any topic, its topic should be a string of the IDs of
-- its topics sorted in ascending order and separated by commas ','. The string should not contain
-- duplicate IDs.
-- Return the result table in any order.

SELECT
  post_id,
  COALESCE(LISTAGG(DISTINCT topic_id, ',' ORDER BY topic_id), 'Ambiguous!') AS topic
FROM Posts
LEFT JOIN Keywords
  ON STRPOS(' ' || lower(content) || ' ', ' ' || lower(word) || ' ') > 0
GROUP BY
  post_id;
