-- 6.Calculate the profit.
with cte as (
select * from factinternetsales
union
select * from fact_internet_sales_new)
select productkey,
sum(salesamount) as totalsales,
sum(TotalProductCost) as totalproductcost,
(sum(salesamount) - sum(TotalProductCost)) as profit
from cte
group by productkey