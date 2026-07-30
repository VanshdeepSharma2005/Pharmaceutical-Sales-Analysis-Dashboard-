select * from pharma_data
limit 10;

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM pharma_data;

SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM pharma_data
GROUP BY `Product Name` 
ORDER BY Total_Sales DESC
LIMIT 10;

WITH RankedProducts AS
(
SELECT
Country,
`Product Name`,
SUM(Sales) AS Revenue,
RANK() OVER(
PARTITION BY Country
ORDER BY SUM(Sales) DESC
) AS rn
FROM pharma_data
GROUP BY Country,`Product Name`
)

SELECT *
FROM RankedProducts
WHERE rn<=3;

