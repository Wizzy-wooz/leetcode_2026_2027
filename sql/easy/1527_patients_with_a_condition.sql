-- 1527. Patients With a Condition
-- https://leetcode.com/problems/patients-with-a-condition/
--
-- Patients(patient_id, patient_name, conditions)
-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have
-- Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  patient_id,
  patient_name,
  conditions
FROM patients
WHERE
  conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';
