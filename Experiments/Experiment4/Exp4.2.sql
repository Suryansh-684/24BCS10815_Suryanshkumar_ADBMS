SELECT * From student as s1
 inner join course as c1
 ON s1.Course_id = c1.Course_id;
 
 SELECT * From student as s1
 left join course as c1
 ON s1.Course_id = c1.Course_id;