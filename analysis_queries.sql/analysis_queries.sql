-- ANALYTICAL LOGIC FOR MANUFACTURING OPTIMIZATION
-- Based on table: production_data (from smart_factory_cleaned.csv)

-- 1. Identify High-Risk Product Tiers
-- Logic: Calculate failure rate percentage by product quality type (L/M/H)
SELECT 
    Type,
    COUNT(*) as Total_Runs,
    SUM(Machine_Failure) as Failure_Count,
    (SUM(Machine_Failure) * 100.0 / COUNT(*)) as Failure_Rate_Pct
FROM production_data
GROUP BY Type
ORDER BY Failure_Rate_Pct DESC;

-- 2. Root Cause Analysis: Heat Dissipation
-- Logic: Compare temperature delta during Heat Dissipation Failures (HDF)
SELECT 
    AVG(Process_Temp_K - Air_Temp_K) as Avg_Temp_Delta
FROM production_data
WHERE HDF = 1;

-- 3. Predictive Maintenance Thresholds
-- Logic: Find max tool wear minutes before failure typically occurs
SELECT 
    AVG(Tool_Wear_Min) as Avg_Wear_At_Failure,
    MAX(Tool_Wear_Min) as Max_Wear_At_Failure
FROM production_data
WHERE Machine_Failure = 1;
