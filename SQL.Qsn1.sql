-- 1.Lookup the productname from the Product sheet to Sales sheet.

with sales as(SELECT * FROM adventurework.factinternetsales
union 
select * from adventurework.fact_internet_sales_new)
select sales.ProductKey,
OrderDateKey,
DueDateKey,
ShipDateKey,
CustomerKey,
PromotionKey,
CurrencyKey,
SalesTerritoryKey,
SalesOrderNumber,
SalesOrderLineNumber,
RevisionNumber,
OrderQuantity,
UnitPrice,
ExtendedAmount,
UnitPriceDiscountPct,
DiscountAmount,
ProductStandardCost,
TotalProductCost,
SalesAmount,
TaxAmt,
Freight,
CarrierTrackingNumber,
CustomerPONumber,
OrderDate,
DueDate,
ShipDate,
EnglishProductName from sales inner join dimproduct on sales.ProductKey = dimproduct.ProductKey;