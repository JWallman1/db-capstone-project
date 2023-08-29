USE little_lemon_db;

CREATE VIEW `OrdersView` AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;