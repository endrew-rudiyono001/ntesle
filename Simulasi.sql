USE NTESLE

INSERT INTO Sales_Transaction_Header VALUES
('SL001', 'ST001', 'CS001', '2019-01-09'),
('SL002', 'ST005', 'CS001', '2019-01-12'),
('SL003', 'ST002', 'CS007', '2019-01-15'),
('SL004', 'ST003', 'CS006', '2019-01-16'),
('SL005', 'ST002', 'CS002', '2019-01-19'),
('SL006', 'ST008', 'CS003', '2019-02-05'),
('SL007', 'ST004', 'CS003', '2019-02-26'),
('SL008', 'ST010', 'CS007', '2019-03-25'),
('SL009', 'ST010', 'CS014', '2019-03-27'),
('SL010', 'ST003', 'CS012', '2019-03-29'),
('SL011', 'ST006', 'CS005', '2019-04-02'),
('SL012', 'ST008', 'CS003', '2019-04-11'),
('SL013', 'ST002', 'CS001', '2019-04-12'),
('SL014', 'ST005', 'CS002', '2019-04-15'),
('SL015', 'ST003', 'CS013', '2019-04-17'),
('SL016', 'ST001', 'CS011', '2019-04-29'),
('SL017', 'ST009', 'CS007', '2019-09-19'),
('SL018', 'ST010', 'CS009', '2019-09-09'),
('SL019', 'ST009', 'CS004', '2019-10-29')

INSERT INTO Sales_Transaction_Detail VALUES
('SL001', 'PD021', '5'),
('SL001', 'PD001', '3'),
('SL001', 'PD025', '2'),
('SL002', 'PD015', '6'),
('SL002', 'PD012', '11'),
('SL002', 'PD002', '9'),
('SL003', 'PD012', '12'),
('SL003', 'PD016', '4'),
('SL003', 'PD007', '25'),
('SL004', 'PD015', '8'),
('SL004', 'PD021', '3'),
('SL004', 'PD010', '7'),
('SL004', 'PD013', '1'),
('SL004', 'PD006', '3'),
('SL004', 'PD004', '4'),
('SL004', 'PD009', '5'),
('SL005', 'PD018', '3'),
('SL005', 'PD009', '1'),
('SL005', 'PD005', '3'),
('SL005', 'PD014', '4'),
('SL005', 'PD011', '9'),
('SL006', 'PD017', '4'),
('SL006', 'PD001', '10'),
('SL006', 'PD003', '2'),
('SL007', 'PD008', '10'),
('SL007', 'PD017', '2'),
('SL008', 'PD003', '1'),
('SL008', 'PD021', '1'),
('SL009', 'PD009', '5'),
('SL009', 'PD002', '4'),
('SL009', 'PD025', '2'),
('SL009', 'PD021', '1'),
('SL010', 'PD024', '9'),
('SL010', 'PD001', '3'),
('SL010', 'PD009', '2'),
('SL010', 'PD022', '5'),
('SL011', 'PD014', '3'),
('SL011', 'PD018', '12'),
('SL011', 'PD005', '4'),
('SL011', 'PD008', '1'),
('SL011', 'PD006', '5'),
('SL012', 'PD001', '1'),
('SL012', 'PD005', '1'),
('SL012', 'PD013', '1'),
('SL013', 'PD018', '5'),
('SL013', 'PD007', '4'),
('SL014', 'PD009', '3'),
('SL014', 'PD001', '5'),
('SL014', 'PD016', '7'),
('SL014', 'PD014', '2'),
('SL015', 'PD006', '2'),
('SL015', 'PD022', '1'),
('SL015', 'PD015', '1'),
('SL016', 'PD019', '3'),
('SL016', 'PD003', '4'),
('SL016', 'PD001', '4'),
('SL017', 'PD006', '5'),
('SL017', 'PD020', '1'),
('SL017', 'PD009', '3'),
('SL018', 'PD001', '10'),
('SL018', 'PD004', '1'),
('SL019', 'PD024', '25'),
('SL019', 'PD017', '8'),
('SL019', 'PD009', '1'),
('SL019', 'PD004', '5')

