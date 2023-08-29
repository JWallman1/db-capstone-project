USE little_lemon_db;

PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM orders 
WHERE OrderID = ?;';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;