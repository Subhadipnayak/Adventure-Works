-- 4.Calculate the Sales amount uning the columns(unit price,order quantity,unit discount) 

 
SELECT 
    (UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct / 100)) AS SalesAmount
FROM 
    (
        SELECT UnitPrice, OrderQuantity, UnitPriceDiscountPct
        FROM adventurework.factinternetsales

        UNION ALL

        SELECT UnitPrice, OrderQuantity, UnitPriceDiscountPct
        FROM adventurework.fact_internet_sales_new
    ) AS combined_sales; 
