USE NTESLE

-- 1.	Display SupplierName, IngredientName, Total Quantity (obtained from the sum of quantity purchased) for every Ingredient whose name contains “sugar” and bought in May.

SELECT
	s.Supplier_Name AS [Supplier Name],
	i.Ingredient_Name AS [Ingredient Name],
	SUM(ptd.Ingredient_Quantity) AS [Quantity Purchased]
FROM Purchase_Transaction_Header pth
	JOIN Purchase_Transaction_Detail ptd ON pth.Purchase_Transaction_ID = ptd.Purchase_Transaction_ID
	JOIN Supplier s ON pth.Supplier_ID = s.Supplier_ID
	JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID
WHERE
	Ingredient_Name LIKE 'Sugar'
	AND MONTH(pth.Purchase_Date) = 5
GROUP BY
	s.Supplier_Name,
	i.Ingredient_Name

-- 2.	Display StaffName, StaffGender, StaffSalary, and Total Transaction (obtained from the total
-- number of sales) for every staff whose salaries are between 6 million to 7 million and the total transaction is more than 1.

SELECT
	s.Staff_Name AS [Staff Name],
	s.Staff_Gender AS [Gender],
	s.Staff_Salary AS [Salary],
	COUNT(sth.Sales_Transaction_ID) AS [Total Transaction]
FROM Staff s
	JOIN Sales_Transaction_Header sth ON s.Staff_ID = sth.Staff_ID
WHERE
	Staff_Salary BETWEEN 6000000 AND 7000000
GROUP BY
	s.Staff_Name,
	s.Staff_Gender,
	s.Staff_Salary
HAVING
	COUNT(sth.Sales_Transaction_ID) > 1

-- 3.	Display CustomerName, Customer Phone Number (obtained by replacing “+62” with “0”), ProductName, Total Transaction (obtained from the total number of transaction), and
-- Total Product Price (obtained from the sum of all product price purchased) for every product whose name has at least two words and expired year after 2021.

SELECT
	c.Customer_Name AS [Customer Name],
	REPLACE(c.Customer_Phone, '+62', '0') AS [Customer Phone Number],
	p.Product_Name AS [Product Name],
	COUNT(sth.Sales_Transaction_ID) AS [Total Transaction],
	SUM(p.Product_Price) AS [Total Product Price]
FROM
	Customer c
	JOIN Sales_Transaction_Header sth ON c.Customer_ID = sth.Customer_ID
	JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID
	JOIN Product p ON p.Product_ID = std.Product_ID
WHERE
	p.Product_Name LIKE '% %'
	AND YEAR(p.Product_Expire_Date) > 2021
GROUP BY
	c.Customer_Name,
	c.Customer_Phone,
	p.Product_Name

-- 4.	Display Total Price (obtained from the sum of ingredient price), IngredientName, and Total Transaction (obtained from the count
-- of purchase transaction) for every purchase transaction which done by a staff whose age is more than 19 years old in 2020 and the ingredient’s expired year after
-- 2024. Then sort the data in ascending format based on the total price.

SELECT
	[Total Price] = CAST(SUM(Ingredient_Price)AS VARCHAR),
	Ingredient_Name,
	[Total Transaction] = Count(pth.Purchase_Transaction_ID)
FROM Ingredient i
JOIN Purchase_Transaction_Detail ptd ON i.Ingredient_ID=ptd.Ingredient_ID
JOIN Purchase_Transaction_Header pth ON pth.Purchase_Transaction_ID = ptd.Purchase_Transaction_ID 
JOIN Staff s ON s.staff_ID = pth.Staff_ID
WHERE Staff_DOB IN (SELECT Staff_DOB FROM Staff WHERE DATEDIFF(YEAR,Staff_DOB,'2020') >19 AND YEAR(Ingredient_Expire_DATE) > '2024' )
GROUP BY 
	Ingredient_Name

