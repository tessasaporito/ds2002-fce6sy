
-- Part 1: Queries

# Question 1
SELECT name FROM country WHERE Region = 'South America';

# Question 2
SELECT name, population FROM country WHERE Name = 'Germany';

# Question 3
SELECT name FROM city WHERE CountryCode = 'JPN';

# Question 4
SELECT name, population FROM country ORDER BY population DESC;

# Question 5
SELECT name, LifeExpectancy FROM country WHERE population > 1000000 AND population < 5000000;

# Question 6
SELECT name FROM country
JOIN countrylanguage ON country.code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

# Question 7
SELECT Title, AlbumID FROM Album WHERE ArtistID = (SELECT ArtistId FROM Artist WHERE Name = 'AC/DC');

# Question 8
SELECT firstname, lastname, email FROM Customer WHERE country = 'Brazil';

# Question 9
SELECT name FROM Playlist;

# Question 10
SELECT COUNT(*) FROM Track WHERE GenreID = '1';

# Question 11
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');

# Question 12
SELECT Customer.CustomerId, SUM(Invoice.Total) FROM Customer
JOIN Invoice ON Customer.CustomerID = Invoice.CustomerId
GROUP BY Customer.CustomerID;

-- Part 2: Create Tables and Insert Data

# Create tables
CREATE TABLE Book
(
    BookId INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(20) NOT NULL,
    Author VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Book PRIMARY KEY (BookId)
);

CREATE TABLE Customer
(
    CustomerId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(40) NOT NULL,
    Email VARCHAR(40),
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
);

CREATE TABLE Genre
(
    GenreId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(120),
    CONSTRAINT PK_Genre PRIMARY KEY (GenreId)
);

# Insert data into Books
INSERT INTO Books (Title, Author, Genre, Price, StockQuantity) 
VALUES
('The Idiot', 'Elif Batuman', 'Literary Fiction', 11.99, 20),
('In the Dream House', 'Carmen Maria Machado', 'Memoir', 13.99, 15),
('We Have Always Lived in the Castle', 'Shirley Jackson', 'Horror', 9.99, 30),
('Babel', 'R.F. Kuang', 'Magical Realism', 14.99, 25),
('Sula', 'Toni Morrison', 'Classic', 10.50, 40);

# Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone) 
VALUES 
('Lexi', 'Harris', 'lexi.harris@gmail.com', '345-678-9012'),
('Ophelia', 'Mcclain', 'ophelia.mcclain@gmail.com', '567-890-1234'),
('Fatimah', 'Glass', 'fatimah.glass@gmail.com', '234-567-8901'),
('Anton', 'Ramirez', 'anton.ramirez@gmail.com', '456-789-0123'),
('Meredith', 'Fields', 'meredith.fields@gmail.com', '678-901-2345');

# Insert data into Orders
INSERT INTO Orders (CustomerId, BookId, Quantity, OrderDate) 
VALUES
(1, 1, 1, '2024-09-01'),  
(2, 3, 2, '2024-09-02'), 
(3, 4, 1, '2024-09-03'), 
(4, 2, 3, '2024-09-04'),  
(5, 5, 1, '2024-09-05'); 

-- Queries:

# To find the total price of all books
SELECT SUM(price) FROM Books; 

# To create a customer email list 
SELECT email FROM Customers;

# To find how many copies of 'Sharks in the Time of Saviors' were sold
SELECT SUM(Quantity) FROM Orders WHERE BookId = (SELECT DISTINCT BookId FROM Books WHERE Title = 'Sharks in the Time of Saviors');
