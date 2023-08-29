USE littlelemon;

DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM bookings WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS `Message`;
ROLLBACK;
ELSE
UPDATE bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
COMMIT;
-- SELECT CONCAT("Booking ", booking_id ," updated.") AS `Confirmation`; 
END IF; 
END //

DELIMITER ;