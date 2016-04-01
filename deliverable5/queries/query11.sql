USE twk;
SELECT et.equipment_type_code,
       et.equipment_type_description,
       AVG(rc.actual_return_date - rc.pickup_date + 1) AS average_days_rented
  FROM equipment_type AS et LEFT JOIN equipment AS e
    ON et.equipment_type_code = e.equipment_type_code
  LEFT JOIN rental_item AS ri
    ON e.equipment_id = ri.equipment_id
  LEFT JOIN rental_contract AS rc
    ON ri.contract_num = rc.contract_num
  WHERE rc.pickup_date IS NOT NULL
    AND rc.actual_return_date IS NOT NULL
  GROUP BY et.equipment_type_code;
