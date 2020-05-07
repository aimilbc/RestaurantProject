-- 1.
SELECT customerID, pri.name AS "Customer", pri.customerType AS "Type", pri.email AS "Contact"
FROM Customer INNER JOIN MimingAccount USING(customerID)
INNER JOIN PrivateCustomer pri USING(customerID)
UNION
SELECT customerID, cor.name AS "Customer", cor.customerType AS "Type", cor.contactEmailAddress AS "Contact"
FROM Customer INNER JOIN MimingAccount USING(customerID)
INNER JOIN CorporateCustomer cor USING(customerID)
UNION
SELECT anonID, 'N/A' AS name, AnonCustomer.customerType, 'N/A' AS contactEmailAddress
FROM Customer INNER JOIN AnonCustomer ON(Customer.customerID = AnonCustomer.anonID);

-- 2.
SELECT 
PrivateCustomer.name AS 'Customer Name', PrivateCustomer.customerType AS 'Customer Type',
SUM(MenuItem.price * OrderLineItem.quantity) AS 'Total'
FROM
PrivateCustomer
INNER JOIN MimingAccount USING (customerID)
INNER JOIN Party USING (customerID)
INNER JOIN Orders USING (customerID, paymentTime, orderDate)
INNER JOIN OrderLineItem USING (orderNum)
INNER JOIN MenuItem USING (menuItemID)
where Party.orderDate between date_sub(now(), interval + 2 year) and now()
GROUP BY PrivateCustomer.customerID
UNION
SELECT
CorporateCustomer.name AS 'Customer Name', CorporateCustomer.customerType AS 'Customer Type',
SUM(MenuItem.price * OrderLineItem.quantity) AS 'Total'
FROM
CorporateCustomer
INNER JOIN MimingAccount USING (customerID)
INNER JOIN Party USING (customerID)
INNER JOIN Orders USING (customerID, paymentTime, orderDate)
INNER JOIN OrderLineItem USING (orderNum)
INNER JOIN MenuItem USING (menuItemID)
where Party.orderDate between date_sub(now(), interval + 2 year) and now()
GROUP BY CorporateCustomer.customerID
ORDER BY Total DESC

-- 3.
SELECT firstName, lastName, COUNT(expertID) AS 'Number Items', GROUP_CONCAT(itemName ORDER BY itemName SEPARATOR ", ") AS "Item"
FROM Expertise
INNER JOIN Staff ON expertID = employeeID
GROUP BY firstName, lastName;

-- 4.
SELECT chef1.expertID, chef2.expertID, COUNT(itemName) AS 'Item Count', GROUP_CONCAT(itemName ORDER BY itemName SEPARATOR ", ") AS "Items"
FROM (SELECT itemName, expertID
FROM Expertise)chef1
INNER JOIN (SELECT itemName, expertID
FROM Expertise)chef2 USING (itemName)
GROUP BY chef1.expertID, chef2.expertID
HAVING chef1.expertID < chef2.expertID AND COUNT(itemName) > 2;

-- 5.
select m.itemName,m.menu, count(itemName) as ItemCount
from OrderLineItem o
inner join MenuItem m
on o.menuItemID = m.menuItemID
group by m.itemName, m.menu
having m.menu = 'Childrens'
order by count(itemName) desc
limit 3;

-- 6.
select s.employeeID, s.firstName, s.lastName, week(StaffShift.workDate) as WeekNumber , (count(s.employeeID) * 8) as HoursWorked
from StaffShift INNER JOIN Staff s USING (employeeID)
 group by employeeID, WeekNumber;

-- 7.
SELECT name AS "Customer", PrivateCustomer.customerType AS 'Customer Type', balance AS MimingMoney 
FROM PrivateCustomer 
INNER JOIN MimingAccount 
USING(customerID) 
UNION
SELECT name AS "Customer", CorporateCustomer.customerType AS 'Customer Type', balance AS MimingMoney
FROM CorporateCustomer
INNER JOIN MimingAccount
USING(customerID)
ORDER BY MimingMoney desc;

-- 8.
SELECT PrivateCustomer.name, PrivateCustomer.customerType AS 'Customer Type', TotalSpent
FROM PrivateCustomer
INNER JOIN (
select A.customerID, sum(A.Total) as TotalSpent
from(
select c.customerID, m.price * ord.quantity as Total
from Customer c
inner join MimingAccount mm using(customerID)
inner join Party p using(customerID)
inner join Orders o using(customerID, paymentTime, orderDate)
inner join OrderLineItem ord using(orderNum)
inner join MenuItem m using(menuItemID)
)A group by A.customerID
)VIP USING (customerID)
UNION
SELECT CorporateCustomer.name, CorporateCustomer.customerType AS 'Customer Type', TotalSpent
FROM CorporateCustomer
INNER JOIN (
select A.customerID, sum(A.Total) as TotalSpent
from(
select c.customerID, m.price * ord.quantity as Total
from Customer c
inner join MimingAccount mm using(customerID)
inner join Party p using(customerID)
inner join Orders o using(customerID, paymentTime, orderDate)
inner join OrderLineItem ord using(orderNum)
inner join MenuItem m using(menuItemID)
)A group by A.customerID
)VIP USING (customerID)
order by TotalSpent desc;

