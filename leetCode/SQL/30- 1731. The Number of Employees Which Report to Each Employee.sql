

--# Write your MySQL query statement below
SELECT e.employee_id , e.name ,
 (SELECT COUNT(reports_to) FROM Employees WHERE reports_to = e.employee_id )AS reports_count ,
  ROUND(((SELECT SUM(age) FROM Employees WHERE reports_to = e.employee_id )/(SELECT COUNT(reports_to) FROM Employees WHERE reports_to = e.employee_id )),0) as average_age
FROM Employees e
HAVING reports_count != 0
ORDER BY e.employee_id

# Write your MySQL query statement below
SELECT e.employee_id , e.name ,COUNT(*) AS reports_count , ROUND(AVG(e2.age)) AS average_age
FROM Employees e
INNER JOIN Employees e2 ON e.employee_id = e2.reports_to
GROUP BY e.employee_id  --You can use e2.reports_to
ORDER BY e.employee_id


-- # Write your MySQL query statement below
select m.employee_id,m.name,count(*)reports_count,
round(avg(e.age)) average_age from
Employees m inner join employees e
on m.employee_id = e.reports_to
group by m.employee_id
order by m.employee_id


1731. The Number of Employees Which Report to Each Employee
Solved
Easy
Topics
Companies
SQL Schema
Pandas Schema
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
Example 2:

Input: 
Employees table:
+-------------+---------+------------+-----+ 
| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 1           | Michael | null       | 45  |
| 2           | Alice   | 1          | 38  |
| 3           | Bob     | 1          | 42  |
| 4           | Charlie | 2          | 34  |
| 5           | David   | 2          | 40  |
| 6           | Eve     | 3          | 37  |
| 7           | Frank   | null       | 50  |
| 8           | Grace   | null       | 48  |
+-------------+---------+------------+-----+ 
Output: 
+-------------+---------+---------------+-------------+
| employee_id | name    | reports_count | average_age |
| ----------- | ------- | ------------- | ----------- |
| 1           | Michael | 2             | 40          |
| 2           | Alice   | 2             | 37          |
| 3           | Bob     | 1             | 37          |
+-------------+---------+---------------+-------------+
