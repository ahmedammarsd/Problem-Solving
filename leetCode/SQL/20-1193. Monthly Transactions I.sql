
# Write your MySQL query statement below
SELECT DATE_FORMAT(t.trans_date, '%Y-%m') as month , t.country , 
 (SELECT COUNT(*) FROM Transactions WHERE IFNULL(country,id)=IFNULL(t.country,t.id) AND  DATE_FORMAT(trans_date, '%Y-%m') = DATE_FORMAT(t.trans_date, '%Y-%m')) as trans_count , 
 (SELECT COUNT(*) FROM Transactions WHERE IFNULL(country,id)=IFNULL(t.country,t.id) AND  DATE_FORMAT(trans_date, '%Y-%m') = DATE_FORMAT(t.trans_date, '%Y-%m') AND state = "approved" ) AS approved_count,
 (SELECT IFNULL(SUM(amount),0) FROM Transactions WHERE IFNULL(country,id)=IFNULL(t.country,t.id) AND DATE_FORMAT(trans_date, '%Y-%m') = DATE_FORMAT(t.trans_date, '%Y-%m')
  ) AS trans_total_amount ,
 (SELECT IFNULL(SUM(amount),0) FROM Transactions WHERE IFNULL(country,id)=IFNULL(t.country,t.id) AND  DATE_FORMAT(trans_date, '%Y-%m') = DATE_FORMAT(t.trans_date, '%Y-%m') AND state = "approved") AS approved_total_amount 
FROM Transactions t
GROUP BY DATE_FORMAT(t.trans_date, '%Y-%m') , t.country




sql
--# Write your MySQL query statement below
select 
left(trans_date,7) as month,
country,
count(id) as trans_count,
sum(state = 'approved') as approved_count,
sum(amount) as trans_total_amount,
sum((state='approved')*amount) as approved_total_amount

from transactions
group by month, country

--# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m')  AS month , country, COUNT(state) AS trans_count, 
COUNT(CASE WHEN state = 'approved' THEN 1 ELSE NULL END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
from Transactions 
group by month, country

--# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month, 
country, 
count(trans_date) as trans_count, 
sum(if(state='approved', 1, 0)) as approved_count, 
sum(amount) as trans_total_amount, 
sum(if(state='approved', amount, 0)) as approved_total_amount
from transactions
group by month, country


1193. Monthly Transactions I
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+
Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+