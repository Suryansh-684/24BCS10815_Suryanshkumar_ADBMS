SELECT *
FROM student as s1
FULL OUTER JOIN course as c1
ON s1.Course_id = c1.Course_id;