USE twk;
CALL p_validate_credit_card('5268080043376894', @valid);
SELECT @valid;
