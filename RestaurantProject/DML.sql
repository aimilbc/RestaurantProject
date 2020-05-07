-- +++++++++++++++ DML +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- inserting 5 customerIDs for the miming account holders
INSERT INTO Customer (customerID)
VALUES	(1000),
		(1001),
        (1002),
        (1003),
        (1004),
		(1010),
		(1011),
        (1012),
		(1013),
        (1014),
		(1015),
        (1016),
        (1017),
		(1018),
		(1019);
-- inserting customerIDs for the anonymous customers
INSERT INTO Customer (customerID)
VALUES (1005),
	   (1006),
       (1007),
       (1008),
       (1009);
       
       
-- inserting IDs for the anonymous customers
INSERT INTO AnonCustomer (anonID, customerType)
VALUES (1005, 'Anonymous'),
	   (1006, 'Anonymous'),
       (1007, 'Anonymous'),
       (1008, 'Anonymous'),
       (1009, 'Anonymous');

-- inserting IDs for the customers who have miming accounts
INSERT INTO MimingAccount (customerID, balance)
VALUES	(1000, 27),
		(1001, 15),
		(1002, 6),
		(1003, 2),
		(1004, 64),
        (1010, 3),
		(1011, 98),
        (1012, 0),
		(1013, 67),
        (1014, 767),
		(1015, 5),
        (1016, 30),
        (1017, 23),
		(1018, 98),
		(1019, 13);
        
-- inserting data for private customers
INSERT INTO PrivateCustomer (customerID, name, email, snailMail, customerType)
VALUES	(1000, 'Mickey Mouse', 'mmouse@disney.gov', '1928 Club House Road', 'Private'),
		(1002, 'Thomas Cat', 'hannabarb@mgm.com', '20 Jerrys Space', 'Private'),
		(1004, 'Kanye West', 'nooldkanye@west.com', '808 Heartbreaks', 'Private'),
        (1016, 'Charles Edward', 'Cheese@ed.com', '56 Crying Ave.', 'Private'),
        (1017, 'Mr Winkleheimer', 'Winkleheimer@sw.com', '666 Heart Attack', 'Private'),
        (1014, 'David Brown', 'db@csulb.edu', '323 Database Ln.', 'Private'),
        (1019, 'Mr Narwhal', 'Narwhal@yeah.com', '123 whoohoo Blvd.', 'Private')
        ;
      
-- inserting data for corporate customers
INSERT INTO CorporateCustomer (customerID, name, corporationName, organizationName, contactEmailAddress, officeAddress, customerType)
VALUES 	(1001, 'Elon Musk', 'Alset', 'Sales', 'contact@musk.com', '3500 Deer Creek', 'Corporate'),
		(1003, 'Bill Gates', 'Microfirm', 'Accounting', 'contact@gates.com', '2 Redmond, WA', 'Corporate'),
        (1010, 'Mickey Mouse', 'Walt Disney' , 'Customer service', 'mmouse@disney.gov', '1928 Club House Road', 'Corporate'),
        (1011, 'Monkey Mouse', 'Walnut', 'Customer service', 'mmouse@walnut.gov', '339 House Ave.', 'Corporate'),
        (1012, 'Kanye West', 'YEEZUS', 'Singer', 'nooldkanye@west.com', '808 Heartbreaks', 'Corporate'),
        (1013, 'Jerry Mouse', 'Jerry Corp.', 'Chasing Cheese', 'j@mouse.com', '808 Hakathon Ave', 'Corporate'),
        (1018, 'Earl Stevens', 'Sick Wid It Records', 'Rapper', 'rapper@gov.com', '777 BeverlyHill Ave', 'Corporate'),
        (1015, 'Howard Bailey', 'Right Thurr', 'Chinggy', 'HB@bailey.com', '000 Thurr Rd', 'Corporate')
        ;

