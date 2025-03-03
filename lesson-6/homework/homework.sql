
create database F21_class6
use F21_class6
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Age INT
);

INSERT INTO Customers (CustomerID, FullName, Age) VALUES
(1, 'Alice Johnson', 16),
(2, 'Bob Smith', 29),
(3, 'Carol White', 45),
(4, 'Dave Brown', 60),
(5, 'Edith Green', 72);
--First way--
Select 
	*,
	case
		when Age <= 17 then 'Minor'
		when Age <=35 then 'Young adult'
		when Age <=50 then 'Adult'
		when Age <=65 then 'Senior Adult'
		else 'Senior Citizen'
	end as AgeGroup 
from Customers
--Second way--
Select
	*,
	IIF(Age<=17, 'Minor', 
			iif(Age<=35, 'Young Adult', 
				iif(Age<=50, 'Adult', iif(Age<=65, 'Senior Adult', 'Senior Citizen')))) AgeGroup
from 
	Customers

--Puzzle 3--
create table numbers (number int)

insert into numbers values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100)

Select * from numbers
--3ga bo'linsa fizz
--5ga bo'linsa buzz
--15ga bo'linsa fizzbuzz

Select
	number,
	case
		when number%15 = 0 then 'fizzbuzz'
		when number%3 = 0 then 'fizz'
		when number%5 = 0 then 'buzz'
		else 'nothing'
	end as Remainder
from numbers
