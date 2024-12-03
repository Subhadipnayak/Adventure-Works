-- 5.Calculate the Productioncost uning the columns(unit cost ,order quantity)
SELECT 
    (ProductStandardCost * OrderQuantity) AS ProductionCost
FROM 
    (
        SELECT ProductStandardCost, OrderQuantity
        FROM adventurework.factinternetsales

        UNION ALL

        SELECT ProductStandardCost, OrderQuantity
        FROM adventurework.fact_internet_sales_new
    ) AS combined_production_cost;