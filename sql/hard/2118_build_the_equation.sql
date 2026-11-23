-- 2118. Build the Equation
-- https://leetcode.com/problems/build-the-equation/
--
-- Terms(power, factor)
-- You have a very powerful program that can solve any equation of one variable in the world. The
-- equation passed to the program must be formatted as follows:
-- The left-hand side (LHS) should contain all the terms.
-- The right-hand side (RHS) should be zero.
-- Each term of the LHS should follow the format "<sign><fact>X^<pow>" where: <sign> is either "+"
-- or "-".
-- <fact> is the absolute value of the factor.
-- <pow> is the value of the power.
-- If the power is 1, do not add "^<pow>". For example, if power = 1 and factor = 3, the term will
-- be "+3X".
-- If the power is 0, add neither "X" nor "^<pow>". For example, if power = 0 and factor = -3, the
-- term will be "-3".
-- The powers in the LHS should be sorted in descending order.
-- Write a solution to build the equation.
-- The result format is in the following example.

WITH T AS (
  SELECT
    power,
    CASE power
      WHEN 0
      THEN CASE WHEN factor > 0 THEN '+' || factor ELSE CAST(factor AS TEXT) END
      WHEN 1
      THEN CASE WHEN factor > 0 THEN '+' || factor ELSE CAST(factor AS TEXT) END || 'X'
      ELSE CASE WHEN factor > 0 THEN '+' || factor ELSE CAST(factor AS TEXT) END || 'X^' || power
    END AS it
  FROM Terms
)
SELECT
  LISTAGG(it, ''
  ORDER BY
    power DESC) || '=0' AS equation
FROM T;
