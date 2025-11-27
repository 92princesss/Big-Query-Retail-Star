SELECT*
FROM `retail-479322.Sales.Data`
WHERE EXTRACT(YEAR FROM Date) = 2023;


SELECT *
FROM `retail-479322.Sales.Data`
WHERE `Total Amount`> (SELECT AVG(`Total Amount`) FROM `retail-479322.Sales.Data`);

SELECT 
SUM(`Total Amount`) AS Total_Revenue
FROM `retail-479322.Sales.Data`;

SELECT DISTINCT `Product Category`
FROM `retail-479322.Sales.Data`;

SELECT `Product Category`, SUM(Quantity) AS Total_Quantity
FROM `retail-479322.Sales.Data`
GROUP BY `Product Category`;


SELECT
  SUM(`Total Amount`) AS Total_Revenue
FROM
  `retail-479322`.Sales.Data;

SELECT `Customer ID`, Age,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM `retail-479322.Sales.Data`;


SELECT Gender, COUNT(*) AS High_Value_Transactions
FROM `retail-479322.Sales.Data`
WHERE `Total Amount` > 500
GROUP BY Gender;

SELECT `Product Category`, SUM(`Total Amount`) AS `Total Revenue`
FROM `retail-479322.Sales.Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

SELECT `Transaction ID`, `Price per Unit`,
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS Unit_Cost_Category
FROM `retail-479322.Sales.Data`;

SELECT `Customer ID`, Age, `Total Amount`,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS Spending_Level
FROM `retail-479322.Sales.Data`
WHERE Age >= 40;











