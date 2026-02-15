-- SQL retail Sales Analysis -p1:
create Database sql_projekt_p1;

-- create table:
drop table if exists retail_sales;
create table retail_sales (
	transactions_id text,
	sale_date text,
	sale_time text,
	customer_id text,
	gender text,
	age text,
	category text,
	quantiy text,
	price_per_unit text,
	cogs text,
	total_sale text
);

select * from retail_sales;

alter table retail_sales
rename column quantiy to quantity;


alter table retail_sales
alter column transactions_id type integer using transactions_id::integer,
alter column sale_date type date using sale_date::date,
ALTER COLUMN sale_time TYPE time USING sale_time::time,
ALTER COLUMN customer_id TYPE integer USING customer_id::integer,
ALTER COLUMN age TYPE integer USING age::integer,
ALTER COLUMN quantity TYPE integer USING quantity::integer,
ALTER COLUMN price_per_unit TYPE numeric(10,2) USING price_per_unit::numeric,
ALTER COLUMN cogs TYPE numeric(10,2) USING cogs::numeric,
ALTER COLUMN total_sale TYPE numeric(10,2) USING total_sale::numeric;

alter table retail_sales
add constraint retail_sales_pk PRIMARY KEY (transactions_id);
-------------------------
select * from retail_sales
limit 10 ;
---------------------------
select 
	count(*)
from retail_sales;

----------------- check für die nulls for data Cleaing
select * from retail_sales
where transactions_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where sale_time is null;
---- check the nulls in all the data
select * from retail_sales
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
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null
;

---- delete the null -----
delete from retail_sales
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
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null
;

---- edv:
select * from retail_sales;
-- wie viele Sales haben wir? 
select count(*) as total_sales
from retail_sales;

--- wie viele customer haben wir ?
select count(DISTINCT(customer_id)) as total_customer
from retail_sales;

-- wie viele category haben wir?
select 
	count(DISTINCT(category)) as total_category
from retail_sales;

SELECT DISTINCT category
FROM retail_sales;
------
----- key problems and antwort

----- Write a SQL query to retrieve all columns for sales made on '2022-11-05' :
select * from retail_sales
where sale_date = '2022-11-05';

--- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select * from retail_sales
where
	category ='Clothing'
	and
	quantity >= 4
	and 
	to_char(sale_date, 'YYYY-MM') = '2022-11';

--- Write a SQL query to calculate the total sales (total_sale) for each category.

select 
	category,
	SUM(total_sale) as net_sale,
	count(*) as total_order
from retail_sales
group by category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

select 
	avg(age) as avg_age
from retail_sales
where category ='Beauty';

select 
	round(avg(age), 2) as avg_age
from retail_sales
where category ='Beauty';

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
select * from retail_sales;

select 
	gender,
	category,
	count (retail_sales.transactions_id) as total_transaction
	from retail_sales
	group by 
		gender,
		category
	order by gender

	select 
	gender,
	category,
	count (*) as total_transaction
	from retail_sales
	group by 
		gender,
		category
	order by gender

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT year, month, avg_sales
FROM (
  SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS avg_sales,
    RANK() OVER (
      PARTITION BY EXTRACT(YEAR FROM sale_date)
      ORDER BY AVG(total_sale) DESC
    ) AS rnk
  FROM retail_sales
  GROUP BY 1,2
) t
WHERE rnk = 1;

	
