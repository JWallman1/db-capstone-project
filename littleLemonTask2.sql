USE littlelemon;

SELECT customers.CustomerID, customers.FullName, orders.OrderID, orders.TotalCost as Cost, menus.MenuName, menuitems.Courses as CourseName
FROM customers JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN menus ON orders.MenuID = menus.MenuID
JOIN menuitems ON menus.MenuID = menuitems.MenuID
WHERE orders.TotalCost > 150
ORDER BY orders.TotalCost ASC;