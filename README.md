# **Analyzing-eCommerce-Business-Performance-with-SQL**

## **Work Environment**
**Tools**: PostgreSQL<br>
**Programming Language**: SQL<br>
**Visualization**: Tableau Public<br>
**Dataset**: [Datasets]()

## **Introduction**
A mini project created by an expert tutor [Rakamin Academy](https://www.rakamin.com/). In this project, as a **Data Analyst** from eCommerce company in South America had responsibility analyze customer growth, product quality, and payment method to enhance company business performance.

## **Problem Statement**
Business performance analysis based on historical data customer activity, product quality, and payment type for over 3 years.

## **Objective**
Gathered insight from the analysis with visualization and recommendation using Tableau Public.

## **Data Preparation**
1. Created database using pgAdmin tools as mini_project_1,
2. Created 9 new table and columns using `CREATE` statement with the following dataset in csv file. Make sure the data type
   matched,
3. Imported csv data to the database using `COPY` statement. Make sure the dataset path (in local storage) must be complete until
   the file_name.csv,
4. Created ERD with determine the Primary Key and Foreign Key using `ALTER TABLE` statement.
   <p align="center">
    <img width="561" alt="ERD Screenshot" src="https://user-images.githubusercontent.com/103989278/179973144-779cc9d1-ac84-4585-9d62-f09302d01597.png"><br>
    Figure 1: Entity Relationship Diagram
   </p>

## **Analysis**
1. **Annual Customer Activity Growth Analysis**<br>
   Observed and analyzed eCommerce business performance growth from customer activities. The growth of new customers and monthly active user (MAU) are increasing every year. Most of the customers only did a single purchase for 3 years. Moreover, the value of customers who did more than one purchase every year (repeat customers) are decreasing from 2017 to 2018.
   <p align="center">
    <![Annual Customer Activity Growth Dashboard](https://user-images.githubusercontent.com/103989278/179975091-a7d007cc-de9d-428b-8227-7253642d0df2.png)><br>
    Figure 2: Annual Customer Activity Growth Dashboard
   </p>
3. **Annual Product Category Quality Analysis**
   In between categories which can be impact positively (seen by revenue metric) and which can be impact negatively. Total company revenue keep increase each year with following by product category that always change. Health & beauty is a category that has the most revenue but also the most canceled order in 2018. This could be health beauty is the most dominated category in 2018.<br>
   <p align="center">
    <![Annual Product Category Quality Dashboard](https://user-images.githubusercontent.com/103989278/179975534-a55deb0d-730d-45a7-8fcb-24772a3f0e30.png)><br>
    Figure 3: Annual Product Category Quality Dashboard
   </p>
4. **Annual Payment Type Usage Analysis**
   Payment method that has been chosen as a favorite for customer of all the time and analyze trend transformation over year.Credit card is the most favorite payment type based on sum payment type usage. Voucher tend to be decrease from 2017 to 2018. Besides, debit card tend to be increase significanly more than 100% since 2016.
   <p align="center">
    <![Annual Payment Type Usage Dashboard](https://user-images.githubusercontent.com/103989278/179975980-eafd7c76-0347-4339-9359-6a79f1582378.png)><br>
    Figure 3: Annual Product Category Quality Dashboard
   </p>