-- insert party data in Party table
INSERT INTO Party (customerID, paymentTime, orderDate, paymentType)
VALUES	(1000, '09:40:00', '2020-01-01', 'mimingsMoney'),
		(1001, '18:23:00', '2020-03-12', 'moneyOrder'),
        (1002, '12:54:00', '2020-05-06', 'credit'),
        (1003, '16:42:00', '2019-12-24', 'cash'),
        (1004, '11:10:00', '2020-04-20', 'debit'),
        (1000, '13:23:00', '2020-01-01', 'mimingsMoney'),
        (1000, '17:05:00', '2020-01-01', 'cash'),
        (1003, '18:48:00', '2020-05-06', 'mimingsMoney'),
        
        (1014, '18:23:00', '2018-03-12', 'moneyOrder'),
        (1014, '12:54:00', '2017-05-06', 'credit'),
        (1014, '16:42:00', '2017-12-24', 'cash'),
        (1014, '11:10:00', '2018-04-20', 'debit'),
        (1014, '13:23:00', '2019-01-01', 'mimingsMoney'),
        (1014, '17:05:00', '2020-01-01', 'cash'),
        (1014, '18:48:00', '2020-05-06', 'mimingsMoney'),
        
		(1010, '18:23:00', '2018-03-12', 'moneyOrder'),
        (1010, '12:54:00', '2017-05-06', 'credit'),
        (1010, '16:42:00', '2017-12-24', 'cash'),
        
        (1000, '11:10:00', '2018-04-20', 'debit'),
        (1000, '13:23:00', '2019-01-01', 'mimingsMoney'),
        
        (1017, '17:05:00', '2020-01-01', 'cash'),
        (1017, '18:48:00', '2020-05-06', 'mimingsMoney'),
        (1019, '18:23:00', '2018-03-12', 'moneyOrder'),
        (1019, '12:54:00', '2017-05-06', 'credit'),
        (1019, '16:42:00', '2017-12-24', 'cash'),
        
        (1011, '11:10:00', '2018-04-20', 'debit'),
        (1011, '13:23:00', '2019-01-01', 'mimingsMoney'),
        
        (1012, '17:05:00', '2020-01-01', 'cash'),
        (1012, '18:48:00', '2020-05-06', 'mimingsMoney'),
        
        
		(1013, '17:05:00', '2020-01-01', 'cash'),
        (1013, '18:48:00', '2020-05-06', 'mimingsMoney'),
        (1018, '18:23:00', '2018-03-12', 'moneyOrder'),
        (1018, '12:54:00', '2017-05-06', 'credit'),
        (1018, '16:42:00', '2017-12-24', 'cash'),
        
        (1015, '11:10:00', '2018-04-20', 'debit'),
        (1015, '13:23:00', '2019-01-01', 'mimingsMoney')
        ;
        
-- insert orders data in Orders table
INSERT INTO Orders (customerID, paymentTime, orderDate, orderNum)
VALUES	(1000, '09:40:00', '2020-01-01', 1234), -- Alone customer
		(1001, '18:23:00', '2020-03-12', 2345), -- Party order(4)
        (1002, '12:54:00', '2020-05-06', 3456), -- PickUp order
        (1003, '16:42:00', '2019-12-24', 4567), -- PickUp order
        (1004, '11:10:00', '2020-04-20', 5678), -- Alone customer
        (1000, '13:23:00', '2020-01-01', 6789), -- Party order(2)
        (1000, '17:05:00', '2020-01-01', 7890), -- PickUp order
        (1003, '18:48:00', '2020-05-06', 7777), -- PickUp order
		(1014, '18:23:00', '2018-03-12', 2001),
        (1014, '12:54:00', '2017-05-06', 2002),
        (1014, '16:42:00', '2017-12-24', 2003),
        (1014, '11:10:00', '2018-04-20', 2004),
        (1014, '13:23:00', '2019-01-01', 2005),
        (1014, '17:05:00', '2020-01-01', 2006),
        (1014, '18:48:00', '2020-05-06', 2007),
        
		(1010, '18:23:00', '2018-03-12', 2008),
        (1010, '12:54:00', '2017-05-06', 2009),
        (1010, '16:42:00', '2017-12-24', 2010),
        
        (1000, '11:10:00', '2018-04-20', 2011),
        (1000, '13:23:00', '2019-01-01', 2012),
        
        (1017, '17:05:00', '2020-01-01', 2013),
        (1017, '18:48:00', '2020-05-06', 2014),
        (1019, '18:23:00', '2018-03-12', 2015),
        (1019, '12:54:00', '2017-05-06', 2016),
        (1019, '16:42:00', '2017-12-24', 2017),
        
        (1011, '11:10:00', '2018-04-20', 2018),
        (1011, '13:23:00', '2019-01-01', 2019),
        
        (1012, '17:05:00', '2020-01-01', 2020),
        (1012, '18:48:00', '2020-05-06', 2021),
        
        
		(1013, '17:05:00', '2020-01-01', 2022),
        (1013, '18:48:00', '2020-05-06', 2023),
        (1018, '18:23:00', '2018-03-12', 2024),
        (1018, '12:54:00', '2017-05-06', 2025),
        (1018, '16:42:00', '2017-12-24', 2026),
        
        (1015, '11:10:00', '2018-04-20', 2027),
        (1015, '13:23:00', '2019-01-01', 2028);

