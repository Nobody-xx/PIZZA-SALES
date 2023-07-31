--Show the list of databAses, after the csv file hAs been imported.
Show databAses;

-Use the imported csv file

USE PIZZADB;

--this is to check how the data is in our databAse.
Select * From PIZZA_SALES Limit 10

--This is to check the total revenue; sum total of all  pizza orders
Select SUM(total_price) As Total_Revenue From PIZZA_SALES; 

--This is to find the Average Order Value
Select SUM(total_price)  / COUNT (DISTINCT order_id) As Average_Revenue From PIZZA_SALES;

--This is to find the TOTAL pizza sold
Select SUM(QUANTITY) As TOTAL_PIZZA_SOLD From PIZZA_SALES;

--This is to find the TOTAL order
Select COUNT (DISTINCT ORDER_ID) As TOTAL_ORDER From PIZZA_SALES;

--This is to find the Average Pizza Per Order 

Select CAsT(SUM(QUANTITY) / COUNT (DISTINCT ORDER_ID) As DECIMAL(10,2)) As AVERAGE_ORDER_PER_PIZZA From PIZZA_SALES

--Code for daily trend
Select DATENAME(WEEKDAY, ORDER_DATE) As ORDER_DAY , COUNT (DISTINCT ORDER_ID) As TOTAL_ORDER 
From PIZZA_SALES GROUP BY DATENAME(WEEKDAY, ORDER_DATE);

--Code for hourly trend
Select DATEPART (HOUR, ORDER_TIME) As ORDER_HOURS, COUNT (DISTINCT ORDER_ID) As TOTAL_ORDER
From PIZZA_SALES GROUP BY DATEPART (HOUR, ORDER_TIME) ORDER BY DATEPART (HOUR, ORDER_TIME);

--Checking for % of total sales by pizza category
Select PIZZA_CATEGORY, SUM(TOTAL_PRICE) *100 / (Select SUM(TOTAL_PRICE)From PIZZA_SALES ) As  PERCENTAGE_OF_TOTAL
From PIZZA_SALES
GROUP BY PIZZA_CATEGORY   ORDER BY SUM(TOTAL_PRICE)

--Percentage of sales by pizza size
Select PIZZA_SIZE, CAsT (SUM(TOTAL_PRICE) *100 / (Select SUM(TOTAL_PRICE)From PIZZA_SALES) As DECIMAL (10,2)) As  PERCENTAGE_OF_TOTAL
From PIZZA_SALES
GROUP BY PIZZA_SIZE   ORDER BY PERCENTAGE_OF_TOTAL

--Total pizza sold  by pizza category
Select PIZZA_CATEGORY , SUM (QUANTITY) As TOTAL_PIZZA_SOLD From PIZZA_SALES
GROUP BY PIZZA_CATEGORY

--Top 5 sellers by total pizza sold
Select TOP 5 PIZZA_NAME, SUM (QUANTITY) As TOTAL_PIZZA_SOLD From PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY SUM (QUANTITY) DESC

--Bottom 5 sellers by total pizza sold
Select PIZZA_NAME, SUM (QUANTITY) As TOTAL_PIZZA_SOLD From PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY SUM (QUANTITY) 



