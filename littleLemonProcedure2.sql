USE littlelemon;

PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM orders 
WHERE OrderID = ?;';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;