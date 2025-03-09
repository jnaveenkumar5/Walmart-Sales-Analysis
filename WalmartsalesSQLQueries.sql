CREATE DATABASE IF NOT EXISTS salesDataWalmart;
CREATE TABLE IF NOT EXISTS SALES(
        invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
        branch VARCHAR(5) NOT NULL,
        city VARCHAR(30) NOT NULL,
        customer_type VARCHAR(30) NOT NULL,
        gender VARCHAR(10) NOT NULL,
        product_line VARCHAR(100) NOT NULL,
        unit_price DECIMAL(10,2) NOT NULL,
        quantity INT NOT NULL,
        VAT FLOAT(6,4) NOT NULL,
        total DECIMAL(12,4) NOT NULL,
        date DATETIME NOT NULL,
        time TIME NOT NULL,
        payment_method VARCHAR(15) NOT NULL,
        cogs DECIMAL(10,2) NOT NULL,
        gross_margin_pct FLOAT(11,9),
        gross_income DECIMAL(12,4) NOT NULL,
        rating FLOAT(2,1)
);

-- -----------------------------------------------------------------------------------------------------
-- ---- -------------------------Feature engineering-----------------------------------------------------
-- -- time_of_day
SELECT time,
   (CASE 
       WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
       WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
       ELSE "Evening"
    END
    ) AS time_of_date
FROM sales; 
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales 
SET 
    time_of_day = (CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);  
-- day name----
SELECT date,DAYNAME(date) AS day_name FROM sales;
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
UPDATE sales SET day_name=DAYNAME(date);
-- Month name -----
SELECT date,MONTHNAME(date) AS month_name FROM sales;
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
UPDATE sales SET month_name=MONTHNAME(date);

-- - --- ---------------------------------------------------------------------------------------------------------------
-- - -- -------------------------------------- generic -----------------------------------------------------------------
-- How many unique cities does the data have?
 SELECT DISTINCT city FROM sales;
-- In which city is each branch? 
SELECT DISTINCT city,branch FROM sales;
-- ----------------------------------------------------------------------------------------------------------------
-- ------------------------------------------- Product ------------------------------------------------------------
-- How many unique product lines does the data have?
SELECT DISTINCT product_line FROM sales;
-- What is the most common payment method?
select payment_method,count(payment_method) as max_payment from sales 
group by payment_method order by max_payment desc;
-- What is the most selling product line?
select product_line,count(product_line) as max_product from sales
group by product_line order by max_product desc;
-- What is the total revenue by month?
select month_name as month, sum(total) as total_revenue from sales 
group by month_name order by total_revenue desc;
-- What month had the largest COGS?
select month_name as month,sum(cogs) as Largest_COGS from sales
group by month_name order by Largest_COGS desc limit 1;
-- What product line had the largest revenue?
select product_line,sum(total) as Largest_revenue from sales
group by product_line order by Largest_revenue desc;
-- What is the city with the largest revenue?
select city,sum(total) as Largest_revenue from sales
group by city order by Largest_revenue desc;
-- What product line had the largest VAT?
select product_line ,avg(VAT) as avg_VAT from sales
group by product_line order by avg_VAT desc;
-- Which branch sold more products than average product sold?
select branch,sum(quantity) as qty from sales
group by branch having sum(quantity) > (select avg(quantity) from sales);
-- What is the most common product line by gender?
select gender,product_line,count(product_line) as total_cnt from sales
group by gender,product_line order by total_cnt desc;
-- What is the average rating of each product line?
select product_line,round(avg(rating),2) as average_rating from sales
group by product_line order by average_rating desc;
-- -----------------------------------------------------------------------------------------------------------
-- ------------------------------------------ sales -----------------------------------------------------------
-- Number of sales made in each time of the day per weekday
select time_of_day,count(*) as total_sales from sales
group by time_of_day order by total_sales desc;
-- Which of the customer types brings the most revenue?
select customer_type,sum(total) as revenue from sales
group by customer_type order by revenue desc;
-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city,avg(VAT)as largest_tax from sales
group by city order by largest_tax desc;
-- Which customer type pays the most in VAT?
select customer_type,avg(vat) as most_vat from sales
group by customer_type order by most_VAT desc;
-- ---------------------------------------------------------------------------------------------------------------
--  ---------------------------------- customers -------------------------------------------------------------------
-- How many unique customer types does the data have?
select distinct customer_type from sales;
-- How many unique payment methods does the data have?
select distinct payment_method from sales;
-- What is the most common customer type?
select customer_type,count(*) from sales
group by customer_type order by count(*) desc;
-- Which customer type buys the most?
select customer_type,count(*) as most from sales
group by customer_type order by most desc;
-- what is the gender of most of the customers?
select gender,count(*) from sales
group by gender order by count(*) desc;
-- What is the gender distribution per branch?
select gender,count(*) from sales
where branch="A"
group by gender order by count(*) desc;
-- Which time of the day do customers give most ratings?
select time_of_day,avg(rating) as most_rating from sales
group by time_of_day order by most_rating desc;
-- Which time of the day do customers give most ratings per branch?
select time_of_day,avg(rating) as most_rating from sales
where branch="A"
group by time_of_day order by most_rating desc;
-- Which day fo the week has the best avg ratings?
select day_name ,avg(rating) as avg_rating from sales
group by day_name order by avg_rating desc;
-- Which day of the week has the best average ratings per branch?
select branch,day_name,avg(rating) as avg_rating from sales
group by branch,day_name order by avg_rating desc;
-- ----------------------------------------------------------------------------------------------------------------