-- 9.
SELECT name AS "Customer Name", VIP.Month, VIP.Year, VIP.Visits
FROM PrivateCustomer 
INNER JOIN (
SELECT CustomerID, MONTH(orderDate) AS "Month", YEAR(orderDate) AS "Year", COUNT(paymentTime) AS "Visits"
FROM Party
GROUP BY CustomerID, MONTH(orderDate), YEAR(orderDate)
)VIP USING(CustomerID)
UNION 
SELECT name AS "Customer Name", VIP.Month, VIP.Year, VIP.Visits
FROM CorporateCustomer 
INNER JOIN (
SELECT CustomerID, MONTH(orderDate) AS "Month", YEAR(orderDate) AS "Year", COUNT(paymentTime) AS "Visits"
FROM Party
GROUP BY CustomerID, MONTH(orderDate), YEAR(orderDate)
)VIP USING(CustomerID)
ORDER BY Visits DESC;

-- 10.
SELECT name,TotalSpent
FROM PrivateCustomer
INNER JOIN (
select A.customerID, sum(A.Total) as TotalSpent
from(
select c.customerID, m.price * ord.quantity as Total
from Customer c
inner join MimingAccount mm using(customerID)
inner join Party p using(customerID)
inner join Orders o using(customerID, paymentTime, orderDate)
inner join OrderLineItem ord using(orderNum)
inner join MenuItem m using(menuItemID)
where p.orderDate between date_sub(now(), interval + 1 year) and now()
)A group by A.customerID
)VIP USING (customerID)
UNION
SELECT name,TotalSpent
FROM CorporateCustomer
INNER JOIN (
select A.customerID, sum(A.Total) as TotalSpent
from(
select c.customerID, m.price * ord.quantity as Total
from Customer c
inner join MimingAccount mm using(customerID)
inner join Party p using(customerID)
inner join Orders o using(customerID, paymentTime, orderDate)
inner join OrderLineItem ord using(orderNum)
inner join MenuItem m using(menuItemID)
where p.orderDate between date_sub(now(), interval + 1 year) and now()
)A group by A.customerID
)VIP USING (customerID)
order by TotalSpent desc
limit 3;

-- 11.
SELECT itemName AS "Item Name", SUM(quantity * price) AS "REVENUE"
FROM Orders 
INNER JOIN OrderLineItem USING(orderNum)
INNER JOIN MenuItem USING(menuItemID)
WHERE Now() >= (CURDATE() - INTERVAL 365 DAY)
GROUP BY itemName
order by SUM(quantity * price) desc
limit 5;

-- 12.
SELECT firstName, lastName, GROUP_CONCAT(itemName ORDER BY itemName SEPARATOR ", ") AS "Item Name"
FROM Mentorship INNER JOIN Staff ON expertID = employeeID
GROUP BY expertID
ORDER BY COUNT(expertID) DESC LIMIT 1;

-- 13.
SELECT COUNT(itemName) as 'Amount of chefs with expertise', itemName
FROM Expertise
INNER JOIN Staff
ON expertID = employeeID
GROUP BY itemName
LIMIT 3;

-- 14.
SELECT DISTINCT name AS "Customer Name"
FROM (SELECT name
FROM PrivateCustomer INNER JOIN Orders USING (CustomerID))private INNER JOIN (SELECT name
FROM CorporateCustomer INNER JOIN Orders USING (CustomerID))corp USING (name);

-- 15.
SELECT menu as 'Menu', itemName AS 'Item', COALESCE(price, 'N/A') AS Price
FROM MenuItem
ORDER BY menu;

-- 16.1
/* Query #16.1  Additional Business Rules (ABR)  */
/* ABR-4: sous chef can't be expert on more than 5 items  */
SELECT firstName AS 'First Name', lastName AS 'Last Name', COUNT(expertID) AS 'Items an Expert In'
FROM Expertise
INNER JOIN Staff ON expertID = employeeID
WHERE "Items an Expert In" < 6
GROUP BY firstName, lastName;

-- 16.2
-- ABR-3: sous chef can't be a mentor on more than 2 items  
SELECT firstName AS 'First Name', lastName AS 'Last Name', COUNT(expertID) AS 'Items as a Mentor'
FROM Mentorship
INNER JOIN Staff ON expertID = employeeID
WHERE "Items as a Mentor" < 3
GROUP BY firstName, lastName;

-- 16.3
-- ABR-5: corporate order gets a free appetizer
SELECT name AS 'Corporate Customer', orderNum AS 'Order Number', 'Free Appetizer' AS 'Special', GROUP_CONCAT(DISTINCT mi.itemName ORDER BY mi.itemName SEPARATOR ", ") AS "Items On Order"
FROM CorporateCustomer INNER JOIN Customer USING(customerID)
INNER JOIN Party USING(customerID)
INNER JOIN Orders USING(customerID)
INNER JOIN OrderLineItem USING(orderNum)
INNER JOIN MenuItem mi USING(menuItemID)
INNER JOIN Item USING(itemName)
GROUP BY name;
