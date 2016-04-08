USE twk;
SELECT c_name, equipment_type_description, equipment_id, scheduled_return_date
  FROM customer INNER JOIN rental_contract USING (customer_num)
    INNER JOIN rental_item USING (contract_num)
    INNER JOIN equipment USING (equipment_id)
    INNER JOIN equipment_type USING (equipment_type_code)
  WHERE pickup_date LIKE '2015-10-09';
