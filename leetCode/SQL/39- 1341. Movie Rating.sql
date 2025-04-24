
# Write your MySQL query statement below

WITH CountUserRating AS ( SELECT u.name  , COUNT(r.user_id) AS rating_count
FROM Users u
INNER JOIN MovieRating r ON u.user_id = r.user_id
GROUP BY u.user_id
),
MaxUser AS (
    SELECT name
    FROM CountUserRating
    ORDER BY rating_count DESC, name ASC
    LIMIT 1
),
CountAvgMovies AS ( SELECT m.title , AVG(r.rating) as avg
    FROM Movies m 
    INNER JOIN MovieRating r ON m.movie_id = r.movie_id
     WHERE r.created_at >= '2020-02-01' AND r.created_at < '2020-03-01'
    GROUP BY m.movie_id
),
MaxMovie AS (
    SELECT title
    FROM CountAvgMovies
    ORDER BY avg DESC, title ASC
    LIMIT 1
)
SELECT name AS results from MaxUser
UNION ALL
SELECT title from MaxMovie




# Write your MySQL query statement below
(
select u.name as results
from MovieRating mr
join Users u on mr.user_id = u.user_id
group by u.name
order by count(rating) desc, name asc
limit 1
)
union all
(
select m.title as results
from MovieRating mr
join Movies m on mr.movie_id = m.movie_id
where created_at between '2020-02-01' and '2020-02-28'
group by m.title
order by avg(rating) desc, m.title asc
limit 1
)






1341. Movie Rating
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.

 

Example 1:

Input: 
Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+
MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
Explanation: 
Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.
Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.