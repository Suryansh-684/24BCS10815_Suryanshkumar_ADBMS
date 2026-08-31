
/* Write a query to count the number of students across departments who has scored more than 80 marks.*/

SELECT Department, SUM(CASE WHEN Marks> 80 THEN 1 ELSE 0 END) as Dept_HighScore_Count
FROM student
GROUP BY Department;