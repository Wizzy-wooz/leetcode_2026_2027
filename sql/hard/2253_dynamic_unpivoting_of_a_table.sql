-- 2253. Dynamic Unpivoting of a Table
-- https://leetcode.com/problems/dynamic-unpivoting-of-a-table/
--
-- Products(product_id, store_name1, store_name2, store_namen)
-- Important note: This problem targets those who have a good experience with SQL. If you are a
-- beginner, we recommend that you skip it for now.
-- Implement the procedure UnpivotProducts to reorganize the Products table so that each row has
-- the id of one product, the name of a store where it is sold, and its price in that store. If a
-- product is not available in a store, do not include a row with that product_id and store
-- combination in the result table. There should be three columns: product_id, store, and price.
-- The procedure should return the table after reorganizing it.
-- Return the result table in any order.

UNPIVOT Products ON COLUMNS(* EXCLUDE(product_id)) INTO NAME store VALUE price;
