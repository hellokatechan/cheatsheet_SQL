 --  MySQL Tutorial II
 
 
-- Create Database - 

DROP DATABASE IF EXISTS inclass2;
CREATE DATABASE inclass2;


USE inclass2;

-- Database Structure:
-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8 */;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- 
--
DROP TABLE IF EXISTS `Stores`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stores` (
  `ID` int(11) NOT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Nickname` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
-- /*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1500,12345,'City Center','16578 Main Street\r'),(1501,12346,'Boardwalk','3224 Ocean Avenue\r'),(1502,12349,'Airport','98 Airport Way\r'),(1503,12349,'City Side','14 West 15th Street');
-- /*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;
--
--
SELECT * FROM Stores;


-- Table structure for table `Offers`
--
DROP TABLE IF EXISTS `Offers`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offers` (
  `TierID` int(11) NOT NULL,
  `TierName` varchar(255) DEFAULT NULL,
  `Offer` varchar(255) DEFAULT NULL,
  `YearlyPurchases` double DEFAULT '0',
  PRIMARY KEY (`TierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offers`
--

LOCK TABLES `Offers` WRITE;
-- /*!40000 ALTER TABLE `Offers` DISABLE KEYS */;
INSERT INTO `Offers` VALUES (1,'Tin','None',0),(2,'Brass','Free coffee with each order',100),(3,'Rose Gold','Free large salad with each order',1000),(4,'Titanium','30 percent off all orders',10000);
-- /*!40000 ALTER TABLE `Offers` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Offers;



-- Table structure for table `Products`

DROP TABLE IF EXISTS `Products`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ID` int(11) NOT NULL,
  `ProdName` varchar(255) DEFAULT NULL,
  `Calories` int(11) DEFAULT NULL,
  `Instructions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--
LOCK TABLES `Products` WRITE;
-- /*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (14,'Biggest Burrito',1250,'Microwave for 120 seconds\r'),(15,'Chicken Soft Taco',350,'Assemble the taco with appropriate toppings\r'),(16,'L Curly Fries',450,'Fry for 150 seconds - apply salt and seasoning\r'),(17,'M Curly Fries',350,'Fry for 150 seconds - apply salt and seasoning\r'),(18,'S Curly Fries',250,'Fry for 150 seconds - apply salt and seasoning\r'),(19,'L Kale Salad',425,'Put the kale and toppings into the container\r'),(20,'S Kale Salad',250,'Put the kale and toppings into the container\r'),(21,'Mini Burrito',395,'Microwave for 60 seconds\r'),(22,'Chips and Guacamole',560,'Mash the avocado with other ingredients - fry the chips\r'),(23,'Chips and Queso',600,'Melt the cheese - fry the chips');
-- /*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Products;
--

-- Table structure for table 'Customers'

DROP TABLE IF EXISTS `Customers`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `ID` int(11) NOT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `LName` varchar(255) DEFAULT NULL,
  `CurrentPts` int(11) DEFAULT '0',
  `YearlyCustPurchases` double DEFAULT '0',
  `CustTierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_offerscustomers` (`CustTierID`),
  CONSTRAINT `fk_offerscustomers` FOREIGN KEY (`CustTierID`) REFERENCES `Offers` (`TierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
-- /*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (101,'Dee','Spencer',65,56.67,1),(102,'Jon','Fish',145,1050.45,3),(103,'Ana','Lopez Shalla',500,456.21,2),(104,'Terianne','Hall',345,134.2,2),(105,'Nick','Ducoff',5,22,1),(106,'Juliana','Lebowitz',564,54687.3,4),(107,'Bonnie','Gibson',13,99,1),(108,'Martin','Miller',105,105,2);
-- /*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
SELECT * FROM Customers;


-- Table structure for table `Inventories`
--

DROP TABLE IF EXISTS `Inventories`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventories`
--
LOCK TABLES `Inventories` WRITE;
-- /*!40000 ALTER TABLE `Inventories` DISABLE KEYS */;
INSERT INTO `Inventories` VALUES (14,1500,20170111,6.89,69,79),(14,1500,20170112,6.89,69,62),(14,1501,20170111,7.39,69,42),(14,1501,20170112,7.39,69,48),(14,1502,20170111,7.89,69,75),(14,1502,20170112,7.89,69,57),(14,1503,20170111,6.89,69,87),(14,1503,20170112,6.89,69,35),(15,1500,20170111,3.59,36,99),(15,1500,20170112,3.59,36,53),(15,1501,20170111,4.09,36,33),(15,1501,20170112,4.09,36,54),(15,1502,20170111,4.59,36,89),(15,1502,20170112,4.59,36,48),(15,1503,20170111,3.59,36,48),(15,1503,20170112,3.59,36,96),(16,1500,20170111,4.19,42,36),(16,1500,20170112,4.19,42,33),(16,1501,20170111,4.69,42,38),(16,1501,20170112,4.69,42,52),(16,1502,20170111,5.19,42,60),(16,1502,20170112,5.19,42,52),(16,1503,20170111,4.19,42,93),(16,1503,20170112,4.19,42,38),(17,1500,20170111,3.19,32,30),(17,1500,20170112,3.19,32,92),(17,1501,20170111,3.69,32,42),(17,1501,20170112,3.69,32,96),(17,1502,20170111,4.19,32,77),(17,1502,20170112,4.19,32,59),(17,1503,20170111,3.19,32,39),(17,1503,20170112,3.19,32,90),(18,1500,20170111,2.19,22,75),(18,1500,20170112,2.19,22,58),(18,1501,20170111,2.69,22,57),(18,1501,20170112,2.69,22,85),(18,1502,20170111,3.19,22,35),(18,1502,20170112,3.19,22,51),(18,1503,20170111,2.19,22,40),(18,1503,20170112,2.19,22,92),(19,1500,20170111,9.29,93,64),(19,1500,20170112,9.29,93,42),(19,1501,20170111,9.79,93,67),(19,1501,20170112,9.79,93,30),(19,1502,20170111,10.29,93,92),(19,1502,20170112,10.29,93,85),(19,1503,20170111,9.29,93,62),(19,1503,20170112,9.29,93,95),(20,1500,20170111,5.29,53,61),(20,1500,20170112,5.29,53,65),(20,1501,20170111,5.79,53,92),(20,1501,20170112,5.79,53,46),(20,1502,20170111,6.29,53,54),(20,1502,20170112,6.29,53,98),(20,1503,20170111,5.29,53,82),(20,1503,20170112,5.29,53,99),(21,1500,20170111,4.59,46,58),(21,1500,20170112,4.59,46,59),(21,1501,20170111,5.09,46,63),(21,1501,20170112,5.09,46,49),(21,1502,20170111,5.59,46,77),(21,1502,20170112,5.59,46,87),(21,1503,20170111,4.59,46,92),(21,1503,20170112,4.59,46,85),(22,1500,20170111,3.79,38,88),(22,1500,20170112,3.79,38,67),(22,1501,20170111,4.29,38,93),(22,1501,20170112,4.29,38,45),(22,1502,20170111,4.79,38,30),(22,1502,20170112,4.79,38,51),(22,1503,20170111,3.79,38,80),(22,1503,20170112,3.79,38,62),(23,1500,20170111,3.99,40,93),(23,1500,20170112,3.99,40,95),(23,1501,20170111,4.49,40,73),(23,1501,20170112,4.49,40,39),(23,1502,20170111,4.99,40,52),(23,1502,20170112,4.99,40,72),(23,1503,20170111,3.99,40,33),(23,1503,20170112,3.99,40,35);
-- /*!40000 ALTER TABLE `Inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
SELECT * FROM Inventories;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--
LOCK TABLES `Orders` WRITE;
-- /*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (100001,1500,101,20170113,0,0),(100002,1501,106,20170113,0,0),(100003,1502,102,20170113,0,0),(100004,1502,106,20170113,0,0),(100005,1503,102,20170113,0,0),(100006,1503,103,20170113,0,0),(100007,1500,104,20170113,0,0),(100008,1501,105,20170113,0,0),(100009,1501,106,20170113,0,0),(100010,1501,102,20170113,0,0),(100011,1501,108,20170113,0,0),(100012,1501,107,20170113,0,0),(100013,1502,106,20170113,0,0),(100014,1502,106,20170113,0,0),(100015,1502,103,20170113,0,0),(100016,1502,102,20170113,0,0),(100017,1503,101,20170113,0,0),(100018,1503,104,20170113,0,0),(100019,1503,106,20170113,0,0),(100020,1503,106,20170113,0,0);
-- /*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--

SELECT * FROM Orders;



-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
-- 
-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- 
-- Creating database is completed.

 -- Current Database
 SELECT DATABASE();
 
 -- Tables in the database
 SHOW TABLES;
 --
 DESCRIBE Stores;
 
 -- View tables or portions of tables
SELECT * FROM Customers;
SELECT FName, YearlyCustPurchases FROM Customers;
 --
SELECT * FROM Inventories;
SELECT StoreID, InvDate, Inventory FROM Inventories;
--
SELECT * FROM Offers;
SELECT TierName, YearlyPurchases FROM Offers;
--
SELECT * FROM Orders;
SELECT CustID, OrderDate FROM Orders; 
-- 
SELECT * FROM Products; 
-- 
SELECT * FROM Stores;
SELECT NickName, Address FROM Stores;
-- 
 
 --  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
 --  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
 
 -- Part 2: More on: 
 -- SELECT, 
 -- AS, 
 -- WHERE, 
 -- ORDER BY, 
 -- LIMIT, 
 -- OFFSET, 
 -- COUNT, 
 -- SUM, 
 -- AVG, 
 -- AND, OR
 --
 USE inclass2;
 
-- (i) Selecting Rows:
--
SELECT * FROM Customers ORDER BY LName;
SELECT LName, YearlyCustPurchases FROM Customers ORDER BY YearlyCustPurchases DESC;
SELECT LName AS 'Customer', YearlyCustPurchases AS 'Purchase Amount' FROM Customers ORDER BY LName; 

-- (ii) SELECT with another function:
--
SELECT COUNT(*) AS 'Number of Customers' FROM Customers; 

-- (iii) Specifying the number of rows to be displayed
SELECT * FROM Customers ORDER BY LName LIMIT 5;
SELECT * FROM Customers ORDER BY LName LIMIT 5 OFFSET 3;

-- (iv) Sorting with ORDER BY
--
SELECT FName, CurrentPts, YearlyCustPurchases FROM Customers ORDER BY CurrentPts DESC;

SELECT FName AS 'Name', 
CurrentPts AS 'Current Points', 
YearlyCustPurchases AS 'Annual Purchases' 
FROM Customers 
ORDER BY CurrentPts DESC;

--
-- (v) Filtering with WHERE (a Boolian expression)
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
  WHERE CurrentPts > 500 OR CurrentPts < 100 
  ORDER BY CurrentPts DESC 
;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts > 300 AND YearlyCustPurchases > 100
  ORDER BY CurrentPts DESC 
;

SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE CurrentPts >= 100 AND CurrentPts <= 500
  ORDER BY CurrentPts; 



-- Viewing & Analyzing the created tables
--

-- View portions of the table Customers
SELECT FName, LName, YearlyCustPurchases FROM Customers WHERE YearlyCustPurchases > 1000;

--

-- View portions of the table Inventories
select StoreID, InvDate, Inventory from Inventories WHERE Inventory < 35;


-- More analysis
-- See the total and average inventory on 01/12/2017
SELECT * FROM Inventories;
SELECT InvDate, SUM(Inventory) AS 'Total Inventory', AVG(Inventory) AS 'Average Inventory' 
FROM Inventories WHERE InvDate = 20170112;

-- See the total and average inventory on 01/12/2017 for a particular store
SELECT InvDate, StoreID, SUM(Inventory) AS 'Total Inventory', AVG(Inventory) AS 'Average Inventory' 
FROM Inventories WHERE (InvDate = 20170111 AND StoreID = 1500);    

SELECT Invdate, 
SUM(Inventory) AS 'Total Inventory', 
AVG(Inventory) AS 'Average Inventory', 
COUNT(Inventory) AS 'Count' 
FROM Inventories WHERE InvDate = 20170112;
--
-- View the table Offers
SELECT * FROM Offers; 
-- View portions of the table Offers
SELECT TierName, YearlyPurchases FROM Offers WHERE YearlyPurchases >= 100;

-- View portion of the table Orders
SELECT * FROM Orders;
SELECT CustID, OrderDate FROM Orders;

--
--  View portion of the table Products 
SELECT ProdName, Calories FROM Products WHERE Calories <= 500;


--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Part 3: Filtering with LIKE and IN
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
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Part 4: Filtering with REGXP (Regular Expressions) and RLIKE
--

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

-- Data whose FNames that have an "o" in the second location 
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName REGEXP '.o.*'
  ORDER BY FName
;

-- Data whose FNames that have an "o" in the second location and end with an "e":
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

-- The RLIKE functon can be used instead of REGEXP
SELECT FName, CurrentPts, YearlyCustPurchases 
  FROM Customers 
  WHERE FName RLIKE '.on+i'
  ORDER BY FName
;

--
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Part 5: Inserting, Updating, & Deleting Rows
--
-- Using the INSERT statement
-- INSERT new rows:

INSERT INTO Customers 
VALUES 
(109,'Ken','Soriano-Clark',122,125.89,4),
(110,'Zeus','Rivera',98,95.85,4),
(111,'Natalie','Davis',118,211.67,4),
(112,'Patrick','Horner',108,182.67,4),
(113,'Simon','Casey',178,255.25,4),
(114,'Zack','Feinberg',59,122.99,4),
(115,'Alex','Feldler',259,228.39,4),
(116,'Ivo','Tanku',211,282.67,4),
(117,'Saurabh',' ',133,145.32,4),
(118,'Rasoul','Behboudi',78,82.67,4)
;

SELECT * FROM Customers;

-- Inserting only in particular columns:
INSERT INTO Customers (ID, FName, LName) VALUES (119,'Alen','Delon');
SELECT * FROM Customers;

-- Using the UPDATE statement
SELECT * FROM Customers WHERE ID = 110;
UPDATE Customers SET CustTierID = 3 WHERE ID = 110;
SELECT * FROM Customers WHERE ID = 110;

-- Updating more than one attribute for a particular row:
UPDATE Customers 
  SET CurrentPts = 125, YearlyCustPurchases = 2000
  WHERE ID = 110
;

SELECT * FROM Customers;

-- Using the DELETE statement (used to delete rows from a table)
DELETE FROM Customers WHERE FName = 'Alen';
SELECT * FROM Customers;

--
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Part 6: NULLs (no values, lack of a value)
--
INSERT INTO Customers (ID, FName, LName) VALUES (119,'Alen','Delon');
SELECT * FROM Customers;

-- The following will fail to find the Null in the table
SELECT * FROM Customers WHERE CustTierID = NULL;
-- Reason: NULL is a no value and the "=" operator cannot be used
-- Use the IS NULL instead:
SELECT * FROM Customers WHERE CustTierID IS NULL;
SELECT * FROM Customers WHERE CustTierID IS NOT NULL;

-- DESCRIBE  
DESCRIBE Customers;

SHOW TABLE STATUS;
SHOW TABLE STATUS LIKE 'Customers';

-- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Part 7: Literal Strings
--
-- One string
SELECT 'Hello Class';
-- Several strings
SELECT 'Hello' ',' 'Class';
SELECT 'Hello' ,' ', ',' ,' ' ,'Class';
-- Double quotes are legal in MySQL but not in SQL in general
SELECT "Hello ,  Class";

--
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 



--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- Create new database

DROP DATABASE IF EXISTS dataMedical;
CREATE DATABASE IF NOT EXISTS dataMedical;
USE dataMedical;
-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8 */;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--


