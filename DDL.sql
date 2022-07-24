CREATE DATABASE NTESLE
GO
use NTESLE
CREATE TABLE Customer(
Customer_ID CHAR(5) PRIMARY KEY CHECK (Customer_ID LIKE 'CS[0-9][0-9][0-9]'),
Customer_Name VARCHAR(50) NOT NULL,
Customer_Phone VARCHAR(15) NOT NULL CHECK (Customer_Phone LIKE '+62[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Customer_Address VARCHAR(100) NOT NULL
)

CREATE TABLE ProductType(
Product_Type_ID CHAR(5) PRIMARY KEY CHECK (Product_Type_ID LIKE 'PT[0-9][0-9][0-9]'),
Product_Type_Name VARCHAR(25) NOT NULL
)

CREATE TABLE Product(
Product_ID CHAR(5) PRIMARY KEY CHECK (Product_ID LIKE 'PD[0-9][0-9][0-9]'),
Product_Name VARCHAR(50) NOT NULL,
Product_Type_ID CHAR(5) FOREIGN KEY REFERENCES ProductType(Product_Type_ID),
Product_Price INT NOT NULL CHECK (Product_Price >= 5000),
Product_Expire_Date DATE NOT NULL CHECK (YEAR(Product_Expire_Date) > 2020)
)

CREATE TABLE Staff(
Staff_ID CHAR(5) PRIMARY KEY CHECK (Staff_ID LIKE 'ST[0-9][0-9][0-9]'),
Staff_Name VARCHAR(50) NOT NULL,
Staff_Gender CHAR (6) NOT NULL CHECK (Staff_Gender LIKE 'Male' OR Staff_Gender LIKE 'Female'),
Staff_Phone VARCHAR(15) NOT NULL CHECK (Staff_Phone LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Staff_DOB DATE NOT NULL,
Staff_Salary INT NOT NULL CHECK (Staff_Salary BETWEEN 1000000 AND 10000000)
)

CREATE TABLE Sales_Transaction_Header(
Sales_Transaction_ID CHAR(5) PRIMARY KEY CHECK (Sales_Transaction_ID LIKE 'SL[0-9][0-9][0-9]'),
Staff_ID CHAR(5) FOREIGN KEY REFERENCES Staff(Staff_ID),
Customer_ID CHAR(5) FOREIGN KEY REFERENCES Customer(Customer_ID),
Sales_Date DATE NOT NULL
)

CREATE TABLE Sales_Transaction_Detail(
Sales_Transaction_ID CHAR(5) FOREIGN KEY REFERENCES Sales_Transaction_Header(Sales_Transaction_ID),
Product_ID CHAR(5) FOREIGN KEY REFERENCES Product(Product_ID),
Product_Quantity INT NOT NULL
PRIMARY KEY (Sales_Transaction_ID, Product_ID)
)

CREATE TABLE Ingredient(
Ingredient_ID CHAR(5) PRIMARY KEY CHECK (Ingredient_ID LIKE 'IG[0-9][0-9][0-9]'),
Ingredient_Name VARCHAR(50)NOT NULL,
Ingredient_Price INT NOT NULL,
Ingredient_Expire_DATE DATE NOT NULL CHECK (YEAR(Ingredient_Expire_DATE) > 2022)	 
)

CREATE TABLE Supplier(
Supplier_ID CHAR(5) PRIMARY KEY CHECK (Supplier_ID LIKE 'SU[0-9][0-9][0-9]'),
Supplier_Name VARCHAR(50) NOT NULL,
Supplier_Phone VARCHAR(15) NOT NULL CHECK (Supplier_Phone LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Supplier_Address VARCHAR(50) NOT NULL
)

CREATE TABLE Purchase_Transaction_Header(
Purchase_Transaction_ID CHAR(5) PRIMARY KEY CHECK (Purchase_Transaction_ID LIKE 'PU[0-9][0-9][0-9]'),
Staff_ID CHAR(5) FOREIGN KEY REFERENCES Staff(Staff_Id),
Supplier_ID CHAR(5) FOREIGN KEY REFERENCES Supplier(Supplier_ID),
Purchase_Date DATE NOT NULL
)

CREATE TABLE Purchase_Transaction_Detail(
Purchase_Transaction_ID CHAR(5) FOREIGN KEY REFERENCES Purchase_Transaction_Header(Purchase_Transaction_ID),
Ingredient_ID CHAR(5) FOREIGN KEY REFERENCES Ingredient(Ingredient_ID),
Ingredient_Quantity INT NOT NULL
PRIMARY KEY (Purchase_Transaction_ID, Ingredient_ID)
)