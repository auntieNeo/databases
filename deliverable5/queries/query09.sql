USE twk;
SELECT SUM(amount_owed) AS total_amount_owed
  FROM rental_history;
