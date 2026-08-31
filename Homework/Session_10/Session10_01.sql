/* The final output table should have the price grouped(Aliased as Pay_Category) as above and the count of the dishes falling in the respective category. */


SELECT 
    CASE 
        WHEN price > 18 THEN 'High' 
        WHEN price BETWEEN 10 AND 18 THEN 'Medium' 
        ELSE 'Low' 
        END AS Pay_Category, 
        COUNT(*) AS Dish_count
FROM Orders 
GROUP BY Pay_Category 
ORDER BY Pay_Category;