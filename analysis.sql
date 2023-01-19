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

-- sales per day
select date_part('day', Time)
from supermarket_sales