--5.	Displays StaffName, Gender (obtained from the first character Staff Gender), StaffDOB, StaffSalary, and SalesTransactionID for every purchase made by staff whose salary is more than the average of all salaries combined and were born after 2000. Then sort the data in an ascending format based on the year of birth of the staff.
--(alias subquery)

SELECT
	Staff_Name,
	Staff_Gender = LEFT(Staff_Gender,1),
	Staff_DOB,
	Staff_Salary,
	Sales_Transaction_ID
FROM Staff s
JOIN Sales_Transaction_Header sth ON s.Staff_ID = sth.Staff_ID,
(SELECT [AVGS] = AVG(Staff_Salary) FROM Staff) AS Z
WHERE Staff_Salary > z.AVGS and YEAR(Staff_DOB) > '2000'

--6.) Display Supplier Number (obtained from the last 3 character Supplier ID), SupplierName, IngredientName, Ingredient Price (obtained by adding ‘Rp. ’ in front of the Ingredient Price), and IngredientExpiredDate for every Ingredient whose price is more than or equal the average of all price combined and the expired year after 2022.
--(alias subquery)
SELECT
	[Supplier Number] = RIGHT(s.Supplier_ID,3),
	Supplier_Name,
	Ingredient_Name,
	[Ingredient Price] = 'Rp. ' + CAST(Ingredient_Price AS VARCHAR),
	Ingredient_Expire_DATE
FROM Supplier s
JOIN Purchase_Transaction_Header pth ON pth.Supplier_ID = s.Supplier_ID
JOIN Purchase_Transaction_Detail ptd ON ptd.Purchase_Transaction_ID = pth.Purchase_Transaction_ID
JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID,
(SELECT [AVGP] = AVG(ingredient_price) FROM Ingredient) AS Z
WHERE Ingredient_Price >= z.AVGP AND YEAR(Ingredient_Expire_DATE) > '2022'


--7.) Display SupplierID, SupplierName, Supplier Local Phone Number (obtained by changing the first number to ‘+62’), SupplierAddress, and Total Price (obtained from sum of Ingredient Price times Quantity) for every purchase from a supplier whose last name is food and the total price is greater than the average total price. Then sort the data in descending format based on the total price.
--(alias subquery)
SELECT
	s.Supplier_ID,
	Supplier_Name,
	[Supplier Local Phone Number] = REPLACE(Supplier_Phone,LEFT(Supplier_Phone,2),'+62'),
	Supplier_Address,
	[Total Price] = SUM(Ingredient_Price*Ingredient_Quantity)
FROM Supplier s
JOIN Purchase_Transaction_Header pth ON s.Supplier_ID = pth.Supplier_ID
JOIN Purchase_Transaction_Detail ptd ON ptd.Purchase_Transaction_ID = pth.Purchase_Transaction_ID
JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID,
(SELECT [tp] = SUM(CONVERT(BIGINT, Ingredient_Price*Ingredient_Quantity)) FROM Ingredient i JOIN Purchase_Transaction_Detail ptd ON i.Ingredient_ID = ptd.Ingredient_ID) AS z
WHERE Supplier_Name like '%food'
GROUP BY  
	s.Supplier_ID,s.Supplier_ID,
	Supplier_Name,
	REPLACE(Supplier_Phone,LEFT(Supplier_Phone,2),'+62'),
	Supplier_Address
	HAVING SUM(Ingredient_Price*Ingredient_Quantity) > AVG(z.tp)

--8 Display CustomerName, SalesTransactionID, SalesDate (obtained from SalesDate in ‘dd Mon yyyy’ format), DateName (obtained from the Name of the Day in SalesDate), Quantity (obtained by adding ‘ Piece(s)’ in end of the Quantity), ProductName , SalesPrice (obtained by adding ‘Rp. ’ in front of the Product Price) and Total Price (obtained by adding ‘Rp. ’ in front of the sum of Product Price times Quantity) for every sales transaction which quantity is more than the lowest quantity and is less than the highest quantity. Then sort the data in ascending format based on the quantity.
--(alias subquery)