INSERT INTO Purchase_Transaction_Header VALUES
('PU001', 'ST004', 'SU001', '2020-10-19'),
('PU002', 'ST002', 'SU002', '2019-07-16'),
('PU003', 'ST006', 'SU006', '2020-10-02'),
('PU004', 'ST001', 'SU005', '2019-05-21'),
('PU005', 'ST009', 'SU008', '2020-08-26'),
('PU006', 'ST002', 'SU005', '2019-09-03'),
('PU007', 'ST007', 'SU001', '2020-05-24'),
('PU008', 'ST008', 'SU008', '2019-09-11'),
('PU009', 'ST010', 'SU009', '2020-02-19'),
('PU010', 'ST002', 'SU008', '2019-05-08'),
('PU011', 'ST001', 'SU005', '2020-03-26'),
('PU012', 'ST005', 'SU005', '2019-05-15'),
('PU013', 'ST008', 'SU002', '2020-08-20'),
('PU014', 'ST002', 'SU003', '2020-11-21'),
('PU015', 'ST003', 'SU007', '2020-03-13')

INSERT INTO Purchase_Transaction_Detail VALUES
('PU001', 'IG002', 25),
('PU001', 'IG005', 65),
('PU001', 'IG003', 50),
('PU002', 'IG006', 25),
('PU002', 'IG007', 100),
('PU003', 'IG001', 155),
('PU003', 'IG002', 25),
('PU004', 'IG001', 35),
('PU004', 'IG010', 65),
('PU005', 'IG014', 50),
('PU005', 'IG002', 55),
('PU006', 'IG006', 50),
('PU006', 'IG010', 25),
('PU007', 'IG015', 65),
('PU007', 'IG007', 25),
('PU008', 'IG008', 250),
('PU009', 'IG011', 175),
('PU009', 'IG004', 200),
('PU010', 'IG010', 150),
('PU010', 'IG014', 25),
('PU011', 'IG010', 25),
('PU011', 'IG004', 150),
('PU012', 'IG010', 200),
('PU013', 'IG005', 250),
('PU014', 'IG007', 25),
('PU015', 'IG009', 25)


--------------------------------------------------------------------------------------------------------------------------
-- Sales Transaction

-- A new Customer named 'Windah Basudara' wants to buy 'Le Minta Le' (PD017) 2 pcs and 'Hylos' (PD024) 1pcs handled by Haris Setyabudi (ST007) on 25 February 2020
-- Input a new data to Customer table for new customer
INSERT Customer VALUES
('CS015', 'Windah Basudara', '+6281232521251', 'Bekasi Street')
-- First, a Staff inputs a Header Transaction to start the transaction
INSERT Sales_Transaction_Header VALUES
('SL020', 'ST007', 'CS015', '2020-02-25')
-- Second, a Staff inputs a Detail Transaction to fill the transaction
INSERT Sales_Transaction_Detail VALUES
('SL020', 'PD017', 2),
('SL020', 'PD024', 1)
-- Third, a Staff checks the transactions detail about customer and customer's order based on transaction date
SELECT
	sth.Sales_Transaction_ID AS [Transaction ID],
	c.Customer_Name [Customer Name],
	Product_Name AS [Product Name],
	sth.Sales_Date [Transaction Date]
FROM
	Sales_Transaction_Header sth
	JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID
	JOIN Customer c ON c.Customer_ID = sth.Customer_ID
	JOIN Product p ON p.Product_ID = std.Product_ID
ORDER BY [Transaction Date]

--------------------------------------------------------------------------------------------------------------------------

-- Purchase Transaction

-- a Staff named 'Yohanes Kurniawan' (ST001) wants to purchase 'Gula' (IG011) 225 pcs and 'Meises' (IG008) 200 pcs ingredients from a new Supplier named Jaya E-Sport on 17 August 2020
-- Input a new data to Supplier table for new supplier
INSERT Supplier VALUES
('SU011', 'Jaya E-Sport', '08645649934', 'Surabaya Jalan Cengkeh 2')
-- First, a Staff inputs a Header Transaction to start the transaction
INSERT Purchase_Transaction_Header VALUES
('PU016', 'ST001', 'SU011', '2020-08-17')
-- Second, a Staff inputs a Detail Transaction to fill the transaction
INSERT Purchase_transaction_Detail VALUES
('PU016', 'IG011', 225),
('PU016', 'IG008', 200)
-- Third, a Staff checks the transactions detail about customer and customer's order based on transaction date
SELECT
	pth.Purchase_Transaction_ID AS [Transaction ID],
	s.Supplier_Name AS [Supplier Name],
	i.Ingredient_Name AS [Ingredient Name],
	Purchase_Date AS [Transaction Date]
FROM
	Purchase_Transaction_Header pth
	JOIN Purchase_Transaction_Detail ptd ON ptd.Purchase_Transaction_ID = pth.Purchase_Transaction_ID
	JOIN Supplier s ON s.Supplier_ID = pth.Supplier_ID
	JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID
ORDER BY [Transaction Date]