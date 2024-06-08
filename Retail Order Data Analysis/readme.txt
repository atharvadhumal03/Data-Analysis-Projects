## Retail Order Data Analysis 

This folder contains four files: 
orders.csv - original data set (excel comma seperated values file) 
orders.zip - zip file 
query_statements - SQL script used for data analysis 
RetailOrderDataCleaning - python code file (juypter notebook) 
requirements.txt - requirements provided for extracting data to anaylze (text file) 

Overview:
The data set has been requested and imported from kaggle using kaggle api. The data set contains information in-depth information about various orders such has the product, the category, sub-category, past record sales and much more. In order to be able to effectively analyze the data, the data set has first been assiduously cleaned using python and its modules in the jupyter notebook then the cleaned data set has been imported into MySQL Workbench for conducting analysis. The cleaning of the data set consisted of handling null values, creating new columns, standardizing data types and more. The analysis of the data set was conducted by extracting the relevant data only using intermediate to advanced SQL statements.

Modules used: 
pandas module for data cleaning. 
numpy for handling null values. 
kaggle for connecting and importing the data set from kaggle.com.
zipfile to work with zipfiles.
sqlalchemy for connecting and importing the data set from jupyter to MySQL Workbench.

The data set has been analyzed as per the following requirements: 
- find top 10 highest revenue generating products.
- find top 5 highest selling products in each region.
- find month over month growth comparison for 2022 vs 2023 sales: jan 2022 vs jan 2023.
- for each category which month had the highest sales.
- show sub categories having the highest growth by profit in 2023 compare to 2022.
