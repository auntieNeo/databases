USE twk;
delimiter //
CREATE PROCEDURE p_customer_risk (
    IN customer_num BIGINT UNSIGNED,
    OUT risk VARCHAR(255))
BEGIN
  DECLARE num_incidents INT;

  SELECT COUNT(*)
    INTO num_incidents
    FROM rental_history AS rh
    WHERE rh.customer_num = customer_num
    AND YEAR(rh.rental_date) = 2015;
  IF (num_incidents < 3) THEN
    SET risk = 'Low-risk';
  ELSEIF (num_incidents > 5) THEN
    SET risk = 'High-risk';
  ELSE
    SET risk = 'Medium-risk';
  END IF;
END//
delimiter ;
