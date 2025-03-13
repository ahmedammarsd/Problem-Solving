-- # Write your MySQL query statement below
SELECT product_id FROM Products where low_fats = 'Y' AND recyclable = 'Y';

-- My Solution
-- # Write your MySQL query statement below
select product_id from Products where low_fats = "Y" && recyclable = "Y"