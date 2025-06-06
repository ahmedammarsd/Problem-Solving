
--# Write your MySQL query statement below
SELECT IFNULL((SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1
ORDER BY num DESC LIMIT 0,1), null) as num




--# Write your MySQL query statement below
SELECT COALESCE((SELECT num 
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) =1
ORDER BY num DESC
LIMIT 1),null)
AS num

--# Write your MySQL query statement below
select max(num) as num
from
(
select num from mynumbers group by num having count(*) = 1
) a



619. Biggest Single Number
Solved
Easy
Topics
Companies
SQL Schema
Pandas Schema
Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.

 

Example 1:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.
Example 2:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+
Output: 
+------+
| num  |
+------+
| null |
+------+
Explanation: There are no single numbers in the input table so we return null.