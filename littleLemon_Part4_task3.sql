USE littlelemon;

DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM bookings WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS `Message`;
ROLLBACK;
ELSE
DELETE FROM bookings WHERE BookingID = booking_id;
COMMIT;
-- SELECT CONCAT("Booking ", booking_id ," cancelled.") AS `Confirmation`; 
END IF;
END //

DELIMITER ;