-- adding more orders for party order
INSERT INTO Orders (customerID, paymentTime, orderDate, orderNum)
VALUES	(1001, '18:23:00', '2020-03-12', 2346),
		(1001, '18:23:00', '2020-03-12', 2347),
		(1001, '18:23:00', '2020-03-12', 2348),
        (1000, '13:23:00', '2020-01-01', 6790);

-- insert pick up orders into PickUp table
INSERT INTO PickUp (orderNum, orderType, readyTime)
VALUES	(3456, 'phone', '12:30:00'),
        (4567, 'web', '16:30:00'),
        (7890, 'phone', '17:00:00'),
        (7777, 'web', '18:30:00');

-- insert table data in Tables table
INSERT INTO Tables (tableNumber,capacity)
VALUES	(1,1),
		(2,6),
		(3,7),
        (4,6),
        (5,2);
     
-- insert seat data in Seats table
INSERT INTO Seats (seatNum, tableNumber)
VALUES	('A',1),
		('A',2),
        ('B',2),
        ('C',2),
        ('D',2),
		('E',2),
        ('F',2),
        ('A',3),
        ('B',3),
		('C',3),
        ('D',3),
        ('E',3),
        ('F',3),
		('G',3),
		('A',4),
        ('B',4),
        ('C',4),
        ('D',4),
		('E',4),
        ('F',4),
		('A',5),
        ('B',5);

-- insert eat in orders into EatIn table
INSERT INTO EatIn (orderNum, seatNo,tableNumber)
VALUES	(1234,'A',1),
		(5678,'A',5),
        (2345,'B',2),
        (2346,'C',2),
        (2347,'D',2),
        (2348,'E',2),
        (6789,'F',3),
        (6790,'G',3),
        
        (2001,'A',5),
        (2002,'B',2),
        (2003,'C',2),
        (2004,'D',2),
        (2005,'E',2),
        (2006,'F',3),
        (2007,'G',3),
        (2008,'A',5),
        (2009,'B',2),
        (2010,'C',2),
        (2011,'D',2),
        (2012,'E',2),
        (2013,'F',3),
        (2014,'G',3),
        (2015,'A',5),
        (2016,'B',2),
        (2017,'C',2),
        (2018,'D',2),
        (2019,'E',2),
        (2020,'F',3),
        (2021,'G',3),
        (2022,'A',5),
        (2023,'B',2),
        (2024,'C',2),
        (2025,'D',2),
        (2026,'E',2),
        (2027,'F',3),
        (2028,'F',2)
        ;

