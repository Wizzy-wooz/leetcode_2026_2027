-- 3374. First Letter Capitalization II
-- https://leetcode.com/problems/first-letter-capitalization-ii/
--
-- user_content(content_id, content_text)
-- A word is a maximal non-empty sequence of characters that does not contain a space.
-- Write a solution to transform the text in the content_text column by applying the following
-- rules to each word:
-- If the word starts with a character that is not an English letter, leave the entire word
-- unchanged.
-- Otherwise, if the word consists of two or more non-empty parts of English letters connected by
-- hyphens -, convert the first letter of each part to uppercase and the remaining letters of each
-- part to lowercase. For example, top-rated becomes Top-Rated and FR-ONT-end becomes Fr-Ont-End.
-- Otherwise, convert the first letter of the word to uppercase and all remaining English letters
-- to lowercase. Any special characters remain unchanged.
-- All other formatting and spacing must remain unchanged.
-- Return the result table that includes both the original content_text and the modified text
-- following the above rules.

SELECT
  content_id,
  content_text AS original_text,
  ARRAY_TO_STRING(
    LIST_TRANSFORM(
      REGEXP_EXTRACT_ALL(content_text, '[ -]|[^ -]+'),
      LAMBDA w : UPPER(LEFT(w, 1)) || LOWER(SUBSTRING(w, 2))
    ),
    ''
  ) AS converted_text
FROM user_content;
