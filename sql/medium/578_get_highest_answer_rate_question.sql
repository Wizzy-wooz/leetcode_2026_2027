-- 578. Get Highest Answer Rate Question
-- https://leetcode.com/problems/get-highest-answer-rate-question/
--
-- SurveyLog(id, action, question_id, answer_id, q_num, timestamp)
-- The answer rate for a question is the number of times a user answered the question by the
-- number of times a user showed the question.
-- Write a solution to report the question that has the highest answer rate. If multiple questions
-- have the same maximum answer rate, report the question with the smallest question_id.
-- The result format is in the following example.

SELECT
  question_id AS survey_log
FROM SurveyLog
GROUP BY
  1
ORDER BY
  SUM(action = 'answer') / NULLIF(SUM(action = 'show'), 0) DESC,
  1 NULLS FIRST
LIMIT 1;
