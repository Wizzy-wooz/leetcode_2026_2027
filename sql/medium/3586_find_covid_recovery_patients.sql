-- 3586. Find COVID Recovery Patients
-- https://leetcode.com/problems/find-covid-recovery-patients/
--
-- patients(patient_id, patient_name, age)
-- covid_tests(test_id, patient_id, test_date, result)
-- Write a solution to find patients who have recovered from COVID - patients who tested positive
-- but later tested negative.
-- A patient is considered recovered if they have at least one Positive test followed by at least
-- one Negative test on a later date
-- Calculate the recovery time in days as the difference between the first positive test and the
-- first negative test after that positive test
-- Only include patients who have both positive and negative test results
-- Return the result table ordered by recovery_time in ascending order, then by patient_name in
-- ascending order.

WITH first_positive AS (
  SELECT
    patient_id,
    MIN(test_date) AS first_positive_date
  FROM covid_tests
  WHERE
    result = 'Positive'
  GROUP BY
    patient_id
), first_negative_after_positive AS (
  SELECT
    t.patient_id,
    MIN(t.test_date) AS first_negative_date
  FROM covid_tests AS t
  JOIN first_positive AS p
    ON t.patient_id = p.patient_id AND t.test_date > p.first_positive_date
  WHERE
    t.result = 'Negative'
  GROUP BY
    t.patient_id
)
SELECT
  p.patient_id,
  p.patient_name,
  p.age,
  DATE_DIFF('DAY', f.first_positive_date, n.first_negative_date) AS recovery_time
FROM first_positive AS f
JOIN first_negative_after_positive AS n
  ON f.patient_id = n.patient_id
JOIN patients AS p
  ON p.patient_id = f.patient_id
ORDER BY
  recovery_time ASC NULLS FIRST,
  patient_name ASC NULLS FIRST;
