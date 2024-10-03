
-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    ContactInfo VARCHAR2(150)
);

-- Create Medicines Table
CREATE TABLE Medicines (
    MedicineID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    SupplierID NUMBER,
    Price NUMBER(10, 2),
    QuantityInStock NUMBER,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    PhoneNumber VARCHAR2(15),
    Email VARCHAR2(100)
);

-- Create Sales Table (which connects Customers and Medicines)
CREATE TABLE Sales (
    SaleID NUMBER PRIMARY KEY,
    MedicineID NUMBER,
    CustomerID NUMBER,
    SaleDate DATE,
    Quantity NUMBER,
    TotalPrice NUMBER(10, 2),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Insert Data into Suppliers Table
INSERT INTO Suppliers (SupplierID, Name, ContactInfo) VALUES (1, 'Pharma Co.', '123-456-7890');
INSERT INTO Suppliers (SupplierID, Name, ContactInfo) VALUES (2, 'MedLife Ltd.', '987-654-3210');

-- Insert Data into Medicines Table
INSERT INTO Medicines (MedicineID, Name, SupplierID, Price, QuantityInStock) VALUES (1, 'Paracetamol', 1, 2.50, 100);
INSERT INTO Medicines (MedicineID, Name, SupplierID, Price, QuantityInStock) VALUES (2, 'Aspirin', 2, 1.20, 200);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, Name, PhoneNumber, Email) VALUES (1, 'John Doe', '555-1234', 'john.doe@example.com');
INSERT INTO Customers (CustomerID, Name, PhoneNumber, Email) VALUES (2, 'Jane Smith', '555-5678', 'jane.smith@example.com');

-- Insert Data into Sales Table
INSERT INTO Sales (SaleID, MedicineID, CustomerID, SaleDate, Quantity, TotalPrice) 
VALUES (1, 1, 1, SYSDATE, 2, 5.00);
INSERT INTO Sales (SaleID, MedicineID, CustomerID, SaleDate, Quantity, TotalPrice) 
VALUES (2, 2, 2, SYSDATE, 1, 1.20);

-- Update Data: Increase stock for Paracetamol
UPDATE Medicines SET QuantityInStock = 120 WHERE MedicineID = 1;

-- Delete Data: Remove a customer
DELETE FROM Customers WHERE CustomerID = 2;


-- INNER JOIN to retrieve sales with customer and medicine information
SELECT Sales.SaleID, Customers.Name AS CustomerName, Medicines.Name AS MedicineName, Sales.Quantity, Sales.TotalPrice 
FROM Sales 
INNER JOIN Customers ON Sales.CustomerID = Customers.CustomerID 
INNER JOIN Medicines ON Sales.MedicineID = Medicines.MedicineID;

-- LEFT JOIN to retrieve all medicines and their suppliers
SELECT Medicines.Name AS MedicineName, Suppliers.Name AS SupplierName
FROM Medicines
LEFT JOIN Suppliers ON Medicines.SupplierID = Suppliers.SupplierID;


-- INNER JOIN to retrieve sales with customer and medicine information
SELECT Sales.SaleID, Customers.Name AS CustomerName, Medicines.Name AS MedicineName, Sales.Quantity, Sales.TotalPrice 
FROM Sales 
INNER JOIN Customers ON Sales.CustomerID = Customers.CustomerID 
INNER JOIN Medicines ON Sales.MedicineID = Medicines.MedicineID;

-- LEFT JOIN to retrieve all medicines and their suppliers
SELECT Medicines.Name AS MedicineName, Suppliers.Name AS SupplierName
FROM Medicines
LEFT JOIN Suppliers ON Medicines.SupplierID = Suppliers.SupplierID;


-- Subquery to find suppliers who supply medicines with stock less than 50
SELECT Name 
FROM Suppliers 
WHERE SupplierID IN (
    SELECT SupplierID 
    FROM Medicines 
    WHERE QuantityInStock < 50
);
