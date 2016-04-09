USE twk;
delimiter //
CREATE PROCEDURE p_validate_credit_card (
    IN credit_card_num VARCHAR(16),
    OUT valid BOOLEAN)
proc:BEGIN
  DECLARE i INT;
  DECLARE digit_value INT;
  DECLARE digit_sum INT;

  -- Assume invalid
  SET valid = FALSE;

  -- Check for null value
  IF (credit_card_num IS NULL) THEN
    LEAVE proc;
  END IF;
  -- Check for valid length
  IF (LENGTH(credit_card_num) != 16) THEN
    LEAVE proc;
  END IF;
  -- Check for numeric digits
  IF (credit_card_num NOT REGEXP '^[0-9]+$') THEN
    LEAVE proc;
  END IF;
  -- Check sum of digits (Luhn algorithm)
  SET digit_sum = 0;
  SET i = 1;
  -- Loop through digit pairs
  digit_loop: WHILE (i <= LENGTH(credit_card_num)) DO
    SET digit_value = CONVERT(SUBSTRING(credit_card_num, i, 1), UNSIGNED);
    IF ((i % 2) = 1) THEN
      -- Double this digit
      SET digit_value = digit_value * 2;
      IF (digit_value > 9) THEN
        -- Add digits of doubled result
        SET digit_value =
          CONVERT(SUBSTRING(CONVERT(digit_value, CHAR(2)), 1, 1), UNSIGNED) +
          CONVERT(SUBSTRING(CONVERT(digit_value, CHAR(2)), 2, 1), UNSIGNED);
      END IF;
    END IF;
    SET digit_sum = digit_sum + digit_value;
    SET i = i + 1;
  END WHILE;
  IF ((digit_sum % 10) = 0) THEN
    SET valid = TRUE;
  END IF;
END//
delimiter ;