/*Staff*/
INSERT INTO Staff (firstName,lastName,employeeID)
VALUES ('John', 'Lennon',1),
('George','Harrison',2),
('John','Fante',3),
('Charles','Bukowski',4),
('Steve','Miller',5),
('Joni','Mitchell',6),
('Brooks','Nielson',7),
('Joe','Walsh',8),
('Robbie','Robertson',9),
('Lou','Reed',10),
('Glen','Frey',11),
('Timothy','Schmidt',12),
('Jim','Morrison',13),
('Don','Henley',14),
('Donald','Fagen',15),
('Cal','Tjader',16),
('Stan','Getz',17),
('Charlie','Parker',18),
('Allen','Ginsberg',19),
('William','Burroughs',20),
('Dewey','Bunnell',21),
('Gerry','Beckley',22),
('Paul','McCartney',23),
('Dan','Peek',24),
('Henry','Chinaski',25),
('Arturo','Bandini',26),
('Sal','Paradise',27);

/*PartTime*/
insert into PartTime(employeeID,hourlyRate)
values(1,10.00),
(2,10.25),
(3,10.75),
(4,15.00),
(5,15.25),
(6,15.75),
(7,16.00),
(8,16.75),
(9,15.00),
(10,15.25),
(11,20.75),
(12,21.00);

/*FullTime*/
insert into FullTime(employeeID,salary)
values(13,35000.0),
(14,40000.0),
(15,45000.0),
(16,50000.0),
(17,43000.0),
(18,20700.0),
(19,36000.0),
(20,42000.0),
(21,56000.0),
(22,77000.0),
(23,59000.0),
(24,39000.0),
(25,89000.0),
(26,67000.0),
(27,77000.0);

/*Dishwasher*/
insert into Dishwasher(employeeID)
values(1),
(2),
(3),
(4);

/*Maitre_d*/
insert into Maitre_d(employeeID)
values(5),
(6),
(7),
(8);

/*Waiters*/
insert into Waiters(employeeID,tips)
values(9,null),
(10,null),
(11,null),
(12,null);

/*Chef*/
insert into Chef(employeeID)
values(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24);

/*SousChef*/
insert into SousChef(employeeID)
values(13),
(14),
(15),
(16);

/*LineCook*/
insert into LineCook(employeeID)
values(17),
(18),
(19),
(20);

/*HeadCook*/
/*Might need to insert this with trigger? use values 20-24 from Chef*/
insert into HeadChef(employeeId,firstName,lastName)
values(21,'Dewey','Bunnell'),
(22,'Gerry','Beckley'),
(23,'Paul','McCartney'),
(24,'Dan','Peek');


/*Manager*/
insert into Manager(employeeID)
values(25),
(26),
(27);

-- inserting data into Item
INSERT INTO Item (itemName, employeeID)
VALUES	('Egg Drop Soup', 24),
		('Chow Mein', 21),
        ('Egg Foo Young', 23),
		('Kung Pao', 22);
        
-- inserting data into Item
INSERT INTO Item (itemName, employeeID)
VALUES	('Wonton Noodle Soup', 24),
		('Hot & Sour Soup', 24),
        ('Beef Noodle Soup', 23),
		('Vegetable Soup', 22),
        ('Chicken Veg Soup', 21),
		('Chop Suey', 21);
 
-- inserting data into Item
INSERT INTO Item (itemName, employeeID)
VALUES	('Egg Rolls', 24),
		('Crab Rangoon', 22),
        ('Fried Wonton', 23),
		('Garlic Green Beans', 23),
        ('Steamed Bun', 22),
        ('Congee', 21);
   
-- inserting data into Soup
INSERT INTO Soup (itemName)
VALUES	('Egg Drop Soup'),
		('Wonton Noodle Soup'),
        ('Hot & Sour Soup'),
		('Beef Noodle Soup'),
        ('Vegetable Soup'),
        ('Chicken Veg Soup');
  
-- inserting data into MeatEntrees
INSERT INTO MeatEntrees (itemName, meatType)
VALUES	('Chow Mein', 'Chicken'),
		('Chow Mein', 'Vegetable'),
        ('Egg Foo Young', 'Pork'),
		('Chop Suey', 'Chicken'),
        ('Egg Foo Young', 'Chef Special'),
        ('Chop Suey', 'Beef'),
        ('Kung Pao', 'Chicken'),
        ('Chow Mein', 'Seafood');
        
