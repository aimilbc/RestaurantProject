-- table structure for table: Customer
CREATE TABLE Customer (
    customerID  INT     NOT NULL,       -- identifier for the Customer
    CONSTRAINT customer_pk PRIMARY KEY (customerID)            -- primary key
);

-- table structure for table: AnonCustomer
CREATE TABLE AnonCustomer (
    anonID      	INT     		NOT NULL,   -- identifier for the anonymous customer
    customerType	VARCHAR(20)     NOT NULL,   -- type of customer
    PRIMARY KEY (anonID),               -- primary key
	CONSTRAINT fk_AnonCustomer FOREIGN KEY (anonID) REFERENCES Customer (customerID)
);

-- table structure for table: MimingAccount
CREATE TABLE MimingAccount (
    customerID      INT     NOT NULL,   -- identifier for the Customer
    balance         INT     NOT NULL,   -- total balance for earned Miming's money
    PRIMARY KEY (customerID),           -- primary key
    CONSTRAINT fk_MimingCustomer FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

-- table structure for table: Private Customer
CREATE TABLE PrivateCustomer (
    customerID   INT             NOT NULL,   -- identifier for the private customer
    name    VARCHAR(20)     NOT NULL,   -- name of the private customer
    email           VARCHAR(20)     NOT NULL,   -- private customer's email address
    snailMail       VARCHAR(20)     NOT NULL,   -- snail mail address of the private customer
    customerType	VARCHAR(20)     NOT NULL,   -- type of customer
    PRIMARY KEY (customerID),                -- primary key
	CONSTRAINT fk_PrivateCustomer FOREIGN KEY (customerID) REFERENCES MimingAccount(customerID)
);

-- table structure for table: CorporateCustomer
CREATE TABLE CorporateCustomer (
    customerID    		INT         NOT NULL,   -- identifier for the corporate customer
    name    			VARCHAR(20) NOT NULL,   -- name of the corporate customer
    corporationName     VARCHAR(20) NOT NULL,   -- name of the corporation
    organizationName    VARCHAR(20) NOT NULL,   -- name of the organization
    contactEmailAddress VARCHAR(20) NOT NULL,   -- email address to contact for special deals
    officeAddress       VARCHAR(20) NOT NULL,   -- address of the customer's office building
    customerType	VARCHAR(20)     NOT NULL,   -- type of customer
    PRIMARY KEY (customerID), 		            -- primary key
	CONSTRAINT fk_CorporateCustomer FOREIGN KEY (customerID) REFERENCES MimingAccount(customerID)
);

-- table structure for table: Party
CREATE TABLE Party (
    customerID    		INT         NOT NULL,   -- identifier for the customer paying
    paymentTime        	TIME        NOT NULL,   -- time of the payment
    orderDate     		DATE         NOT NULL,   -- date the order was placed
    paymentType    		ENUM('cash', 'credit', 'debit', 'moneyOrder', 'mimingsMoney') NOT NULL,   -- form of payment used
    PRIMARY KEY (customerID, paymentTime, orderDate), 		            -- primary key
	CONSTRAINT fk_Party FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

-- table structure for table: Orders
CREATE TABLE Orders (
    customerID      INT         NOT NULL,       -- identifier for the customer that placed the order
    paymentTime     TIME        NOT NULL,       -- time the order was paid for
    orderDate       DATE        NOT NULL,       -- date the order was ordered
    orderNum        INT         NOT NULL AUTO_INCREMENT,       -- identifier for the order placed
    PRIMARY KEY (orderNum),                     -- primary key
	CONSTRAINT fk_Orders FOREIGN KEY (customerID, paymentTime, orderDate) REFERENCES Party(customerID, paymentTime, orderDate)
);

-- table structure for table: PickUp
CREATE TABLE PickUp (
    orderNum        INT     NOT NULL,               -- identifier for the order placed
    orderType       ENUM('web', 'phone')  NOT NULL, -- form in which the order was placed
    readyTime       TIME    NOT NULL,               -- time the order is estimated to be ready
    PRIMARY KEY (orderNum),                         -- primary key
	CONSTRAINT fk_PickUp FOREIGN KEY (orderNum) REFERENCES Orders (orderNum)
);

-- table structure for table: Tables
CREATE TABLE Tables (
    tableNumber     INT     NOT NULL,               -- identifier for a table
    capacity        INT     NOT NULL,               -- number of people allowed at a table
    PRIMARY KEY (tableNumber)             			-- primary key
);

-- table structure for table: Seats
CREATE TABLE Seats (
    seatNum         VARCHAR(1)  NOT NULL,           -- identifier for the seat (e.g., a, b, c, etc.)
    tableNumber     INT         NOT NULL,           -- identifier for the table
    PRIMARY KEY (seatNum, tableNumber),     		-- primary key
	CONSTRAINT fk_Seats FOREIGN KEY (tableNumber) REFERENCES Tables (tableNumber)
);

-- table structure for table: EatIn
CREATE TABLE EatIn (
    orderNum        INT     NOT NULL,               -- identifier for the order placed
    seatNo			VARCHAR(1)	NOT NULL,			-- seat number at table
    tableNumber     INT     NOT NULL,               -- identifier for the table
    PRIMARY KEY (orderNum),                          -- primary key
	CONSTRAINT fk1_EatIn FOREIGN KEY (orderNum) REFERENCES Orders (orderNum),
    CONSTRAINT fk2_EatIn FOREIGN KEY (seatNo, tableNumber) REFERENCES Seats (seatNum, tableNumber)
);

-- table structure for table: Staff
CREATE TABLE Staff(
    firstName       varchar(10) NOT NULL,               		-- first name of the employee
    lastName        varchar(10) NOT NULL,               		-- last name of the employee
    employeeID      int         NOT NULL AUTO_INCREMENT,               		-- identifier for an employee
    CONSTRAINT staff_pk PRIMARY KEY (employeeID),               -- primary key
    CONSTRAINT staff_ck UNIQUE (firstName, lastName)			-- candidate key
);

-- table structure for table: FullTime
CREATE TABLE FullTime(
    employeeID  int     NOT NULL,                       		-- identifier for an employee
    salary      int     NOT NULL,                       		-- fixed yearly amount for an employee
    CONSTRAINT fullTime_pk PRIMARY KEY (employeeID),            -- primary key
    CONSTRAINT staffFullTime_fk FOREIGN KEY (employeeID) REFERENCES Staff (employeeID)		-- foreign key
);

-- table structure for table: PartTime
CREATE TABLE PartTime(
    employeeID 		int 			NOT NULL,           		-- identifier for an employee
    hourlyRate 		decimal(10,2) 	NOT NULL,           		-- fixed hourly rate for an employee
    CONSTRAINT partTime_pk PRIMARY KEY (employeeID),                           		-- primary key
    CONSTRAINT staffPartTime_fk FOREIGN KEY (employeeID) REFERENCES Staff (employeeID)		-- foreign key
);

-- table structure for table: Waiters
CREATE TABLE Waiters(
    employeeID  int 			NOT NULL,               		-- identifier for an employee
    tips        decimal(10,2) 	DEFAULT NULL,           		-- additional pay for the waiters
    CONSTRAINT waiters_pk PRIMARY KEY (employeeID),                           		-- primary key
	CONSTRAINT partTimeWaiter_fk FOREIGN KEY (employeeID) REFERENCES PartTime (employeeID)	-- foreign key
);

-- table structure for table: Maitre_d
CREATE TABLE Maitre_d(
    employeeID int NOT NULL,                            		-- identifier for an employee
    CONSTRAINT maitre_pk PRIMARY KEY (employeeID),                           		-- primary key
    CONSTRAINT partTimeMaitre_fk FOREIGN KEY (employeeID) REFERENCES PartTime (employeeID)	-- foreign key
);

-- table structure for table: Dishwasher
CREATE TABLE Dishwasher(
    employeeID int NOT NULL,                            		-- identifier for an employee
    CONSTRAINT dishwasher_pk PRIMARY KEY (employeeID),                           		-- primary key
    CONSTRAINT partTimeDishwasher_fk FOREIGN KEY (employeeID) REFERENCES PartTime (employeeID)	-- foreign key
);

-- table structure for table: Manager
CREATE TABLE Manager(
    employeeID int NOT NULL,                            		-- identifier for an employee
    CONSTRAINT manager_pk PRIMARY KEY (employeeID),                           		-- primary key
    CONSTRAINT manager_fk FOREIGN KEY (employeeID) REFERENCES FullTime (employeeID)	-- foreign key
);

-- table structure for table: Chef
CREATE TABLE Chef(
    employeeID int NOT NULL,                            		-- identifier for an employee
    CONSTRAINT chef_pk PRIMARY KEY (employeeID),                           		-- primary key
    CONSTRAINT chef_fk FOREIGN KEY (employeeID) REFERENCES FullTime (employeeID)	-- foreign key
);

-- table structure for table: HeadChef
CREATE TABLE HeadChef(
    employeeID int NOT NULL,                            	-- identifier for an employee
    firstName       varchar(10) NOT NULL,               	-- first name of the head chef
    lastName        varchar(10) NOT NULL,               	-- last name of the head chef
    CONSTRAINT headChef_pk PRIMARY KEY (employeeID),                           	-- primary key
    CONSTRAINT headChef_fk FOREIGN KEY (employeeID) REFERENCES Chef (employeeID)	-- foreign key
);

-- table structure for table: SousChef
CREATE TABLE SousChef(
    employeeID int NOT NULL,                            	-- identifier for an employee
    CONSTRAINT sousChef_pk PRIMARY KEY (employeeID),                           	-- primary key
    CONSTRAINT sousChef_fk FOREIGN KEY (employeeID) REFERENCES Chef (employeeID)	-- foreign key
);

-- table structure for table: LineCook
CREATE TABLE LineCook(
    employeeID int NOT NULL,                            	-- identifier for an employee
    CONSTRAINT lineCook_pk PRIMARY KEY (employeeID),                           	-- primary key
    CONSTRAINT lineCook_fk FOREIGN KEY (employeeID) REFERENCES Chef (employeeID)	-- foreign key
);

-- table structure for table: WeeklyShift
CREATE TABLE WeeklyShift(
    workDate    DATE        NOT NULL,                   -- date of the shift
    shiftType   ENUM('AM', 'PM') NOT NULL,              -- the time of day a given employee can work
    managerID   int         NOT NULL,                   -- identifier for a manager for a given shift
    headChefID  int         NOT NULL,                   -- identifier for a head chef for a given shift
    weekNumber  int         NOT NULL,                   -- the number of the week that a given shift occurs in.
    PRIMARY KEY (workDate, shiftType),                  -- primary key
    -- CONSTRAINT fk1_manager_WeeklyShift FOREIGN KEY (workDate, shiftType, managerID) REFERENCES StaffShift (workDate, shiftType, employeeID),
	-- CONSTRAINT fk2_headchef_WeeklyShift FOREIGN KEY (workDate, shiftType, headChefID) REFERENCES StaffShift (workDate, shiftType, employeeID),
    CONSTRAINT fk3_managerID_WeeklyShift FOREIGN KEY (managerID) REFERENCES Manager (employeeID),
    CONSTRAINT fk4_headchefID_WeeklyShift FOREIGN KEY (headChefID) REFERENCES HeadChef (employeeID)
);

-- table structure for table: StaffShift 
CREATE TABLE StaffShift(
    workDate            DATE        NOT NULL,           -- date of the shift
    shiftType           ENUM('AM', 'PM') NOT NULL,      -- the time of day a given employee can work
    employeeID          INT         NOT NULL,           -- identifier for an employee
    PRIMARY KEY (workDate, shiftType, employeeID),      -- primary key
    CONSTRAINT fk1_StaffShift FOREIGN KEY (workDate, shiftType) REFERENCES WeeklyShift (workDate, shiftType),
    CONSTRAINT fk2_StaffShift FOREIGN KEY (employeeID) REFERENCES Staff (employeeID)
);

ALTER TABLE WeeklyShift
ADD    CONSTRAINT fk1_manager_WeeklyShift FOREIGN KEY (workDate, shiftType, managerID)
REFERENCES StaffShift (workDate, shiftType, employeeID),
ADD    CONSTRAINT fk2_headchef_WeeklyShift FOREIGN KEY (workDate, shiftType, headChefID)
REFERENCES StaffShift (workDate, shiftType, employeeID);

-- table structure for table: Item
CREATE TABLE Item(
    itemName  		varchar(30)     NOT NULL,					-- name of an item
    employeeID  	int         	NOT NULL,           		-- identifier for an employee
    CONSTRAINT item_pk PRIMARY KEY (itemName),                           			-- primary key
    CONSTRAINT item_fk FOREIGN KEY (employeeID) REFERENCES HeadChef (employeeID)	-- foreign key
);

-- table structure for table: Expertise
CREATE TABLE Expertise(
    expertID  		int 			NOT NULL,					-- identifier for an employee
    itemName  		varchar(30)     NOT NULL,					-- name of an item
    CONSTRAINT expertise_pk PRIMARY KEY (expertID, itemName),							-- primary key
    CONSTRAINT expertise_fk1 FOREIGN KEY (expertID) REFERENCES SousChef (employeeID),	-- foreign key
    CONSTRAINT expertise_fk2 FOREIGN KEY (itemName) REFERENCES Item (itemName)			-- foreign key
);

-- table structure for table: Mentorship
CREATE TABLE Mentorship(
    expertID        int     		NOT NULL,           						-- identifier for an expertise
    itemName  		varchar(30)     NOT NULL,									-- name of an item
    sousID          int     		NOT NULL,           						-- identifier for a sous chef
    startDate       DATE    		NOT NULL,           						-- starting date of mentorship
    endDate         DATE    		NOT NULL,           						-- ending date of mentorship
    CONSTRAINT mentorship_pk PRIMARY KEY (expertID, itemName, sousID),           						-- primary key
    CONSTRAINT mentorship_fk1 FOREIGN KEY (sousID) REFERENCES SousChef (employeeID),						-- foreign key
    CONSTRAINT mentorship_fk2 FOREIGN KEY (expertID, itemName) REFERENCES Expertise (expertID, itemName)	-- foreign key
);

-- table structure for table: Appetizer
CREATE TABLE Appetizer(
    itemName  		varchar(30)     NOT NULL,			-- name of an item
    CONSTRAINT appetizer_pf PRIMARY KEY (itemName),                           	-- primary key
    CONSTRAINT appetizer_fk FOREIGN KEY (itemName) REFERENCES Item (itemName) 	-- foreign key
);

-- table structure for table: Soup
CREATE TABLE Soup(
    itemName  		varchar(30)     NOT NULL,			-- name of an item
    CONSTRAINT soup_pk PRIMARY KEY (itemName),                          	-- primary key
    CONSTRAINT soup_pk FOREIGN KEY (itemName) REFERENCES Item (itemName)	-- foreign key
);

-- table structure for table: MeatEntrees
CREATE TABLE MeatEntrees(
    itemName  		varchar(30)     NOT NULL,										-- name of an item
    meatType ENUM('Chef Special','Pork','Chicken','Beef','Seafood','Vegetable'),	-- enum for meat type
    CONSTRAINT meatEntrees_pk PRIMARY KEY (itemName,meatType),                           								-- primary key
    CONSTRAINT meatEntrees_fk FOREIGN KEY (itemName) REFERENCES Item (itemName)								-- foreign key
);

-- table structure for table: MenuItem
CREATE TABLE MenuItem(
    menuItemID      int         	NOT NULL,                                                               -- identifier for an item
    price    		decimal(10,2) 	NOT NULL,                                                           	-- price for an item
    itemName  		varchar(30)     DEFAULT NULL,                                                           -- name of an item
    spicyLevel ENUM('Mild','Tangy','Piquant','Hot','Oh My God'),                      						-- enum for spicy level
    Menu ENUM('Evening','Lunch','All You Can Eat Sensational Suicide Sunday Brunch','Childrens'),  		 	-- enum for menu type
    CONSTRAINT menuItem_pk PRIMARY KEY (menuItemID),                                                        -- primary key
    CONSTRAINT menuItem_fk1 UNIQUE (itemName, Menu, spicyLevel),											-- candidate key
    CONSTRAINT menuItem_fk2 FOREIGN KEY (itemName) REFERENCES Item (itemName)								-- foreign key
);

-- table structure for table: OrderLineItem
CREATE TABLE OrderLineItem (
    orderNum        INT         NOT NULL,           -- identifier for the order placed
    menuItemID      INT         NOT NULL,           -- identifier for the menu item
    quantity        INT			NOT NULL,           -- quantity of the item ordered
    PRIMARY KEY (orderNum, menuItemID),             -- primary key
	CONSTRAINT fk1_OrderLineItem FOREIGN KEY (orderNum) REFERENCES Orders (orderNum),
    CONSTRAINT fk2_OrderLineItem FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID)
);

-- table structure for table: TableAssignment
CREATE TABLE TableAssignment (
    tableNumber     INT         NOT NULL,           -- identifier for the table
    employeeID      INT         NOT NULL,           -- identifier for the assigned employee 
    workDate        DATE        NOT NULL,           -- date the employee was assigned to a table
    shiftType       ENUM('AM', 'PM')   NOT NULL,    -- time of day for this assignment
    PRIMARY KEY (tableNumber, employeeID, workDate, shiftType),  -- primary key
    CONSTRAINT fk1_TableAssignment FOREIGN KEY (tableNumber) REFERENCES Tables (tableNumber),
    CONSTRAINT fk2_TableAssignment FOREIGN KEY (employeeID) REFERENCES Waiters (employeeID),
    CONSTRAINT fk3_TableAssignment FOREIGN KEY (employeeID, workDate, shiftType) REFERENCES StaffShift (employeeID, workDate, shiftType)
);

-- table structure for table: Station
CREATE TABLE Station(
    stationName varchar(30) NOT NULL,	-- name of a station
    PRIMARY KEY (stationName)			-- primary key
);

-- table structure for table: CookAssignment
CREATE TABLE CookAssignment(
    stationName  		varchar(30)     NOT NULL,															-- name of a station
	employeeID 			int 			NOT NULL,															-- identifier for an employee
    workDate    		DATE        	NOT NULL,   														-- date of the shift
    shiftType           ENUM('AM', 'PM') NOT NULL,      													-- the time of day a given employee can work   
    CONSTRAINT cookAssignment_pk PRIMARY KEY (stationName, employeeID, workDate, shiftType),												-- primary key
    CONSTRAINT cookAssignment_fk1 FOREIGN KEY (stationName) REFERENCES Station (stationName), 											-- foreign key
    CONSTRAINT cookAssignment_fk2 FOREIGN KEY (employeeID) REFERENCES LineCook (employeeID),												-- foreign key
    CONSTRAINT cookAssignment_fk3 FOREIGN KEY (employeeID, workDate, shiftType) REFERENCES StaffShift (employeeID, workDate, shiftType)	-- foreign key
);
