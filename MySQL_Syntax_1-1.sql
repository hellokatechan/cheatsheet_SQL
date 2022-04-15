--  MySQL in-class - Part 1
 
 -- Part 1: The SELECT statement and some routines
 --
 SELECT  CURRENT_DATE;
 SELECT CURRENT_TIMESTAMP;
 SELECT COS(PI()/3), ((10-1)*5)/2;
 
 SELECT DATE_FORMAT(now(),'%a-%m-%Y');
 SELECT DATE_FORMAT(now(),'%d-%m-%Y');
 SELECT DATE_FORMAT(now(),'%m-%d-%Y');
 SELECT DATE_FORMAT(now(),'%a-%m-%d-%Y');
 SELECT (20+10) As ADDITION;
 SELECT (20.5+11.8);
 SELECT 15 MOD 4;
 SELECT 15 % 4;
 SELECT 22 DIV 3;
 select 57 DIV 5;
 SELECT 22/3;
 SELECT (22 MOD 8)+(25 MOD 3);
 SELECT 0/2;
 select 5/0;
 select 0/0;
 
 SELECT (16 MOD 12) = 4;
 SELECT (16 MOD 12) = NULL;
 SELECT (16 MOD 12) <=> NULL;
 SELECT 1 = 1, NULL = NULL, 1 = NULL;
 SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;
 SELECT 1 IS NULL;
 SELECT 1 IS NOT NULL;
 SELECT NOT(1 <=> NULL);
 SELECT NOT(1=NULL);
 
 select exp(1);
 select ln(2);
 select exp(3*ln(2));
 
 --  Check whether the Time zone is installed
 SHOW VARIABLES LIKE '%time_zone%';
 -- UTC: Universal tine coordinated = US Eastern +5
 SELECT NOW();
 SELECT CURRENT_TIMESTAMP;
 
 -- See a list of created databases 
 SHOW SCHEMAS;
 
 SHOW DATABASES;
 
 
 
 
 -- Create a database
 -- Instead of "rbehboudi", use your own log-in 
DROP DATABASE IF EXISTS creditcardco2;
CREATE DATABASE IF NOT EXISTS creditcardco2;

SHOW DATABASES;

USE creditcardco2;

-- Drop the Customers table if it exists
DROP TABLE IF EXISTS Customers;

-- Create an empty customers table with the appropriate primary key
CREATE TABLE Customers (
    ID INT NOT NULL,
    CompanyName VARCHAR(255) NOT NULL,
    ContactEmail VARCHAR(255),
    PRIMARY KEY (ID)
);

-- Insert three customers into the customers table
INSERT INTO Customers
VALUES (302, 'Meyer, LLC', 'l.meyer@email.com'),
(479, 'Pourbemani Products', 's.pourbemani@email.com'), 
(128, 'Lebowitz, Incorporated', 'j.lebowitz@email.com');

-- view table
select * from Customers;

-- Repeat the process for the other three tables
DROP TABLE IF EXISTS CreditCards;

CREATE TABLE CreditCards (
    ID INT NOT NULL PRIMARY KEY,
    CCNumber CHAR(19) NOT NULL,
    Issued DATE,
    Expiration DATE,
    `Limit` INT,
    InterestRate DECIMAL(4 , 2 ),
    Customers_ID INT NOT NULL,
    FOREIGN KEY (Customers_ID)
        REFERENCES Customers (ID)
        ON DELETE RESTRICT
);

INSERT INTO CreditCards
VALUES(400685, '5349-8345-8038-9545', '2016-09-01', '2027-09-30', 5000, 15.99, 302),
(400908, '3457-3458-2349-6509', '2013-05-30', '2024-05-30', 1000, 18.99, 302),
(400524, '5489-7585-5343-4564', '2010-06-14', '2016-06-30', 30000, 24.99, 479),
(400348, '3455-4323-2433-9683',' 2014-08-10', '2024-08-31', 14000, 15.99, 128);

-- view table
select * from CreditCards;


DROP TABLE IF EXISTS Merchants;
CREATE TABLE Merchants (
    ID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    PRIMARY KEY (ID)
);

INSERT INTO Merchants
VALUES (4234, 'Hall Works', 'Retail'),
(8913, 'Spang and Company', 'Healthcare'),
(5622, 'Searles Enterprises', 'Dining and Entertainment');


-- view table
select * from Merchants;


DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (
    ID INT NOT NULL PRIMARY KEY,
    Amount DECIMAL(12 , 2 ) NOT NULL,
    `Status` VARCHAR(20),
    `Type` VARCHAR(20),
    Location VARCHAR(20),
    CreditCards_ID INT NOT NULL,
    Merchants_ID INT NOT NULL,
    FOREIGN KEY (CreditCards_ID)
        REFERENCES CreditCards (ID)
        ON DELETE RESTRICT,
    FOREIGN KEY (Merchants_ID)
        REFERENCES Merchants (ID)
        ON DELETE RESTRICT
);

INSERT INTO Transactions
VALUES (100245, 1200, 'Posted', 'Sale', 'In-person', 400685, 5622),
(100573, 3795, 'Pending', 'Sale', 'Online', 400348, 4234),
(100357, 2495, 'Posted', 'Sale', 'Online', 400685, 4234),
(100547, -1200, 'Posted', 'Return', 'In-person', 400685, 5622),
(100184, 3000, 'Posted', 'Sale', 'Online', 400348, 8913);

-- view table
select * from Transactions;


-- UPDATE
-- Expect an error if safe updates are on
UPDATE Customers 
SET 
    ContactEmail = 's.pourbemani@email.com'
WHERE
    CompanyName = 'Pourbemani Products';


UPDATE Customers 
SET 
    ContactEmail = 's.pourbemani@email.com'
WHERE
    ID = 479;

-- DELETE
DELETE FROM Customers 
WHERE
    ID = 105;


-- ALTER
ALTER TABLE Customers
ADD COLUMN (CreditScore DECIMAL(5,2));

-- INSPECT RESULT
SELECT 
    *
FROM
    Customers;


ALTER TABLE Customers
MODIFY COLUMN CreditScore INT;

-- INSPECT RESULT
SELECT 
    *
FROM
    Customers;

ALTER TABLE Customers
DROP COLUMN CreditScore;

-- INSPECT RESULT
SELECT *
FROM Customers;

--


-- INSPECT THE RESULTS IN EACH TABLE

-- view tables
SELECT * FROM Customers;

SELECT * FROM Transactions;

SELECT * FROM CreditCards;

SELECT * FROM Merchants;

--
--
--
--
--
-- Create another database - 

DROP DATABASE IF EXISTS inclass2;
CREATE DATABASE inclass2;

-- Instead of "rbehboudi", use your own log-in 
USE inclass2;

-- Database Structure:
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for table `Offers`
--

