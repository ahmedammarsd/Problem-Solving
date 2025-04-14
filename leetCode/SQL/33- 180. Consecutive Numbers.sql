
--# Write your MySQL query statement below
-- CHATGPT AI SLOVING
SELECT DISTINCT l1.Num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.Id = l2.Id - 1
JOIN Logs l3 ON l1.Id = l3.Id - 2
WHERE l1.Num = l2.Num AND l2.Num = l3.Num;


SELECT DISTINCT l1.num AS ConsecutiveNums 
FROM Logs l1
JOIN Logs l2 ON l2.id=l1.id+1 AND l1.num=l2.num
JOIN Logs l3 ON l3.id=l2.id+1 AND l2.num=l3.num

-- Not Working Good it's just calc every value in table
-- SELECT num as ConsecutiveNums , counterNum
-- FROM (
--     SELECT l2.id,l2.num , COUNT(l2.num) as counterNum
--     FROM Logs l2 
--     WHERE 
--       num = l2.num
--      GROUP BY l2.num
--      LIMIT 0, 2

-- ) Logs2

WITH
  LogsNeighbors AS (
    SELECT
      *,
      LAG(num) OVER(ORDER BY id) AS prev_num,
      LEAD(num) OVER(ORDER BY id) AS next_num
    FROM LOGS
  )
SELECT DISTINCT num AS ConsecutiveNums
FROM LogsNeighbors
WHERE
  num = prev_num
  AND num = next_num;




with cte as (
    select num,
    lead(num,1) over() num1,
    lead(num,2) over() num2
    from logs

)

select distinct num ConsecutiveNums from cte where (num=num1) and (num=num2)












180. Consecutive Numbers
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.