-- inserting data into Appetizer
INSERT INTO Appetizer (itemName)
VALUES	('Egg Rolls'),
		('Crab Rangoon'),
        ('Fried Wonton'),
		('Garlic Green Beans'),
        ('Steamed Bun'),
        ('Congee');
        
-- inserting data into MenuItem
INSERT INTO MenuItem (menuItemID, menu, itemName, price, spicyLevel)
VALUES	(13, 'Lunch', 'Egg Drop Soup', 5.99, 'Piquant'),
		(14, 'Lunch', 'Egg Drop Soup', 5.99, 'Hot');
   
-- inserting data into MenuItem
INSERT INTO MenuItem (menuItemID, menu, itemName, price, spicyLevel)
VALUES	(1, 'Evening', 'Egg Foo Young', 9.99, 'Piquant'),
		(2, 'Childrens', 'Egg Drop Soup', 7.99, NULL),
        (3, 'Evening', 'Kung Pao', 11.99, 'Oh My God'),
		(4, 'Evening', 'Egg Drop Soup', 5.99, 'Hot'),
        (5, 'Lunch', 'Congee', 4.99, 'Tangy'),
		(6, 'Lunch', 'Vegetable Soup', 6.99, 'Hot'),
        (7, 'All You Can Eat Sensational Suicide Sunday Brunch', 'Buffet', 19.99, 'Piquant'),
		(10, 'Childrens', 'Congee', 2.49, NULL),
        (11, 'Childrens', 'Steamed Bun', 4.49, NULL),
		(12, 'Childrens', 'Chow Mein', 5.49, NULL);

/*Expertise*/
insert into Expertise(itemName,expertID)
values
('Chicken Veg Soup', 13),
('Chop Suey',13),
('Chow Mein',13),
('Congee',13),
('Kung Pao',13),
('Steamed Bun',13),
('Crab Rangoon',13),
('Beef Noodle Soup',13),
('Egg Drop Soup',13),

('Chop Suey',14),
('Kung Pao',14),
('Egg Foo Young',14),
('Egg Rolls',14),
('Vegetable Soup',14),
('Beef Noodle Soup',14),
('Fried Wonton',14),

('Chow Mein',15),
('Steamed Bun',15),
('Fried Wonton',15),
('Hot & Sour Soup',15),
('Wonton Noodle Soup',15),
('Crab Rangoon',15),

('Congee',16),
('Vegetable Soup',16),
('Garlic Green Beans',16),
('Wonton Noodle Soup',16),
('Egg Drop Soup',16),
('Egg Rolls',16)
;

/*Mentorship*/
insert into Mentorship(expertID,itemName,sousID,startDate,endDate)
values(14,'Chop Suey',16,'2020-2-5','2020-2-19'),
(15,'Chow Mein',13,'2018-1-3','2018-1-7'),
(16,'Congee',14,'2019-5-5','2019-5-23'),
(13,'Crab Rangoon',15,'2017-3-12','2017-3-14'),
(14,'Kung Pao',13,'2020-3-15','2020-3-24');

-- inserting data into OrderLineItem
INSERT INTO OrderLineItem (orderNum, menuItemID, quantity)
VALUES	(1234, 4, 2),
		(1234, 1, 3),
        (6789, 2, 2),
		(6789, 10, 3),
        (6789, 11, 6),
		(6790, 7, 1),
		(7890, 1, 4),
        (2345, 12, 2),
		(2345, 10, 2),
        (2345, 6, 1),
        (2346, 7, 1),
        (2347, 13, 2),
        (2347, 6, 2),
        (2348, 7, 1),
        (3456, 5, 3),
        (3456, 14, 2),
        (4567, 11, 5),
        (4567, 12, 2),
        (4567, 14, 2),
        (5678, 1, 2),
        (5678, 4, 2),
        (7777, 14,7),
        (2001, 1, 3),
        (2002, 2, 2),
		(2003, 10, 3),
        (2004, 11, 6),
		(2005, 7, 1),
        (2006, 7, 1),
        (2007, 7, 1),
		(2008, 1, 4),
        (2009, 12, 2),
		(2010, 10, 2),
        (2011, 6, 1),
        (2012, 7, 1),
        (2013, 7, 3),
        (2014, 13, 2),
        (2015, 6, 2),
        (2016, 7, 1),
        (2017, 5, 3),
        (2018, 14, 2),
        (2019, 11, 5),
        (2020, 12, 2),
        (2021, 14, 2),
        (2022, 1, 2),
        (2023, 4, 2),
        (2024, 14,7),
        (2025, 6, 2),
        (2026, 7, 1),
        (2027, 5, 3),
        (2028, 13, 3)
        
        ;