DROP TABLE IF EXISTS `Offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offers` (
  `TierID` int(11) NOT NULL,
  `TierName` varchar(255) DEFAULT NULL,
  `Offer` varchar(255) DEFAULT NULL,
  `YearlyPurchases` double DEFAULT '0',
  PRIMARY KEY (`TierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Offers`
--

LOCK TABLES `Offers` WRITE;
/*!40000 ALTER TABLE `Offers` DISABLE KEYS */;
INSERT INTO `Offers` VALUES (1,'Tin','None',0),(2,'Brass','Free coffee with each order',100),(3,'Rose Gold','Free large salad with each order',1000),(4,'Titanium','30 percent off all orders',10000);
/*!40000 ALTER TABLE `Offers` ENABLE KEYS */;
UNLOCK TABLES;



-- View the table Offers
select * from Offers;
select TierName, YearlyPurchases from Offers;

--

-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS Customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE Customers (
  ID int(11) NOT NULL,
  FName varchar(255) DEFAULT NULL,
  LName varchar(255) DEFAULT NULL,
  CurrentPts int(11) DEFAULT '0',
  YearlyCustPurchases double DEFAULT '0',
  CustTierID int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY fk_offerscustomers (CustTierID),
  CONSTRAINT fk_offerscustomers FOREIGN KEY (CustTierID) REFERENCES Offers (TierID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (101,'Dee','Spencer',65,56.67,1),(102,'Jon','Fish',145,1050.45,3),(103,'Ana','Lopez Shalla',500,456.21,2),(104,'Terianne','Hall',345,134.2,2),(105,'Nick','Ducoff',5,22,1),(106,'Juliana','Lebowitz',564,54687.3,4),(107,'Bonnie','Gibson',13,99,1),(108,'Martin','Miller',105,105,2);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

-- View the table Customers, or portions of the table
select * from Customers;
select FName, YearlyCustPurchases FROM Customers;

-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stores` (
  `ID` int(11) NOT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Nickname` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
/*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1500,12345,'City Center','16578 Main Street\r'),(1501,12346,'Boardwalk','3224 Ocean Avenue\r'),(1502,12349,'Airport','98 Airport Way\r'),(1503,12349,'City Side','14 West 15th Street');
/*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;

--
select * from Stores;
select NickName, Address FROM Stores;


-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ID` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `CustID` int(11) DEFAULT NULL,
  `OrderDate` int(11) DEFAULT NULL,
  `Price` double DEFAULT '0',
  `PointPlusMinus` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_orderscustomers` (`CustID`),
  KEY `fk_ordersstores` (`StoreID`),
  CONSTRAINT `fk_orderscustomers` FOREIGN KEY (`CustID`) REFERENCES `Customers` (`ID`),
  CONSTRAINT `fk_ordersstores` FOREIGN KEY (`StoreID`) REFERENCES `Stores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (100001,1500,101,20170113,0,0),(100002,1501,106,20170113,0,0),(100003,1502,102,20170113,0,0),(100004,1502,106,20170113,0,0),(100005,1503,102,20170113,0,0),(100006,1503,103,20170113,0,0),(100007,1500,104,20170113,0,0),(100008,1501,105,20170113,0,0),(100009,1501,106,20170113,0,0),(100010,1501,102,20170113,0,0),(100011,1501,108,20170113,0,0),(100012,1501,107,20170113,0,0),(100013,1502,106,20170113,0,0),(100014,1502,106,20170113,0,0),(100015,1502,103,20170113,0,0),(100016,1502,102,20170113,0,0),(100017,1503,101,20170113,0,0),(100018,1503,104,20170113,0,0),(100019,1503,106,20170113,0,0),(100020,1503,106,20170113,0,0);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


-- View the table Orders
select * from Orders;
select CustID, OrderDate from Orders;


DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ID` int(11) NOT NULL,
  `ProdName` varchar(255) DEFAULT NULL,
  `Calories` int(11) DEFAULT NULL,
  `Instructions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (14,'Biggest Burrito',1250,'Microwave for 120 seconds\r'),(15,'Chicken Soft Taco',350,'Assemble the taco with appropriate toppings\r'),(16,'L Curly Fries',450,'Fry for 150 seconds - apply salt and seasoning\r'),(17,'M Curly Fries',350,'Fry for 150 seconds - apply salt and seasoning\r'),(18,'S Curly Fries',250,'Fry for 150 seconds - apply salt and seasoning\r'),(19,'L Kale Salad',425,'Put the kale and toppings into the container\r'),(20,'S Kale Salad',250,'Put the kale and toppings into the container\r'),(21,'Mini Burrito',395,'Microwave for 60 seconds\r'),(22,'Chips and Guacamole',560,'Mash the avocado with other ingredients - fry the chips\r'),(23,'Chips and Queso',600,'Melt the cheese - fry the chips');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

-- Viewing the table Products and its portions
select * from Products;



-- Table structure for table `Inventories`
--

DROP TABLE IF EXISTS `Inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventories` (
  `ItemID` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `InvDate` int(11) NOT NULL,
  `Price` double DEFAULT NULL,
  `PointPrice` int(11) DEFAULT NULL,
  `Inventory` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemID`,`StoreID`,`InvDate`),
  KEY `fk_storesinventories` (`StoreID`),
  CONSTRAINT `fk_productsinventories` FOREIGN KEY (`ItemID`) REFERENCES `Products` (`ID`),
  CONSTRAINT `fk_storesinventories` FOREIGN KEY (`StoreID`) REFERENCES `Stores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Inventories`
--

LOCK TABLES `Inventories` WRITE;
/*!40000 ALTER TABLE `Inventories` DISABLE KEYS */;
INSERT INTO `Inventories` VALUES (14,1500,20170111,6.89,69,79),(14,1500,20170112,6.89,69,62),(14,1501,20170111,7.39,69,42),(14,1501,20170112,7.39,69,48),(14,1502,20170111,7.89,69,75),(14,1502,20170112,7.89,69,57),(14,1503,20170111,6.89,69,87),(14,1503,20170112,6.89,69,35),(15,1500,20170111,3.59,36,99),(15,1500,20170112,3.59,36,53),(15,1501,20170111,4.09,36,33),(15,1501,20170112,4.09,36,54),(15,1502,20170111,4.59,36,89),(15,1502,20170112,4.59,36,48),(15,1503,20170111,3.59,36,48),(15,1503,20170112,3.59,36,96),(16,1500,20170111,4.19,42,36),(16,1500,20170112,4.19,42,33),(16,1501,20170111,4.69,42,38),(16,1501,20170112,4.69,42,52),(16,1502,20170111,5.19,42,60),(16,1502,20170112,5.19,42,52),(16,1503,20170111,4.19,42,93),(16,1503,20170112,4.19,42,38),(17,1500,20170111,3.19,32,30),(17,1500,20170112,3.19,32,92),(17,1501,20170111,3.69,32,42),(17,1501,20170112,3.69,32,96),(17,1502,20170111,4.19,32,77),(17,1502,20170112,4.19,32,59),(17,1503,20170111,3.19,32,39),(17,1503,20170112,3.19,32,90),(18,1500,20170111,2.19,22,75),(18,1500,20170112,2.19,22,58),(18,1501,20170111,2.69,22,57),(18,1501,20170112,2.69,22,85),(18,1502,20170111,3.19,22,35),(18,1502,20170112,3.19,22,51),(18,1503,20170111,2.19,22,40),(18,1503,20170112,2.19,22,92),(19,1500,20170111,9.29,93,64),(19,1500,20170112,9.29,93,42),(19,1501,20170111,9.79,93,67),(19,1501,20170112,9.79,93,30),(19,1502,20170111,10.29,93,92),(19,1502,20170112,10.29,93,85),(19,1503,20170111,9.29,93,62),(19,1503,20170112,9.29,93,95),(20,1500,20170111,5.29,53,61),(20,1500,20170112,5.29,53,65),(20,1501,20170111,5.79,53,92),(20,1501,20170112,5.79,53,46),(20,1502,20170111,6.29,53,54),(20,1502,20170112,6.29,53,98),(20,1503,20170111,5.29,53,82),(20,1503,20170112,5.29,53,99),(21,1500,20170111,4.59,46,58),(21,1500,20170112,4.59,46,59),(21,1501,20170111,5.09,46,63),(21,1501,20170112,5.09,46,49),(21,1502,20170111,5.59,46,77),(21,1502,20170112,5.59,46,87),(21,1503,20170111,4.59,46,92),(21,1503,20170112,4.59,46,85),(22,1500,20170111,3.79,38,88),(22,1500,20170112,3.79,38,67),(22,1501,20170111,4.29,38,93),(22,1501,20170112,4.29,38,45),(22,1502,20170111,4.79,38,30),(22,1502,20170112,4.79,38,51),(22,1503,20170111,3.79,38,80),(22,1503,20170112,3.79,38,62),(23,1500,20170111,3.99,40,93),(23,1500,20170112,3.99,40,95),(23,1501,20170111,4.49,40,73),(23,1501,20170112,4.49,40,39),(23,1502,20170111,4.99,40,52),(23,1502,20170112,4.99,40,72),(23,1503,20170111,3.99,40,33),(23,1503,20170112,3.99,40,35);
/*!40000 ALTER TABLE `Inventories` ENABLE KEYS */;
UNLOCK TABLES;


-- View the table Inventories
select * from Inventories;
select StoreID, InvDate, Inventory FROM Inventories;







-- Table structure for table `Quantities`
--

-- DROP TABLE IF EXISTS `Quantities`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
--  /*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `Quantities` (
--  `OrderID` int(11) NOT NULL,
--  `ItemID` int(11) NOT NULL,
--  `Quantity` int(11) DEFAULT NULL,
--  `RedeemedPts` int(11) DEFAULT NULL,
--  PRIMARY KEY (`OrderID`,`ItemID`),
--  KEY `fk_productsquantities_idx` (`ItemID`),
--  CONSTRAINT `fk_productsquantities` FOREIGN KEY (`ItemID`) REFERENCES `Products` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
-- CONSTRAINT `fk_quantitiesorders` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`ID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Quantities`
--

-- LOCK TABLES `Quantities` WRITE;
-- /*!40000 ALTER TABLE `Quantities` DISABLE KEYS */;
-- INSERT INTO `Quantities` VALUES (100001,14,1,0),(100001,15,1,0),(100001,19,1,0),(100001,23,2,0),(100002,19,3,0),(100002,22,1,0),(100003,23,1,0),(100004,15,2,0),(100004,16,3,0),(100004,23,1,0),(100005,18,1,0),(100006,20,1,0),(100007,2,1,0),(100007,15,2,0),(100007,18,2,0),(100007,20,2,0),(100008,15,1,0),(100008,23,3,0),(100009,19,1,0),(100010,18,1,0),(100011,17,1,0),(100012,14,2,0),(100013,20,3,0),(100013,22,1,0),(100013,23,1,0),(100014,18,1,0),(100015,18,1,0),(100016,19,3,0),(100016,20,2,0),(100017,14,2,0),(100017,15,2,0),(100018,20,1,0),(100019,22,2,0),(100020,23,1,0);
-- /*!40000 ALTER TABLE `Quantities` ENABLE KEYS */;
-- UNLOCK TABLES;


-- Viewing the table Quantities 
-- SELECT * FROM Quantities;

--

--



/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Creating database is completed.

 --
 --
 --
 --
 
 
 -- Part 2: More on SELECT
 --
 USE inclass2;
 
 

-- (i) Selecting Rows:
--
SELECT * FROM Customers;
SELECT * FROM Customers ORDER BY LName;
SELECT * FROM Customers ORDER BY YearlyCustPurchases;
SELECT LName, YearlyCustPurchases FROM Customers ORDER BY YearlyCustPurchases DESC;
SELECT LName AS 'Customer', YearlyCustPurchases AS 'Purchase Amount' FROM Customers ORDER BY LName; 

-- (ii) SELECT with another function:
--
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) AS 'Number of Customers' FROM Customers; 

-- (iii) Specifying the number of rows to be displayed
SELECT * FROM Customers ORDER BY LName LIMIT 5;
SELECT * FROM Customers ORDER BY LName LIMIT 5 OFFSET 3;


-- (iv) Sorting with ORDER BY
--
SELECT * FROM Customers ORDER BY LName;
SELECT FName, CurrentPts, YearlyCustPurchases FROM Customers ORDER BY CurrentPts;
SELECT FName, CurrentPts, YearlyCustPurchases FROM Customers ORDER BY CurrentPts DESC;

SELECT FName AS 'Name', 
CurrentPts AS 'Current Points', 
YearlyCustPurchases AS 'Annual Purchases' 
FROM Customers 
ORDER BY CurrentPts DESC;

--
--


-- Part 3: Filtering with WHERE (a Boolian expression)
--
SELECT FName, CurrentPts, YearlyCustPurchases FROM Customers WHERE CurrentPts > 100;

SELECT FName, CurrentPts, YearlyCustPurchases FROM Customers WHERE CurrentPts > 100 
ORDER BY CurrentPts DESC ;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts > 100 
  ORDER BY CurrentPts DESC 
;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts > 100 OR CurrentPts IS NULL
  ORDER BY CurrentPts DESC 
;

-- Boolian WHERE with connectives OR and AND
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts > 500 OR CurrentPts < 10 
  ORDER BY CurrentPts DESC 
;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts > 300 AND YearlyCustPurchases > 100
  ORDER BY CurrentPts DESC 
;


-- Viewing & Analyzing the created tables
--

-- View the table Customers
select * from Customers;
select FName, LName, CurrentPts, YearlyCustPurchases from Customers;
-- View portions of the table Customers
SELECT FName, LName, YearlyCustPurchases FROM Customers WHERE YearlyCustPurchases > 1000;

--

-- View the table Inventories
select * from Inventories;
select StoreID, InvDate, Inventory from Inventories;
-- View portions of the table Inventories
select StoreID, InvDate, Inventory from Inventories WHERE Inventory < 35;


-- More analysis
-- See the total and average inventory on 01/12/2017
SELECT * FROM Inventories;
SELECT InvDate, SUM(Inventory) AS 'TotalInventory', AVG(Inventory) AS AvgInventory 
FROM Inventories WHERE InvDate = 20170112;

-- See the total and average inventory on 01/12/2017 for a particular store
SELECT InvDate, StoreID, SUM(Inventory) AS TotalInventory, AVG(Inventory) AS AvgInventory 
FROM Inventories where (InvDate = 20170111 AND StoreID = 1500);    

SELECT Invdate, 
SUM(Inventory) AS TotalInventory, 
AVG(Inventory) AS AvgInventory, 
COUNT(Inventory) AS Count 
FROM Inventories where InvDate = 20170112;
--
-- View the table Offers
select * from Offers; 
-- View portions of the table Inventories
select TierName, YearlyPurchases from Offers WHERE YearlyPurchases >= 100;

--

-- View the table Orders
select * from Orders;
select CustID, OrderDate from Orders;

--
-- Viewing the table Products and its portions
select * from Products;
select ProdName, Calories from Products WHERE Calories <= 500;

--

-- Part 4: Filtering with LIKE and IN
--
SELECT * FROM Customers;
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName LIKE '%na%'
  ORDER BY FName
;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName LIKE 'na%'
  ORDER BY FName
;
USE inclass2;
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName LIKE '%na'
  ORDER BY FName
;

-- Only Names with 'a' in the second position
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName LIKE '_a%'
  ORDER BY FName
;

-- The IN filtering operator is used to select results that match values in a list

SELECT FName, CurrentPts, CustTierID
  FROM Customers 
  WHERE CustTierID IN ('1','2')
  ORDER BY FName
;

--
--
--
--
--
--
--

-- Part 5: Filtering with Regular Expressions
--

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName LIKE '__e%'
  ORDER BY FName
;


SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE 
    FName LIKE '_a%' OR
    FName LIKE '_e%' OR
    FName LIKE '_i%' OR
    FName LIKE '_o%' OR
    FName LIKE '_u%'
  ORDER BY FName
;

-- Equivalently:
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '^.[a,e,i,o,u].*'
  ORDER BY FName
;
-- Equivalently:
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '^.[aeiou].*'
  ORDER BY FName
;
-- ^: beginning of a line
-- .: one character
-- []: The collection of characters in the second location
-- .*: Anything as the remainder of the string

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '^.[aeiou]?.*'
  ORDER BY FName
;
-- []*: zero or more
-- []+: one or more
-- []?: zero or one



-- Data whose FNames end with an "e":
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '.*e'
  ORDER BY FName
;

-- Data whose FNames that have an "O" in the second location 
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '.o.*'
  ORDER BY FName
;

-- Data whose FNames that have an "O" in the second location and end with an "e":
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '.o.*e'
  ORDER BY FName
;

-- Data whose FNames that have an "o" in the second location followed by 
-- one or more "n"s and an "i":
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '.on+i'
  ORDER BY FName
;

-- Detecting any string with space anywhere (spaces and Nulls)
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '[[:space:]]'
  ORDER BY FName
;

-- The RLIKE functon can be used instead of REFEXP
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName RLIKE '.on+i'
  ORDER BY FName
;

--
--
--
--
--
--
--

-- Part 6: Inserting, Updating, & Deleting Rows
--
-- Using the INSERT statement
SELECT * FROM Customers;
INSERT INTO Customers VALUES (109,'Rasoul','Behboudi',78,82.67,2);
SELECT * FROM Customers;

-- Inserting only in particular columns:
SELECT * FROM Customers;
INSERT INTO Customers (ID, FName, LName) VALUES (110,'Alen','Delon');
SELECT * FROM Customers;

-- Using the UPDATE statement
SELECT * FROM Customers;
SELECT * FROM Customers WHERE ID = 110;
UPDATE Customers SET CustTierID = 3 WHERE ID = 110;
SELECT * FROM Customers;

UPDATE Customers 
  SET CurrentPts = 125, YearlyCustPurchases = 2000
  WHERE ID = 110
;
SELECT * FROM Customers;

-- Using the DELETE statement (used to delete rows from a table)
SELECT * FROM Customers;
DELETE FROM Customers WHERE ID = 110;
SELECT * FROM Customers;

DELETE FROM Customers WHERE CurrentPts = 78;
SELECT * FROM Customers;


-- Part 7: Literal Strings
--
-- One string
SELECT 'Hello Class';
-- Several strings
SELECT 'Hello' ',' 'Class';
SELECT 'Hello' ' ' ',' ' ' 'Class';
-- Double quotes are legal in MySQL but not in SQL in general
SELECT "Hello ,  Class";

--
--
--
--
--
--
--

-- Part 8: NULLs (no values, lack of a value)
--
SELECT * FROM Customers;
INSERT INTO Customers (ID, FName, LName) VALUES (110,'Alen','Delon');
SELECT * FROM Customers;

-- The following will fail to find the Null in the table
SELECT * FROM Customers WHERE CustTierID = NULL;
-- Reason: NULL is a no value and the "=" operator cannot be used
-- Use the IS NULL instead:
SELECT * FROM Customers WHERE CustTierID IS NULL;
SELECT * FROM Customers WHERE CustTierID IS NOT NULL;

-- DESCRIBE  
DESCRIBE Customers;
DESCRIBE Inventories;
  
SHOW TABLE STATUS;
SHOW TABLE STATUS LIKE 'Customers';



-- End of Lecture 