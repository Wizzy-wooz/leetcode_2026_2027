-- 1393. Capital GainLoss
-- https://leetcode.com/problems/capital-gainloss/
--
-- Stocks(stock_name, operation, operation_day, price)
-- Write a solution to report the Capital gain/loss for each stock.
-- The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock
-- one or many times.
-- Return the result table in any order.
-- The result format is in the following example.

SELECT
  stock_name,
  SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY
  1;