-- insert station name in Station table
INSERT INTO Station (stationName)
VALUES	('Area 51'),
		('Area 323'),
		('Beach side'),
        ('Bonfire'),
        ('Machete!');

-- disable foreign key to insert data in WeeklyShift table(Circular Foreign Key Between StaffShift)
SET FOREIGN_KEY_CHECKS=0;

-- insert weekly shifts in WeeklyShift table
INSERT INTO WeeklyShift(workDate, shiftType, managerID, headChefID, weekNumber)
VALUES	('2020-01-01', 'AM', 25, 21, WEEKOFYEAR('2020-01-01')),
		('2020-01-01', 'PM', 27, 22, WEEKOFYEAR('2020-01-01')),
		('2020-03-12', 'AM', 25, 23, WEEKOFYEAR('2020-03-12')),
        ('2020-03-12', 'PM', 27, 24, WEEKOFYEAR('2020-03-12')),
		('2020-05-06', 'AM', 25, 21, WEEKOFYEAR('2020-05-06')),
        ('2020-05-06', 'PM', 26, 22, WEEKOFYEAR('2020-05-06')),
        ('2019-12-24', 'AM', 27, 23, WEEKOFYEAR('2019-12-24')),
        ('2019-12-24', 'PM', 26, 21, WEEKOFYEAR('2019-12-24')),
        ('2020-04-20', 'AM', 25, 23, WEEKOFYEAR('2020-04-20')),
        ('2020-04-20', 'PM', 26, 22, WEEKOFYEAR('2020-04-20')),
        
        ('2018-03-12', 'PM', 25, 21, WEEKOFYEAR('2018-03-12')),
        ('2017-05-06', 'PM', 27, 22, WEEKOFYEAR('2017-05-06')),
        ('2017-12-24', 'PM', 25, 23, WEEKOFYEAR('2017-12-24')),
        ('2018-04-20', 'AM', 27, 24, WEEKOFYEAR('2018-04-20')),
        ('2019-01-01', 'PM', 25, 21, WEEKOFYEAR('2019-01-01')),
        ('2017-12-24', 'AM', 27, 24, WEEKOFYEAR('2017-12-24'))
;

