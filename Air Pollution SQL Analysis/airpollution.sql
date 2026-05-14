-- ------------------------------------------
-- 1)Average AQI per city in ascending order:
-- ------------------------------------------

USE pollution;
SELECT City, AVG(AQI) AS Average_AQI
FROM city_day
GROUP BY(City)
ORDER BY Average_AQI ASC;




-- -----------------------------------------------------
-- 2)The year with the lowest average AQI for each city:
-- -----------------------------------------------------

WITH AQI_City_Year AS (
SELECT City,YEAR(Datetime) AS Year, AVG(AQI) as Avg_AQI_year
FROM city_day
GROUP BY City, YEAR(Datetime)),
ranking AS (
SELECT City, Year, Avg_AQI_year, RANK() OVER(Partition by City ORDER BY Avg_AQI_year ASC) AS r
FROM AQI_City_Year)
SELECT City, Year, Avg_AQI_year
FROM ranking
WHERE r='1';



-- --------------------------------------------------------------
-- 3)The most polluted month (highest average AQI) for each city:
-- --------------------------------------------------------------

WITH Avg_Month AS (SELECT City,MONTH(Datetime) AS month, AVG(AQI) as Avg_AQI_month
FROM city_day
GROUP BY City, MONTH(Datetime)),
ranking AS (SELECT City, month, RANK() OVER(PARTITION BY City ORDER BY Avg_AQI_month DESC) as r, Avg_AQI_month
FROM Avg_Month)
SELECT City, month, AVG_AQI_month
FROM ranking
WHERE r='1';




-- -----------------------------------
-- 4)Count of AQI categories per city:
-- -----------------------------------

SELECT City, COUNT(*), AQI_Bucket
FROM city_day
GROUP BY City, AQI_Bucket;




-- ----------------------------------------------
-- 5)Most Improved Cities Based on AQI Reduction:
-- ----------------------------------------------

WITH Yearly AS (SELECT City, YEAR(Datetime) AS Year, AVG(AQI) AS Avg_AQI
FROM city_day
GROUP BY City, YEAR(Datetime)),
Firstlast AS 
(SELECT City,
       MAX(CASE WHEN Year = 2015 THEN Avg_AQI END) AS AQI_2015,
       MAX(CASE WHEN Year = 2024 THEN Avg_AQI END) AS AQI_2024
FROM Yearly
GROUP BY City)
SELECT City, (AQI_2015-AQI_2024) AS Improvement
FROM Firstlast
ORDER BY Improvement DESC;




-- ---------------------------------------
-- 6)Top 5 Highest AQI Days for Each City:
-- ---------------------------------------

WITH AQIRANKING AS (SELECT City,AQI, Datetime, RANK() OVER(PARTITION BY City ORDER BY AQI DESC) AS AQIRank
FROM city_day)
SELECT City, Datetime, AQI
FROM AQIRANKING
WHERE AQIRANK<=5;




-- ---------------------------------------------
-- 7)Average Seasonal AQI Analysis Across Cities:
-- ---------------------------------------------

WITH seasons AS (SELECT City,
CASE
WHEN MONTH(Datetime) IN (12,1,2) THEN 'Winter'
WHEN MONTH(Datetime) IN (3,4,5) THEN 'Summer'
WHEN MONTH(Datetime) IN (6,7,8,9) THEN 'Monsoon'
ELSE 'Autumn'
END AS Season,
AQI
FROM city_day)
SELECT City, Season, AVG(AQI)
FROM seasons
GROUP BY City, Season
ORDER BY City, AVG(AQI) ASC;











