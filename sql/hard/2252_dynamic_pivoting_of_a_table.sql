-- 2252. Dynamic Pivoting of a Table
-- https://leetcode.com/problems/dynamic-pivoting-of-a-table/
--
-- Products(product_id, store, price)
-- Important note: This problem targets those who have a good experience with SQL. If you are a
-- beginner, we recommend that you skip it for now.
-- Implement the procedure PivotProducts to reorganize the Products table so that each row has the
-- id of one product and its price in each store. The price should be null if the product is not
-- sold in a store. The columns of the table should contain each store and they should be sorted
-- in lexicographical order.
-- The procedure should return the table after reorganizing it.
-- Return the result table in any order.

PIVOT Products ON store USING max(price) GROUP BY product_id;