-- insert staff shift in StaffShift table
INSERT INTO StaffShift(workDate, shiftType, employeeID)
VALUES	('2020-01-01', 'AM', 1),
		('2020-01-01', 'AM', 25),
        ('2020-01-01', 'AM', 21),
		('2020-01-01', 'PM', 2),
        ('2020-01-01', 'PM', 27),
        ('2020-01-01', 'PM', 22),
        
		('2020-03-12', 'AM', 3),
        ('2020-03-12', 'AM', 23),
        ('2020-03-12', 'AM', 25),
        ('2020-03-12', 'PM', 4),
        ('2020-03-12', 'PM', 27),
        ('2020-03-12', 'PM', 24),
        
		('2020-05-06', 'AM', 5),
        ('2020-05-06', 'AM', 25),
        ('2020-05-06', 'AM', 21),
        ('2020-05-06', 'PM', 6),
        ('2020-05-06', 'PM', 26),
        ('2020-05-06', 'PM', 22),
        
        ('2019-12-24', 'AM', 7),
        ('2019-12-24', 'AM', 27),
        ('2019-12-24', 'AM', 23),
        ('2019-12-24', 'PM', 8),
        ('2019-12-24', 'PM', 26),
        ('2019-12-24', 'PM', 21),
        
        ('2020-04-20', 'AM', 6),
        ('2020-04-20', 'AM', 25),
        ('2020-04-20', 'AM', 23),
        ('2020-04-20', 'PM', 10),
        ('2020-04-20', 'PM', 26),
        ('2020-04-20', 'PM', 22),
        
        ('2018-03-12', 'AM', 25),
        ('2018-03-12', 'AM', 21),
        ('2018-03-12', 'PM', 26),
        ('2018-03-12', 'PM', 24),
        
        ('2017-05-06', 'AM', 27),
        ('2017-05-06', 'AM', 23),
        ('2017-05-06', 'PM', 26),
        ('2017-05-06', 'PM', 22),
        
        ('2017-12-24', 'AM', 27),
        ('2017-12-24', 'AM', 23),
        ('2017-12-24', 'PM', 26),
        ('2017-12-24', 'PM', 22),
        
        ('2018-04-20', 'AM', 27),
        ('2018-04-20', 'AM', 23),
        ('2018-04-20', 'PM', 26),
        ('2018-04-20', 'PM', 22),
        
        ('2019-01-01', 'AM', 27),
        ('2019-01-01', 'AM', 23),
        ('2019-01-01', 'PM', 26),
        ('2019-01-01', 'PM', 22)
        
        ;

-- ALTER TABLE WeeklyShift
-- ADD    CONSTRAINT fk2_manager_WeeklyShift FOREIGN KEY (workDate, shiftType, managerID)
-- REFERENCES StaffShift (workDate, shiftType, employeeID),
-- ADD    CONSTRAINT fk3_headchef_WeeklyShift FOREIGN KEY (workDate, shiftType, headChefID)
-- REFERENCES StaffShift (workDate, shiftType, employeeID);

-- adding waiters' shifts in StaffShift table
INSERT INTO StaffShift(workDate, shiftType, employeeID)
VALUES	('2020-01-01', 'AM', 9),
		('2020-04-20', 'AM', 9),
		('2020-01-01', 'PM', 10),
		('2020-03-12', 'AM', 11),
        ('2020-03-12', 'PM', 12),
		('2020-05-06', 'AM', 11),
        ('2020-05-06', 'PM', 10),
        ('2019-12-24', 'AM', 9),
        ('2019-12-24', 'PM', 12),
        
		('2018-03-12', 'AM', 9),
        ('2018-03-12', 'PM', 10),
        ('2017-05-06', 'AM', 11),
        ('2017-05-06', 'PM', 12),
        ('2017-12-24', 'AM', 9),
        ('2017-12-24', 'PM', 10),
        ('2018-04-20', 'AM', 11),
        ('2018-04-20', 'PM', 12),
        ('2019-01-01', 'PM', 9)
        ;
        
-- adding LineCook's shifts in StaffShift table
INSERT INTO StaffShift(workDate, shiftType, employeeID)
VALUES	('2020-01-01', 'AM', 17),
		('2020-01-01', 'PM', 18),
		('2020-03-12', 'AM', 19),
        ('2020-03-12', 'PM', 20),
		('2020-05-06', 'AM', 17),
        ('2020-05-06', 'PM', 18),
        ('2019-12-24', 'AM', 19),
        ('2019-12-24', 'PM', 20),
        ('2020-04-20', 'AM', 17),
        ('2020-04-20', 'PM', 18),
        
        ('2018-03-12', 'AM', 17),
        ('2018-03-12', 'PM', 18),
        ('2017-05-06', 'AM', 19),
        ('2017-05-06', 'PM', 20),
        ('2017-12-24', 'AM', 17),
        ('2017-12-24', 'PM', 18),
        ('2018-04-20', 'AM', 19),
        ('2018-04-20', 'PM', 20),
        ('2019-01-01', 'AM', 17),
        ('2019-01-01', 'PM', 18)
        
        ;

