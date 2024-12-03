-- 3.calcuate the following fields from the Orderdatekey field ( First Create a Date Field from Orderdatekey)
--    A.Year
--    B.Monthno
--    C.Monthfullname
--    D.Quarter(Q1,Q2,Q3,Q4)
--    E. YearMonth ( YYYY-MMM)
--    F. Weekdayno
--    G.Weekdayname
--    H.FinancialMOnth
--    I. Financial Quarter 

with cte1 as(
select * from factinternetsales
union
select * from fact_internet_sales_new),
cte2 as (select date(Orderdatekey) as date_field from cte1)
select year(date_field) as Year,
month(date_field) as MonthNo,
monthname(date_field) as MonthFullName,
concat("Q", quarter(date_field)) as Quarter,
concat(year(date_field), "-", upper(substr(monthname(date_field),1,3))) as YearMonth,
dayofweek(date_field) as WeekDayNo,
dayname(date_field) as WeekDayName,
case
	when month(date_field) in (1,2,3) then "January"
	when month(date_field) in (4,5,6) then "April"
	when month(date_field) in (7,8,9) then "July"
	when month(date_field) in (10,11,12) then "October"
end as FinancialMonth,
case
	when month(date_field) in (1,2,3) then "Q4"
	when month(date_field) in (4,5,6) then "Q1"
	when month(date_field) in (7,8,9) then "Q2"
	when month(date_field) in (10,11,12) then "Q4"
end as FinancialQuarter
from cte2;