-- Table structure for table `MedicalCenters`
--

DROP TABLE IF EXISTS `MedicalCenters`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedicalCenters` (
  `ID` int(11) NOT NULL,
  `Nickname` varchar(30) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Town` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalCenters`
--

LOCK TABLES `MedicalCenters` WRITE;
-- /*!40000 ALTER TABLE `MedicalCenters` DISABLE KEYS */;
INSERT INTO `MedicalCenters` VALUES (10,'River North','River North Medical Center','Cambridge','MA','02141'),(14,'River South','River South Medical Center','Boston','MA','02115');
-- /*!40000 ALTER TABLE `MedicalCenters` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM MedicalCenters;

-- Table structure for table Plans:

DROP TABLE IF EXISTS `Plans`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plans` (
  `ID` int(11) NOT NULL,
  `Tier` varchar(30) DEFAULT NULL,
  `MaxOutOfPocket` int(11) DEFAULT NULL,
  `HSA` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plans`
--

LOCK TABLES `Plans` WRITE;
-- /*!40000 ALTER TABLE `Plans` DISABLE KEYS */;
INSERT INTO `Plans` VALUES (801,'Gold',0,'T'),(802,'Silver',3000,'T'),(803,'Bronze',6000,'F');
-- /*!40000 ALTER TABLE `Plans` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Plans;


-- Table structure for table `Buildings`
--

DROP TABLE IF EXISTS `Buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buildings` (
  `ID` int(11) NOT NULL,
  `Nickname` varchar(30) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `StreetNumber` int(11) DEFAULT NULL,
  `StreetName` varchar(45) DEFAULT NULL,
  `MedicalCenters_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Buildings_MedicalCenters1_idx` (`MedicalCenters_ID`),
  CONSTRAINT `MedicalCenters_ID` FOREIGN KEY (`MedicalCenters_ID`) REFERENCES `MedicalCenters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buildings`
--

LOCK TABLES `Buildings` WRITE;
/*!40000 ALTER TABLE `Buildings` DISABLE KEYS */;
INSERT INTO `Buildings` VALUES (346,'Porter','Purple Porter Building',103,'Center Ave.',10),(352,'Davis','Blue Davis Building',105,'Center Ave.',10),(368,'Kendall','Red Kendall Building',100,'Main St.',10),(379,'Central','Green Central Building',200,'Main St.',10),(412,'Park','Yellow Park Building',613,'Broadway Ave.',14),(489,'Alewife','Orange Alewife Building',569,'Broadway Ave.',14);
/*!40000 ALTER TABLE `Buildings` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Buildings;

-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `ID` int(11) NOT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Buildings_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Departments_Buildings1_idx` (`Buildings_ID`),
  CONSTRAINT `Buildings_ID` FOREIGN KEY (`Buildings_ID`) REFERENCES `Buildings` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
-- /*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1000,'Human Resources','Administrative','Active',2,352),(1010,'Payroll','Administrative','Active',3,352),(1040,'Finance','Administrative','Active',5,352),(2043,'Dermatology','Medical - Specialist','Active',5,489),(2123,'Pediatrics','Medical - General','Active',2,489),(2234,'Sports Medicine','Medical - Specialist','Defunct',1,379),(2345,'Psychiatry','Medical - Specialist','Active',2,412),(2353,'Internal Medicine','Medical - General','Active',2,368),(2439,'General Surgery','Medical - Specialist','Active',3,489),(2443,'Internal Medicine','Medical - General','Active',1,489),(2547,'Cardiology','Medical - Specialist','Active',4,368),(2548,'Gastroenterology','Medical - Specialist','Active',5,368),(2549,'Optometry','Medical - Specialist','Active',1,346),(2576,'Endocrinology','Medical - Specialist','Active',3,412),(2594,'Neurology','Medical - Specialist','Active',2,346);
-- /*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Departments;


-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `PhoneExt` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `PrimaryDepts_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Employees_Departments1_idx` (`PrimaryDepts_ID`),
  CONSTRAINT `PrimaryDepts_ID` FOREIGN KEY (`PrimaryDepts_ID`) REFERENCES `Departments` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
-- /*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (94000,'Bonnie','Lee','Doctor','Current',76222,'b.lee@datamed.com',2123),(94012,'Henry','Parker','Surgeon','Current',76843,'h.parker@datamed.com',2439),(94053,'Skyler','Honeypot','Physician Assistant','Current',76932,'s.honeypot@datamed.com',2443),(94068,'Kyle','Cook','Doctor','Current',76496,'k.cook@datamed.com',2443),(94094,'Polly','Wormwood','Doctor','Current',76044,'p.wormwood@datamed.com',2353),(94099,'Jonathan','Martinez','Doctor','Current',76053,'j.martinez@datamed.com',2548),(94122,'Courtney','Ford','Assistant Manager','Current',76843,'c.ford@datamed.com',1010),(94123,'Thomas','Anderson','Doctor','Current',76512,'t.ansderson@datamed.com',2548),(94126,'Teresa','Adams','Doctor','Current',76733,'t.adams@datamed.com',2576),(94165,'Linda','Marshall','Director','Current',76233,'l.marshall@datamed.com',1000),(94312,'Timothy','Brown','Assistant','Current',76223,'t.brown@datamed.com',1000),(94323,'Diana','West','Manager','Current',76433,'d.west@datamed.com',1010),(94324,'Eliza','Greenleaf','Vice President','Current',76323,'e.greenleaf@datamed.com',1040),(94329,'Dale','Thompson','Physician Assistant','Previous',76843,'d.thompson@datamed.com',2234),(94333,'Lindsey','Young','Registered Nurse','Current',76431,'l.young@datamed.com',2576),(94343,'Charles','Griffin','Assistant Director','Current',76432,'c.griffin@datamed.com',1040),(94434,'Andra','Cooper','Registered Nurse','Current',76025,'a.cooper@datamed.com',2547),(94435,'Nicholas','Stilton','Doctor','Current',76834,'n.stilton@datamed.com',2548),(94441,'Sylvia','Apple','Physician Assistant','Current',76777,'s.apple@datamed.com',2043),(94489,'Christopher','Rivera','Doctor','Current',76444,'c.rivera@datamed.com',2345),(94534,'Catherine','Sanders','Doctor','Previous',76943,'c.sanders@datamed.com',2548),(94545,'Julian','Rodriguez','Doctor','Previous',76143,'j.rodriguez@datamed.com',2234),(94546,'Teri','Watson','Doctor','Current',76230,'t.watson@datamed.com',2594),(94548,'Phillip','Hughes','Doctor','Current',76612,'p.hughes@datamed.com',2547),(94564,'Lorin','Graham','Registered Nurse','Current',76632,'l.graham@datamed.com',2353),(94759,'Juliana','Lewis','Surgeon','Current',76033,'j.lewis@datamed.com',2439),(94777,'Max','Rogers','Doctor','Current',76745,'m.rogers@datamed.com',2345),(94888,'Samantha','Biscuit','Doctor','Current',76322,'s.biscuit@datamed.com',2043),(94941,'Nicole','Fox','Registered Nurse','Current',76532,'n.fox@datamed.com',2594),(94959,'Lily','Sanchez','Doctor','Current',76434,'l.sanchez@datamed.com',2123);
-- /*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
SELECT * FROM Employees;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `OutOfPocketToDate` double DEFAULT NULL,
  `Plans_ID` int(11) NOT NULL,
  `PCP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Patients_Plans1_idx` (`Plans_ID`),
  KEY `fk_Patients_Employees1_idx` (`PCP_ID`),
  CONSTRAINT `PCP_ID` FOREIGN KEY (`PCP_ID`) REFERENCES `Employees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Plans_ID` FOREIGN KEY (`Plans_ID`) REFERENCES `Plans` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
-- /*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES (6510,'William','Smith',0,801,94094),(6511,'Linda','Johnson',0,801,94053),(6512,'David','Williams',1100,802,94000),(6513,'Elizabeth','Jones',1500,802,94094),(6514,'Barbara','Brown',3000,802,94053),(6515,'John','Davis',5460,803,94000),(6516,'Patricia','Miller',0,803,94094),(6517,'Paul','Hollywood',100,803,94053),(6518,'James','Wilson',0,801,94000),(6519,'Jennifer','Moore',0,801,94094),(6520,'Robert','Taylor',1000,802,94094),(6521,'Mary','Berry',3250,803,94000),(6522,'Michael','Thomas',400,802,94094);
-- /*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Patients;


-- Table structure for table `Appointments`
--

DROP TABLE IF EXISTS `Appointments`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointments` (
  `ID` int(11) NOT NULL,
  `TimeDate` datetime DEFAULT NULL,
  `TimeLength` int(11) DEFAULT NULL,
  `Room` varchar(10) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Copay` double DEFAULT NULL,
  `PrimaryEmployees_ID` int(11) NOT NULL,
  `Patients_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Appointments_Employees1_idx` (`PrimaryEmployees_ID`),
  KEY `fk_Appointments_Patients1_idx` (`Patients_ID`),
  CONSTRAINT `Patients_ID` FOREIGN KEY (`Patients_ID`) REFERENCES `Patients` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PrimaryEmployees_ID` FOREIGN KEY (`PrimaryEmployees_ID`) REFERENCES `Employees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointments`
--

LOCK TABLES `Appointments` WRITE;
-- /*!40000 ALTER TABLE `Appointments` DISABLE KEYS */;
INSERT INTO `Appointments` VALUES (432010,'2017-06-15 09:30:00',30,'A',175,0,94545,6518),(432098,'2017-06-15 09:30:00',30,'G',675,0,94435,6511),(432111,'2017-06-15 09:30:00',50,'F',150,50,94099,6517),(432432,'2017-06-15 09:30:00',30,'A',350,0,94548,6510),(432456,'2017-06-15 09:30:00',50,'F',500,30,94329,6512),(432566,'2017-06-15 09:30:00',50,'D',500,50,94534,6513),(432656,'2017-06-15 09:30:00',50,'E',125,0,94434,6516),(432898,'2017-06-15 09:30:00',45,'A',600,100,94329,6515),(432989,'2017-06-15 09:30:00',45,'B',550,30,94546,6514);
-- /*!40000 ALTER TABLE `Appointments` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Appointments;


--
-- Table structure for table `Notes`
--

DROP TABLE IF EXISTS `Notes`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notes` (
  `ID` int(11) NOT NULL,
  `Text` text,
  `Appointments_ID` int(11) NOT NULL,
  `Employees_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Notes_Appointments1_idx` (`Appointments_ID`),
  KEY `fk_Notes_Employees1_idx` (`Employees_ID`),
  CONSTRAINT `Appointments_ID` FOREIGN KEY (`Appointments_ID`) REFERENCES `Appointments` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Employees_ID` FOREIGN KEY (`Employees_ID`) REFERENCES `Employees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notes`
--

LOCK TABLES `Notes` WRITE;
-- /*!40000 ALTER TABLE `Notes` DISABLE KEYS */;
INSERT INTO `Notes` VALUES (5553245,'Patient has high blood pressure',432432,94548),(5553246,'Patient is worried about being lethargic',432098,94435),(5553247,'Patient has gained weight',432456,94329),(5553248,'Patient should return in one month',432566,94534);
-- /*!40000 ALTER TABLE `Notes` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * FROM Notes;
--

-- Table structure for table `Prescriptions`
--

DROP TABLE IF EXISTS `Prescriptions`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescriptions` (
  `ID` int(11) NOT NULL,
  `Cost` double DEFAULT NULL,
  `Copay` double DEFAULT NULL,
  `DrugName` varchar(255) DEFAULT NULL,
  `Count` double DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  `Strength` double DEFAULT NULL,
  `StrengthUnit` varchar(10) DEFAULT NULL,
  `Refills` int(11) DEFAULT NULL,
  `Patients_ID` int(11) NOT NULL,
  `Employees_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Prescriptions_Patients1_idx` (`Patients_ID`),
  KEY `fk_Prescriptions_Employees1_idx` (`Employees_ID`),
  CONSTRAINT `Employees_ID2` FOREIGN KEY (`Employees_ID`) REFERENCES `Employees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patients_ID2` FOREIGN KEY (`Patients_ID`) REFERENCES `Patients` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescriptions`
--

LOCK TABLES `Prescriptions` WRITE;
-- /*!40000 ALTER TABLE `Prescriptions` DISABLE KEYS */;
INSERT INTO `Prescriptions` VALUES (1000001,140,10,'Drug A',90,'pills',500,'microgram',1,6515,94000),(1000002,50,5,'Drug B',5,'ounces',25,'milligram',0,6521,94000),(1000003,250,50,'Drug C',50,'pills',10,'milligram',1,6513,94094),(1000004,150,30,'Drug C',30,'pills',10,'milligram',3,6515,94000),(1000005,300,20,'Drug B',3,'ounces',150,'microgram',2,6521,94000);
-- /*!40000 ALTER TABLE `Prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
-- 
-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- 

SHOW DATABASES;
USE dataMedical;
SHOW TABLES;

DESCRIBE Appointments;

-- Concept: Display calculated fields from a table
-- Find out how much the insurance company is paying for each appointment, by appointment ID:

SELECT ID, Cost, Copay, (Cost - Copay) FROM Appointments;

-- Concept: Calculated fields as constraints using the WHERE clause
-- Find the very costly appointments for the insurance company (more than $500), by appointment ID 
SELECT ID, (Cost - Copay) AS InsuranceCost FROM Appointments WHERE (Cost - Copay) > 500;

-- Concept: Using SELECT with statistical functions
-- Find the prescriptions which cost at least  $100 to the insurance company, include the employee ID as well
SELECT ID, (Cost - Copay) AS InsuranceCost, Employees_ID FROM Prescriptions WHERE (Cost - Copay) >= 100;


-- How much is the average co-pay?
SELECT AVG(Copay) FROM Prescriptions;

-- Find the total cost of prescriptions to the insurance company for the provider with employees ID number 94000
SELECT SUM(Cost - Copay) FROM Prescriptions WHERE Employees_ID = 94000;

-- Select all of the attributes and records from the medical centers table
SELECT * FROM MedicalCenters;

-- Duplicate rows: query will get two instances of 'MA'
SELECT State FROM MedicalCenters;

-- Concept: The DISTINCT clause
-- Select, but eliminate duplicates: 
SELECT DISTINCT State FROM MedicalCenters;

-- Try selecting unique town AND state
-- FILL IT IN
SELECT DISTINCT Town, State FROM MedicalCenters;
SELECT DISTINCT State, Town FROM MedicalCenters;
SELECT DISTINCT Town AND State FROM MedicalCenters;

-- Concept: SELECT with statistical functions and constraint
SELECT COUNT(*) FROM Prescriptions WHERE Patients_ID = 6515;
SELECT Patients_ID, COUNT(*) FROM Prescriptions WHERE Patients_ID = 6515;

-- Count the number of prescriptions for each customer
SELECT Patients_ID, COUNT(*) FROM Prescriptions GROUP BY Patients_ID;
SELECT Patients_ID, COUNT(*) FROM Prescriptions;

-- Calculate the total bonus for each employee as 5% of the cost of each appointment, return by employee ID
-- FILL IT IN
SHOW TABLES FROM rbehboudi_dataMedical;
SELECT * FROM rbehboudi_dataMedical.Appointments;
SELECT PrimaryEmployees_ID, (0.05*Cost) AS 'Bonus' FROM Appointments ORDER BY PrimaryEmployees_ID;

--
-- Concept: Additional Constraints 

SELECT * FROM MedicalCenters WHERE Town='Boston';
SELECT * FROM MedicalCenters WHERE Town IN ('Boston' , 'Cambridge', 'Somerville');

-- Constrants using WHERE and logical connectives
SELECT * FROM MedicalCenters WHERE Town = 'Boston' OR Town = 'Cambridge' OR Town = 'Somerville';

-- Concept: Boolian WHERE with connective AND for applying constraints
-- Select rows where the column value is between two numbers:
-- Patients example:

SELECT * FROM Patients WHERE OutOfPocketToDate BETWEEN 3000 AND 5000;
-- [Note: Range is inclusive (>=50000 and <=100000)]
-- Alternative form:
SELECT * FROM Patients WHERE (OutOfPocketToDate >= 3000 AND OutOfPocketToDate <= 5000);
SELECT * FROM Patients WHERE NOT(OutOfPocketToDate < 3000 OR OutOfPocketToDate > 5000);

-- Select rows where the column value is outside a certain range:
SELECT * FROM Patients WHERE OutOfPocketToDate NOT BETWEEN 3000 AND 5000;
-- Alternative form:
SELECT * FROM Patients WHERE (OutOfPocketToDate < 3000 OR OutOfPocketToDate > 5000);

-- Concept Sorting by using the ORDER BY caluse
-- Note: By default ORDER BY is ASC
-- Order by one column (ASC or DESC)

SELECT * FROM Prescriptions ORDER BY Cost ASC;
SELECT * FROM Prescriptions ORDER BY Cost;
SELECT * FROM Prescriptions ORDER BY Cost DESC;

-- ORDER BY two columns, one first, and then the next:
SELECT * FROM Prescriptions ORDER BY DrugName ASC , Cost ASC;

-- Concept: The GROUP BY clause
-- List the total cost and average cost from each drug, order by the average cost, descending 
-- FILL IT IN
SELECT DrugName, SUM(Cost), AVG(Cost) FROM Prescriptions GROUP BY DrugName ORDER BY AVG(Cost) DESC;
-- Try without using the GROUP BY clause
SELECT DrugName, SUM(Cost), AVG(Cost) FROM Prescriptions ORDER BY AVG(Cost) DESC;

-- Concept: Using the LIMIT clause to restrict outputs
-- Restrict the number of output rows:
-- Find the most expensive drug by average cost:

SELECT DrugName, SUM(Cost), AVG(Cost) FROM Prescriptions GROUP BY DrugName ORDER BY AVG(Cost) DESC
LIMIT 2;

-- More SELECT + statistical functions:
-- Count the number of times each drug was prescribed

SELECT DrugName, COUNT(*) AS TimesPrescribed FROM Prescriptions GROUP BY DrugName;

-- Concept: Using HAVING to io  impose contraints:
-- List number of times each drug was prescribed for drugs which have been prescribed more than once
SELECT DrugName, COUNT(*) AS TimesPrescribed FROM Prescriptions GROUP BY DrugName
HAVING TimesPrescribed > 1;

--
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 
--  -- -- ---  -- -- -- - --  -- -- -- --  -- -- -- --  -- -- -- 

-- JOINS

-- A JOIN is a means for combining fields from two tables by using values common to each. 
-- The SQL JOIN clause is used to combine records from two or more tables in a database. 
-- There are six types of JOINS; the most frequent of which is the "INNER JOIN":
-- 1.	Right JOINs
--      A RIGHT JOIN retunes rows from the right table
--      Syntax:
--      SELECT col1, col2, .. FROM lefttable RIGHT JOIN righttable ON lefttablefield = righttablefield

--  Example: List the Names and titles of employees that have appointments

USE DataMedical;
SELECT * FROM Appointments;
SELECT * FROM Employees;

SELECT FirstName, LastName, Title, Cost FROM Employees RIGHT JOIN Appointments 
ON Appointments.PrimaryEmployees_ID = Employees.ID;

-- 2.	Left JOINs
--      A LEFT JOIN retunes rows from the left table
--      Syntax:
--      SELECT col1, col2, .. FROM lefttable LEFT JOIN righttable ON lefttablefield = righttablefield

--  Example 1: List all patient names: showing OutOfPocketExpense, Plan Tier, and MaxOutOfPocket
SELECT * FROM Patients;
SELECT * FROM Plans;

SELECT FirstName, LastName, OutOfPocketToDate, Tier, MaxOutOfPocket 
FROM Patients LEFT JOIN Plans 
ON Patients.Plans_ID = Plans.ID;

-- Example 2: Modify the previous query to determine how much each patient has left to spend 
--            out of pocket and sort from largest remaining spend to smallest remaining 

SELECT FirstName, LastName, Tier, (MaxOutOfPocket - OutOfPocketToDate) AS Remaining
FROM Patients LEFT JOIN Plans 
ON Patients.Plans_ID = Plans.ID
ORDER BY Remaining DESC;


-- 3.   INNER JOINs
--      Also called an EQUIJOIN or simply a JOIN. The INNER JOIN creates a new result table by combining column 
--      values of two tables based on the join-predicate. 
--      The query compares each row of the first table with each row of the second table 
--      to find all pairs of rows which satisfy the join-predicate. 
--      When the join-predicate is satisfied, column values for each matched pair of rows 
--      of A and B are combined into a result row.
--      In MYSAL, an INNER JOIN is equivelent to JOIN
--      Syntax:
--      SELECT col1, col2, .. FROM lefttable INNER JOIN righttable ON lefttablefield = righttablefield
--  Example 1: Determine the OutofPocketToDate and Cost for each patient that has an appointment
SELECT * FROM Patients;
SELECT * FROM Appointments;

SELECT FirstName, LastName, OutOfPocketToDate, Cost
FROM Patients INNER JOIN Appointments
ON Patients.ID = Appointments.Patients_ID
ORDER BY OutOfPocketToDate DESC;

--  Example 2: List all of the notes next to the patient name
--  Here, there are no common fields between Patients and Notes; thus a third (middle) table
--     should be used to create a bridge between the left and the right tables.
SELECT * FROM Patients;
SELECT * FROM Notes;
SELECT * FROM Appointments;

SELECT FirstName, LastName, TimeDate FROM Patients INNER JOIN Appointments 
ON Patients.ID = Appointments.Patients_ID;

-- Commutativity of JOIN:
SELECT FirstName, LastName, TimeDate FROM Appointments INNER JOIN Patients
ON Appointments.Patients_ID=Patients.ID ;


-- Double JOIN
SELECT FirstName, LastName, Text FROM Patients INNER JOIN Appointments 
ON Patients.ID = Appointments.Patients_ID
INNER JOIN Notes ON Notes.Appointments_ID = Appointments.ID;

-- Associativity of JOIN:
SELECT FirstName, LastName, Text FROM Notes INNER JOIN Appointments 
ON Notes.Appointments_ID = Appointments.ID
INNER JOIN Patients ON Patients.ID = Appointments.Patients_ID;

-- 4.	Full (outer) JOINs
--      A FULL JOIN combines the results from both right and left tables
--      Syntax:
--      SELECT col1, col2, .. FROM lefttable FULL JOIN righttable ON lefttablefield = righttablefield

-- 5.	Self JOINs
--      A SELF JOIN is used to join a table to itself as if the table were two tables, 
--      temporarily renaming at least one table in the SQL statement.
--      Syntax:
--      SELECT a.col1, b.col2, a.col3 .. FROM table a, table b WHERE a.tablefield condition b.tablefield 
--            "condition"as as a logical or mathematical operator ("=", "<", ">", ...)

-- 6.	Cartersian (Cross) JOINS
--      The CARTESIAN JOIN or CROSS JOIN returns the Cartesian product of the sets of records 
--      from the two or more joined tables. Thus, it equates to an inner join where the 
--      join-condition always evaluates to True or where the join-condition is absent from the 
--      statement.
--      Syntax:
--      SELECT col1, col2, .. FROM lefttable, righttable


-- Examples:

-- 1. List all employees and their department names
-- 2. Count the number of CURRENT employees in each medical center

USE dataMedical;
SELECT MedicalCenters.ID, MedicalCenters.Nickname, MedicalCenters.FullName , count(*)
FROM Employees LEFT JOIN Departments 
ON Employees.PrimaryDepts_ID = Departments.ID
LEFT JOIN Buildings 
ON Buildings.ID = Departments.Buildings_ID
LEFT JOIN  MedicalCenters 
ON MedicalCenters.ID = Buildings.MedicalCenters_ID
WHERE Employees.Status = 'Current' 
GROUP BY MedicalCenters.ID;


--