SELECT
	Customer_Name,
	sth.Sales_Transaction_ID,
	Sales_date = CONVERT(varchar,Sales_Date,106),
	[DateName] = Datename(weekday,Sales_date),
	[Quantity] = Cast(Product_Quantity AS VARCHAR) + ' Piece(s)',
	Product_Name,
	[SalesPrice] = 'Rp. ' + CAST(Product_Price AS VARCHAR),
	[Total Price] = 'Rp. ' + CAST(SUM(Product_price * Product_Quantity) AS VARCHAr)
FROM Customer c
JOIN Sales_Transaction_Header sth ON sth.Customer_ID = c.Customer_ID
JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID
JOIN Product p ON p.Product_ID = std.Product_ID,
(SELECT [MPQ] = MIN(Product_Quantity), [HPQ] = MAX(PRODUCT_quantity) FROM Sales_Transaction_Detail) AS Z
WHERE Product_Quantity > Z.MPQ AND Product_Quantity < z.HPQ
GROUP BY
	Customer_Name,
	sth.Sales_Transaction_ID,
	CONVERT(varchar,Sales_Date,106),
	Datename(weekday,Sales_date),
	Cast(Product_Quantity AS VARCHAR) + ' Piece(s)',
	Product_Name,
	'Rp. ' + CAST(Product_Price AS VARCHAR)
ORDER BY [Quantity] ASC

--9. Create a view named “SalesTransactionView” to display StaffName, StaffPhoneNumber, Total Transaction (obtained from the count of Sales Transaction ID), and Highest Quantity (obtained from the max of quantity) for every sales transaction which occured after August and the Total Transaction is more than 2.

CREATE VIEW SalesTransactionView
AS
SELECT
	Staff_Name,
	Staff_Phone,
	[Total Transaction] = Count(sth.Sales_Transaction_ID),
	[Highest Quantity]= MAX(Product_Quantity)
FROM Staff s
JOIN Sales_Transaction_Header sth ON s.Staff_ID=sth.Staff_ID
JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID,
(select [Total Transaction] = Count(Sales_Transaction_ID) from Sales_Transaction_Header) as z
WHERE DATENAME(MONTH,Sales_Date) > 'August' and [Total Transaction] >2
Group By Staff_Name,
	Staff_Phone

--10 Create a view named “PurchaseTransactionView” to display SupplierName, SupplierPhoneNumber, Total Transaction (obtained from the count of Purchase Transaction ID), IngredientExpiredDate, IngredientName, IngredientPrice, and Total Ingredient Price (obtained from the sum of Ingredient Price) for every Ingredient that expires in 2023 and the Total Ingredient Price is more than 60000.
CREATE VIEW PurchaseTransactionView
AS
SELECT
	Supplier_Name,
	Supplier_Phone,
	[Total Transaction] = Count(Sales_transaction_ID),
	Ingredient_Expire_DATE,
	Ingredient_Name,
	Ingredient_Price,
	[Total Ingredient Price] = SUM(Ingredient_Price)
FROM Supplier s
JOIN Purchase_Transaction_Header pth ON pth.Supplier_ID = s.Supplier_ID
JOIN Staff st ON st.Staff_ID = st.Staff_ID
JOIN Sales_Transaction_Header std ON std.staff_id = st.Staff_ID
JOIN Purchase_Transaction_Detail ptd ON ptd.Purchase_Transaction_ID = pth.Purchase_Transaction_ID
JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID,
(SELECT [Total Ingredient Price] = SUM(Ingredient_Price) FROM Ingredient) as z
WHERE YEAR(Ingredient_Expire_DATE) = '2023' AND z.[Total Ingredient Price] > 60000
GROUP BY Supplier_Name,
	Supplier_Phone,
	Ingredient_Expire_DATE,
	Ingredient_Name,
	Ingredient_Price