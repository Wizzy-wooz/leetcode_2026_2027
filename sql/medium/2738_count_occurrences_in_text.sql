-- 2738. Count Occurrences in Text
-- https://leetcode.com/problems/count-occurrences-in-text/
--
-- Files(file_name, content)
-- Write a solution to find the number of files that have at least one occurrence of the words
-- 'bull' and 'bear' as a standalone word, respectively, disregarding any instances where it
-- appears without space on either side (e.g. 'bullet', 'bears', 'bull.', or 'bear' at the
-- beginning or end of a sentence will not be considered)
-- Return the word 'bull' and 'bear' along with the corresponding number of occurrences in any
-- order.

SELECT
  'bull' AS word,
  COUNT(*) AS count
FROM Files
WHERE
  content LIKE '% bull %'
UNION
SELECT
  'bear' AS word,
  COUNT(*) AS count
FROM Files
WHERE
  content LIKE '% bear %';
