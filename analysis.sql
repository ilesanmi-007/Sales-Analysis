select *
from supermarket_sales


--2. types of branches available and frequency
select Branch, count(Branch) frequency
from supermarket_sales
group by Branch


--3. types of customers available and frequency

select Customer_type, count(Customer_type) frequency
from supermarket_sales
group by Customer_type

--4.  Types of
select City, count(City) frequency
from supermarket_sales
group by City


--5. The customer types per City

select City, Customer_type, count(Customer_type)
from supermarket_sales
group by City, Customer_type
order by City

-- 6. What payment method is mostly used
select Payment, count(Payment)
from supermarket_sales
group by Payment


--7. Average Rating by Branch

select Branch, AVG(Rating), MIN(Rating) minimum, MAX(Rating) maximum
from supermarket_sales
group by Branch
ORDER BY Branch

-- days of with highest 

SELECT DATENAME(weekday, date) as day_of_week, count(*) frequency
from supermarket_sales
group by DATENAME(weekday, date)
order by frequency desc;


--dayys with the highest sales
with days_added as (SELECT Invoice_ID, DATENAME(weekday, date) as day_of_week, Total, Rating, Gender
from supermarket_sales
group by DATENAME(weekday, date), Invoice_ID, Total, Rating, Gender
)
select day_of_week, sum(Total) total_sales
from days_added
group by day_of_week
order by total_sales desc


--select * from supermarket_sales
--time of the day with most sales
--morning, evening...

--select Time, Total
--from supermarket_sales
with day_time_added as (SELECT *,
CASE 
    WHEN DATEPART(hour, time) BETWEEN 0 AND 5 THEN 'Mid-Night'
    WHEN DATEPART(hour, time) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN DATEPART(hour, time) BETWEEN 12 AND 16 THEN 'Afternoon'
	WHEN DATEPART(hour, time) BETWEEN 16 AND 19 THEN 'Afternoon'
    WHEN DATEPART(hour, time) BETWEEN 19 AND 23 THEN 'Night'
END as time_of_day
from supermarket_sales)

select time_of_day, sum(Total) sales
FROM day_time_added
group by time_of_day
order by sales desc;

