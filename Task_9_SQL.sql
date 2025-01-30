CREATE DATABASE EcommerceDB;
USE EcommerceDB;
CREATE TABLE transactions (
    CustomerID INT,
    OrderID INT PRIMARY KEY,
    Product VARCHAR(255),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    PurchaseDate DATETIME,
    Country VARCHAR(255),
    TotalSpend DECIMAL(10, 2)
);
# DATA Imported check 
SELECT *
FROM transactions;
# 4. Aggregated Analysis: Extra grad
# 4.1 Customer Insights: 
# 1. Calculate the total amount spent by each customer and find the top 10 spenders. 
SELECT CustomerID,
    sum(TotalSpend) As TotalAmount
FROM transactions
GROUP BY CustomerID
ORDER BY TotalAmount DESC
limit 10;
# 2. Group data by Country and analyze the total revenue generated per country. 
SELECT Country,
    SUM(TotalSpend) AS TotalRevenue
FROM transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;
# 3. Identify which country has the highest average transaction value. 
SELECT Country,
    AVG(TotalSpend) As AverageSpentBYCountry
FROM transactions
GROUP BY Country
ORDER BY AverageSpentByCountry DESC;
# 4.2 Product Analysis: 
# 1. Find the most purchased product and its total quantity sold. 
SELECT Product,
    SUM(Quantity) As TotalQuantitySold
From transactions
group by Product
order by TotalQuantitySold Desc;
# 2. Identify the product that generated the highest revenue. 
select Product,
    Sum(TotalSpend) As HighestRevenueProduct
From transactions
group by Product
order by HighestRevenueProduct desc;
# 3. Determine the top 3 least popular products based on sales quantity. 
select Product,
    Sum(TotalSpend) As LowstSalesQuntity
From transactions
group by Product
order by LowstSalesQuntity asc;
# 4.3 Time-Based Insights: 
# 1. Analyze the total revenue generated per day in July 2022. 
Select Date(PurchaseDate) As PurchaseDay,
    Sum(TotalSpend) As TotalRevenue
From transactions
Where month(PurchaseDate) = 7
    AND Year(PurchaseDate) = 2022
group by PurchaseDay
order by PurchaseDay asc;
# 2. Identify peak shopping hours based on the number of transactions. 
# NO Hour Data Provided in the dataset
# 3. Find the day with the highest total revenue. 
Select Date(PurchaseDate) As PurchaseDay,
    Sum(TotalSpend) As TotalRevenue
From transactions
group by PurchaseDay
order by TotalRevenue desc
limit 1;
# 5. Advanced Insights:  Extra grad
# 1. Create a column for total spend per transaction (Quantity * UnitPrice). 
# Done in Python 
# 2. Use quantites to identify the top 10% of transactions based on total spend. 
# Analyze purchasing trends by country:  
# (1) Identify the most popular product in each country.
# (2) Determine the average order value per country.