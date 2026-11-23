-- 2230. The Users That Are Eligible for Discount
-- https://leetcode.com/problems/the-users-that-are-eligible-for-discount/
--
-- Purchases(user_id, time_stamp, amount)
-- A user is eligible for a discount if they had a purchase in the inclusive interval of time
-- [startDate, endDate] with at least minAmount amount. To convert the dates to times, both dates
-- should be considered as the start of the day (i.e., endDate = 2022-03-05 should be considered
-- as the time 2022-03-05 00:00:00).
-- Write a solution to report the IDs of the users that are eligible for a discount.
-- Return the result table ordered by user_id.

CREATE OR REPLACE MACRO getUserIDs(startDate,endDate,minAmount) AS TABLE SELECT DISTINCT user_id FROM Purchases WHERE time_stamp BETWEEN startDate AND endDate AND amount >= minAmount ORDER BY user_id;
