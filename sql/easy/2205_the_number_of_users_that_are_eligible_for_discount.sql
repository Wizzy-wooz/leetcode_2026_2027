-- 2205. The Number of Users That Are Eligible for Discount
-- https://leetcode.com/problems/the-number-of-users-that-are-eligible-for-discount/
--
-- Purchases(user_id, time_stamp, amount)
-- A user is eligible for a discount if they had a purchase in the inclusive interval of time
-- [startDate, endDate] with at least minAmount amount. To convert the dates to times, both dates
-- should be considered as the start of the day (i.e., endDate = 2022-03-05 should be considered
-- as the time 2022-03-05 00:00:00).
-- Write a solution to report the number of users that are eligible for a discount.

CREATE OR REPLACE MACRO getUserIDs(startDate,endDate,minAmount) AS (SELECT count(DISTINCT user_id) FROM Purchases WHERE time_stamp BETWEEN startDate AND endDate AND amount >= minAmount);