-- turn foreign keys back on
SET FOREIGN_KEY_CHECKS=1;


-- insert table assignment in TableAssignment table
INSERT INTO TableAssignment(tableNumber, employeeID, workDate, shiftType)
VALUES	(1,9,'2020-01-01','AM'),
		(5,9,'2020-04-20','AM'),
        (3,10,'2020-01-01','PM'),
        (2,12,'2020-03-12','PM'),
        (3, 10, '2020-05-06', 'PM'),
		(5, 10, '2018-03-12', 'PM'),
        (2, 12, '2017-05-06', 'PM'),
        (2, 10, '2017-12-24', 'PM'),
        (2, 11, '2018-04-20', 'AM'),
        (2, 9, '2019-01-01', 'PM')
        
        ;

-- insert cook assignment in CookAssignment table
INSERT INTO CookAssignment(stationName, employeeID, workDate, shiftType)
VALUES	('Area 51', 17, '2020-01-01', 'AM'),
		('Machete!', 17, '2020-05-06', 'AM'),
		('Area 323', 18, '2020-01-01', 'PM'),
        ('Area 51', 18, '2020-05-06', 'PM'),
        ('Beach side', 19, '2020-03-12', 'AM'),
        ('Bonfire', 20, '2020-03-12', 'PM'),
        ('Area 323', 19, '2019-12-24', 'AM'),
        ('Beach side', 20, '2019-12-24', 'PM'),
        ('Bonfire', 17, '2020-04-20', 'AM'),
        ('Machete!', 18, '2020-04-20', 'PM'),
        
        ('Area 51',17, '2018-03-12', 'AM'),
        ('Machete!',17, '2018-03-12', 'AM'),
        ('Area 323',17, '2018-03-12', 'AM'),
        ('Area 51',17, '2017-12-24', 'AM'),
		('Area 51',17, '2019-01-01', 'AM'),
		('Beach side',17, '2020-05-06', 'AM'),
         
        ('Area 323',18, '2020-05-06', 'PM'),
        ('Machete!',18, '2018-03-12', 'PM'),
        ('Beach side',18, '2017-12-24', 'PM'),
        ('Beach side',18, '2019-01-01', 'PM'),
        
        ('Beach side',19, '2017-05-06', 'AM'),
        ('Area 323',19, '2018-04-20', 'AM'),

        ('Bonfire',20, '2017-05-06', 'PM'),
        ('Machete!',20, '2018-04-20', 'PM')
        
        ;




-- DROP TABLE CookAssignment;
-- DROP TABLE Station;
-- DROP TABLE TableAssignment;
-- DROP TABLE OrderLineItem;
-- DROP TABLE MenuItem;
-- DROP TABLE MeatEntrees;
-- DROP TABLE Soup;
-- DROP TABLE Appetizer;
-- DROP TABLE Mentorship;
-- DROP TABLE Expertise;
-- DROP TABLE Item;
-- SET FOREIGN_KEY_CHECKS=0;
-- SET FOREIGN_KEY_CHECKS=0;
-- DROP TABLE StaffShift;
-- DROP TABLE WeeklyShift;
-- DROP TABLE SousChef;
-- DROP TABLE LineCook;
-- DROP TABLE HeadChef;
-- DROP TABLE Chef;
-- DROP TABLE Manager;
-- DROP TABLE Waiters;
-- DROP TABLE Maitre_d;
-- DROP TABLE Dishwasher;
-- DROP TABLE FullTime;
-- DROP TABLE PartTime;
-- DROP TABLE Staff;
-- DROP TABLE EatIn;
-- DROP TABLE Seats;
-- DROP TABLE Tables;
-- DROP TABLE PickUp;
-- DROP TABLE Orders;
-- DROP TABLE Party;
-- DROP TABLE PrivateCustomer;
-- DROP TABLE CorporateCustomer;
-- DROP TABLE MimingAccount;
-- DROP TABLE AnonCustomer;
-- DROP TABLE Customer;