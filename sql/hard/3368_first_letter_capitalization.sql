-- 3368. First Letter Capitalization
-- https://leetcode.com/problems/first-letter-capitalization/
--
-- user_content(content_id, content_text)
-- Write a solution to transform the text in the content_text column by applying the following
-- rules:
-- Convert the first letter of each word to uppercase
-- Keep all other letters in lowercase
-- Preserve all existing spaces
-- Note: There will be no special character in content_text.
-- Return the result table that includes both the original content_text and the modified text
-- where each word starts with a capital letter.

SELECT
  content_id,
  content_text AS original_text,
  ARRAY_TO_STRING(
    LIST_TRANSFORM(
      REGEXP_EXTRACT_ALL(content_text, '[ ]|[^ ]+'),
      LAMBDA w : UPPER(LEFT(w, 1)) || LOWER(SUBSTRING(w, 2))
    ),
    ''
  ) AS converted_text
FROM user_content;
