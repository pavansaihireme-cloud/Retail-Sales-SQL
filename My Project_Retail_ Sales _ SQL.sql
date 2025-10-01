create database SQL_Project_P2;
USE SQL_Project_P2;
create table retail_sales (transactions_id INT,
							sale_date	DATE,
							sale_time TIME,
							customer_id	INT,
							gender	VARCHAR (20),
							age INT,
							category VARCHAR(20),
							quantiy INT,
							price_per_unit FLOAT,
							cogs FLOAT,
							total_sale FLOAT
							);
                            select * from `sql_project_p2`.`sql - retail sales analysis_utf`;
                            
-- to know how many transactions we have

                            select count(*) from `sql_project_p2`.`sql - retail sales analysis_utf`;
						
-- will check one by one that there are any null values in  columns 
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where sale_date is null;
-- No Null Values 

  select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where sale_time is null;
      
      -- no null
      
 select * from `sql_project_p2`.`sql - retail sales analysis_utf`;
	
	
    select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where customer_id is null;
      
      -- No Null
      
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where gender is null;
      
      -- No Null
      
       select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where age is null;
      
    --   No Null
      
  select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where category is null;
      
      -- No Null
      
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where category is null;
	-- No Null
    
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where ï»¿transactions_id is null;
      
      -- No Null
     -- We renamed the column name 
     
      alter table `sql_project_p2`.`sql - retail sales analysis_utf`
      rename  column ï»¿transactions_id 
      to transactions_id;
     
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`;
      
      select * from `sql_project_p2`.`sql - retail sales analysis_utf`
      where
    transactions_id is null
    or
    sale_date is null
    or
    sale_time is null
    or
    customer_id is null
    or
    gender is null
    or 
    age is null
    or 
    category is null 
    or 
    quantiy = 0
    or 
    price_per_unit = 0
    or 
    cogs = 0 
    or 
    total_sale = 0;
    
   --  ^ we run a query to know is there any columns with Null Or 0 Values
   
   delete from  `sql_project_p2`.`sql - retail sales analysis_utf`
   where 
       transactions_id is null
    or
    sale_date is null
    or
    sale_time is null
    or
    customer_id is null
    or
    gender is null
    or 
    age is null
    or 
    category is null 
    or 
    quantiy = 0
    or 
    price_per_unit = 0
    or 
    cogs = 0 
    or 
    total_sale = 0;
    
     -- ^ deleted  rows  where columns with 0 values
     
    SET SQL_Safe_Updates=0;
    
   --  ^ this is for updating  SQL data that you are in safe hands 
   
   select count(*)
   from  `sql_project_p2`.`sql - retail sales analysis_utf`;
      
       -- ^ to verify how many transactions are there 
      
      -- How many sales we have? 
      
      select count(*) as total_sale from `sql_project_p2`.`sql - retail sales analysis_utf`;
      
     --  how many customers we have
     
      select count(*) customer_id from `sql_project_p2`.`sql - retail sales analysis_utf`;
      
   --    how many distinct customers we have 
       select count(distinct customer_id)  from `sql_project_p2`.`sql - retail sales analysis_utf`;
       
       -- how many categories we have ?
       
        select count(distinct category) from `sql_project_p2`.`sql - retail sales analysis_utf`;
        
        -- Data analysis ( Key problems & answers)
        -- 1. write a SQL query to retrive all columns for sales made on 2022-11-05?
        
        select count(*)
        from `sql_project_p2`.`sql - retail sales analysis_utf`
        where sale_date = '05-11-2022';
        
        select *
        from `sql_project_p2`.`sql - retail sales analysis_utf`
        where sale_date = '05-11-2022';

-- we have total 11 sales on this Particular date .
   
   
   -- 2 . write a SQL Query to retrive all the transactions where category is clothing ? the wuentity sold is more the 4 in the month of nov 2022?
      
      select 
      category,
      sum(quantiy)
      from `sql_project_p2`.`sql - retail sales analysis_utf`
      where category = 'Clothing'
       group by 1;
       
       -- to know the total sales quantity  category clothimng 
       
         select *
      from `sql_project_p2`.`sql - retail sales analysis_utf`
      where category = 'Clothing'
      and sale_date like '%-11-2022'
      and quantiy>='4';
      
      -- Ans 18 sales with more then 4 sales on Nov 2022
      
     -- Q3. Write a SQL query to calculate total sales for each category ?
       
       Select distinct category
       from `sql - retail sales analysis_utf`;
       
       
       -- to know what are the category types 
       
         Select
         category,
         Sum(total_sale) as Net_Sales,
         count(*)as total_orders
         from `sql - retail sales analysis_utf`
         group by category;
         
         -- Ans
--  Beauty	286840	612
-- Clothing	311070	701
-- Electronics	313810	684
         
         
    -- Q4. Write aSQL query to know the average age of customers who purchased ' beauty' category?
    
    select
    avg(age) as Aage, Category
     from `sql - retail sales analysis_utf`
	where Category = 'Beauty';
    
    -- Ans
    -- 40.3497	Beauty
       
       -- Q5. write a SQL query to find all transactions where the total sales is grater then 1000?
       
       select 
      transactions_id,sale_date,sale_time,customer_id,gender,age,category,quantiy,price_per_unit,cogs,total_sale as High_rate_transactions
	from `sql - retail sales analysis_utf`
	where total_sale >= '1000';
    
    -- Detailed 
    
    Select count(*)
    from `sql - retail sales analysis_utf`
	where total_sale >= '1000';
    
    -- Ans 404 transactions.
    
 --   Q6.Write an SQL query to find the total number of transactions (transaction_id ) made by each gender in each category?
   
   select 
  gender,
  category,
  
  count(*) as total_trans
       from `sql - retail sales analysis_utf`
       group by gender,
  category
  order by 1;
  
  -- ANS
 --  Male	Beauty	282
-- Male	Clothing	354
-- Female	Clothing	347
-- Female	Beauty	330
-- Male	Electronics	344
-- Female	Electronics	340

-- Q7. Wirte an SQL qyery to calculate avarage of each month find out the best selling month in the year?
   
    describe `sql - retail sales analysis_utf`;
set sql_safe_updates=0;
       
       UPDATE `sql - retail sales analysis_utf`
SET sale_date = STR_TO_DATE(sale_date, '%d-%m-%Y')
WHERE sale_date IS NOT NULL;
       
       alter table `sql - retail sales analysis_utf` 
       modify column sale_date date;

     Select 
  year (sale_date) as year,
 month (sale_date) as month,
     avg(total_sale) as avgsales
    from `sql - retail sales analysis_utf`
group by 1,2
order by 1,2 desc;

SELECT 
Year, 
Month,
 avgsales
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avgsales,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS `rank_`
    FROM `sql - retail sales analysis_utf`
    GROUP BY 1,2
) AS t1
WHERE `rank_` = 1;		



-- order by 1,2;

-- we have 2 ways to resolve this question
SELECT DISTINCT sale_date FROM `sql - retail sales analysis_utf`;
select * from `sql - retail sales analysis_utf`;


-- 8. write a SQL query to find the top 5 customers based on highest total sales?

select
 customer_id ,
 sum(total_sale) as sales
 from `sql - retail sales analysis_utf`
 Group by customer_id
order by 2 desc
limit 5;

-- ANS
-- 3	38440
-- 1	30750
-- 5	30405
-- 2	25295
-- 4	23580

-- 9. write a SQL Query to find out the number of unique customer who purchased from each category ?

select category,
count(distinct customer_id) as unique_Customer
 from `sql - retail sales analysis_utf`
 group by category;
 
 -- ANS 
--  Beauty	141
-- Clothing	149
-- Electronics	144

-- Q.10 write a SQL query to create each shift and number of orders (e.g. Mornimg <= 12PM , afternoon between 12 & 17 , evening >17) ?

 with hourly_sales 
 as
(
select *,
case
   when extract(hour from sale_time) <12 then 'Morning'
   when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
   else 'Evening'
   end as shift
 from `sql - retail sales analysis_utf`
 )
 select shift,
 count(total_sale)
 from hourly_sales 
 Group by shift;
 
 -- END of project
 
 -- ANS 
 -- Morning	558
-- Afternoon	377
-- Evening	1062
 
 