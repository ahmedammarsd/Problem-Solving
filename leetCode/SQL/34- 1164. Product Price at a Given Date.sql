
-- my slolution but not working good ,
SELECT p.product_id , p.new_price AS price
FROM Products p
JOIN Products p2 ON p.product_id = p2.product_id && p.change_date <= "2019-08-16"
GROUP BY p.product_id


-- This chatGPT solution is better
SELECT 
    p.product_id,
    COALESCE(
        (
            SELECT new_price
            FROM Products p2
            WHERE p2.product_id = p.product_id
              AND p2.change_date <= '2019-08-16'
            ORDER BY p2.change_date DESC
            LIMIT 1
        ), 10
    ) AS price_on_2019_08_16
FROM (
    SELECT DISTINCT product_id FROM Products
) p;

-- code sample
WITH cte1 AS (
    SELECT product_id,new_price AS price,change_date
    FROM Products a
    WHERE change_date = (   SELECT MAX(change_date) FROM Products b
                            WHERE a.product_id= b.product_id
                            AND change_date <= '2019-08-16'
                            GROUP BY b.product_id
                        )
    GROUP BY product_id

)
SELECT DISTINCT p1.product_id,IFNULL((price),10) AS price
FROM cte1 p
RIGHT JOIN products p1
USING(product_id)




1164. Product Price at a Given Date
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+