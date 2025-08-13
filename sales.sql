CREATE DATABASE order_data;

USE order_data;

select * from sales_data_sample;




-- Q1]. Monthly Revenue for each year
select 
	YEAR_ID,
	MONTH_ID,
    round(sum(sales)) as Total_Revenue
from sales_data_sample
group by YEAR_ID,MONTH_ID
order by YEAR_ID asc;







-- Q2]. Total number of shipped-orders per year from 2003 to 2005.

SELECT 
	YEAR_ID,
    COUNT(ORDERNUMBER) AS TOTAL_ORDERS
FROM sales_data_sample
where STATUS = 'SHIPPED'
group by YEAR_ID
ORDER BY YEAR_ID ASC;





-- Q3]. Top 5 highest-revenue months between 2003–2005.

SELECT 
	YEAR_ID,
	MONTH_ID,
	ROUND(SUM(SALES)) AS TOTAL_REVENUE
FROM sales_data_sample
group by YEAR_ID,MONTH_ID
ORDER BY TOTAL_REVENUE DESC
LIMIT 5;





-- Q4]. Show total revenue for each year and the % growth compared to the previous year.

SELECT 
	YEAR_ID,
    ROUND(SUM(SALES)) AS TOTAL_REVENUE, 
    ROUND((SUM(SALES) - LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID)) / LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID) * 100, 2) AS pct_growth
FROM sales_data_sample
GROUP BY YEAR_ID
ORDER BY YEAR_ID ASC; 






 -- Q5]. Average Order value for each year

SELECT 
	YEAR_ID,
    ROUND(SUM(SALES) / COUNT(DISTINCT ORDERNUMBER), 2) AS avg_order_value
FROM sales_data_sample
GROUP BY YEAR_ID
ORDER BY YEAR_ID;






