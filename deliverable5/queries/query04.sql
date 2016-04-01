USE twk;
SELECT c.customer_num, c_name, rental_date, problem_description, amount_owed
	FROM rental_history AS rh JOIN customer AS c
    ON rh.customer_num = c.customer_num
    WHERE c.customer_num = 3;  -- Or whichever customer is needed
