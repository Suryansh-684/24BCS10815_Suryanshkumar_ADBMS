# Write your MySQL query statement below
SELECT E1.name, B1.bonus FROM Employee as E1
LEFT JOIN Bonus as B1
on E1.empId = B1.empID
where B1.bonus < 1000 or B1.bonus is null

-- Submission id -> 2092066357
