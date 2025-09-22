USE [EV DATA]
SELECT * FROM EV_data

--1-- Total Number of Registered EVs--
SELECT COUNT(*) AS Total_EVs
FROM EV_data;

--2-- Average Electric range--
SELECT AVG(Electric_Range) AS Average_Electric_Range
FROM EV_data;

--3. Percentage of CAFV eligible EVs--
SELECT 
    100.0 * COUNT(*) * 1.0 / (SELECT COUNT(*) FROM EV_data) AS CAFV_Eligibility_Percentage
FROM EV_data
WHERE Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible';

--4--Top EV by volume--
SELECT 
    Make, 
    Model, 
    COUNT(*) AS Vehicle_Count
FROM 
    EV_data
GROUP BY 
    Make, Model
ORDER BY 
    Vehicle_Count DESC;

-- 5-- Adoption growth trends by model--
SELECT 
    Model_Year,
    COUNT(*) AS Total_EV_Registrations
FROM 
    EV_data
GROUP BY 
    Model_Year
ORDER BY 
    Model_Year;

--6-- Top 10 EV models with best range--
SELECT TOP 10 
    Make, Model,
    ROUND(AVG(Electric_Range), 1) AS Avg_Electric_Range
FROM 
    EV_data
WHERE 
    Electric_Range IS NOT NULL AND Electric_Range > 0
GROUP BY 
    Model, Make
ORDER BY 
    Avg_Electric_Range DESC;


--7--Top 10 counties with the highest numbers of EVs--
SELECT TOP 10 
    County, 
    COUNT(*) AS EV_Count
FROM 
    EV_data
WHERE 
    County IS NOT NULL
GROUP BY 
    County
ORDER BY 
    EV_Count DESC;

-- Bottom 5 counties--
SELECT TOP 10 
    State, 
    COUNT(*) AS EV_Count
FROM 
    EV_data
WHERE 
    State IS NOT NULL
GROUP BY 
    State
ORDER BY 
    EV_Count DESC;

--8-- Top 10 cities with highest numbers of EVs--
SELECT TOP 10 
    County, City,
    COUNT(*) AS EV_Count
FROM 
    EV_data
WHERE 
    City IS NOT NULL
GROUP BY 
    County, City
ORDER BY 
    EV_Count DESC;

--9-- Trends in electric range by model year--
SELECT 
    Model_Year,
    ROUND(AVG(Electric_Range), 1) AS Avg_Electric_Range
FROM 
    EV_data
WHERE 
    Electric_Range IS NOT NULL AND Electric_Range > 0
GROUP BY 
    Model_Year
ORDER BY 
    Model_Year;

--TOP 5 Electric utilities--
SELECT TOP 10
    Electric_Utility,
    COUNT(*) AS EV_Count
FROM 
    EV_data
WHERE 
    Electric_Utility IS NOT NULL
GROUP BY 
    Electric_Utility
ORDER BY 
    EV_Count DESC


--10--Total Unique models--
SELECT 
    COUNT(DISTINCT Model) AS Total_Unique_Models
FROM 
    EV_data;

--11-- Oldest EV model--
SELECT 
    Model_Year,
    Make,
    Model
FROM 
    EV_data
WHERE 
    Model_Year = (SELECT MIN(Model_Year) FROM EV_data)
GROUP BY Model_Year, Make, Model


--Top manufacturers)--
SELECT 
    Make,
    COUNT(*) AS EV_Count
FROM 
    EV_data
GROUP BY 
    Make
ORDER BY 
    EV_Count DESC;
