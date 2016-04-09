USE twk;
CALL p_customer_risk(1, @risk1);
CALL p_customer_risk(2, @risk2);
CALL p_customer_risk(3, @risk3);
CALL p_customer_risk(4, @risk4);
CALL p_customer_risk(5, @risk5);
SELECT @risk1, @risk2, @risk3, @risk4, @risk5;
