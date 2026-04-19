create database datadiggerDBMsc;
use datadiggerDBMsc; 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1, 'Aarav Sharma', 'aarav.sharma@gmail.com', 'Delhi'),
(2, 'Priya Patel', 'priya.patel@gmail.com', 'Ahmedabad'),
(3, 'Rohan Mehta', 'rohan.mehta@gmail.com', 'Mumbai'),
(4, 'Sneha Verma', 'sneha.verma@gmail.com', 'Jaipur'),
(5, 'Karan Singh', 'karan.singh@gmail.com', 'Lucknow');

INSERT INTO Products VALUES
(1, 'Mobile', 12000, 10),
(2, 'Shoes', 2000, 20),
(3, 'Laptop', 50000, 5),
(4, 'Headphones', 1500, 15),
(5, 'Watch', 3000, 8);

INSERT INTO Orders VALUES
(1, 1, '2026-04-10', 14000),
(2, 2, '2026-04-12', 2000),
(3, 3, '2026-04-15', 50000),
(4, 1, '2026-04-16', 1500),
(5, 4, '2026-04-18', 3000);

INSERT INTO OrderDetails VALUES
(1, 1, 1, 1, 12000),
(2, 1, 2, 1, 2000),
(3, 2, 2, 1, 2000),
(4, 3, 3, 1, 50000),
(5, 4, 4, 1, 1500);
     
SELECT * FROM Customers;
UPDATE Customers SET Address='Rajkot' WHERE CustomerID=1;
DELETE FROM Customers WHERE CustomerID=5;
SELECT * FROM Customers WHERE Name='Aarav Sharma';

SELECT * FROM Orders WHERE CustomerID=1;

SELECT * FROM Orders 
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
SELECT MAX(TotalAmount), MIN(TotalAmount), AVG(TotalAmount) FROM Orders;

SELECT * FROM Products ORDER BY Price DESC;

UPDATE Products SET Price=1500 WHERE ProductID=1;
DELETE FROM Products WHERE Stock=0;
SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

SELECT SUM(SubTotal) FROM OrderDetails;

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 3;

SELECT COUNT(*) FROM OrderDetails WHERE ProductID=1;