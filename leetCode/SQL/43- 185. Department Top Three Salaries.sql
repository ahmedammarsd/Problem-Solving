--# Write your MySQL query statement below
WITH groupEmployee AS (SELECT d.name AS Department , e.name AS Employee , e.salary AS Salary ,
DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS rn
FROM Employee e 
JOIN Department d ON d.id = e.departmentId
)
SELECT Department , Employee , Salary 
FROM groupEmployee 
WHERE rn <= 3






--# Write your MySQL query statement below
SELECT d.name AS 'Department', 
       e1.name AS 'Employee', 
       e1.salary AS 'Salary' 
FROM Employee e1
JOIN Department d
ON e1.departmentId = d.id 
WHERE
    3 > (SELECT COUNT(DISTINCT e2.salary)
        FROM Employee e2
        WHERE e2.salary > e1.salary AND e1.departmentId = e2.departmentId);

      --  # Write your MySQL query statement below
select D.name as Department,
        E.name as Employee,
        E.salary as Salary
from Employee E join Department D on E.departmentId = D.id
where (select count(distinct Emp.salary) from Employee Emp where Emp.salary > E.salary and Emp.departmentId = E.departmentId) < 3




--====================== New Roles ==================
 🧠 Quick Summary of Ranking Functions

Function	Ties?	Skips Rank?	Use When...
ROW_NUMBER()	❌	❌	You want exactly N rows per group
RANK()	✅	✅	You want to include ties, and don’t mind rank jumps
DENSE_RANK()	✅	❌	You want to include ties, but keep ranks tight (no skips) ✅✅✅

--===================================================







185. Department Top Three Salaries
Solved
Hard
Topics
Companies
SQL Schema
Pandas Schema
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.
 

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
Explanation: 
In the IT department:
- Max earns the highest unique salary
- Both Randy and Joe earn the second-highest unique salary
- Will earns the third-highest unique salary

In the Sales department:
- Henry earns the highest salary
- Sam earns the second-highest salary
- There is no third-highest salary as there are only two employees