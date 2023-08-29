USE littlelemon;

SELECT MenuName FROM menus
JOIN orders ON menus.MenuID = orders.MenuID
WHERE OrderID = ANY(SELECT OrderID FROM orders WHERE Quantity > 2);