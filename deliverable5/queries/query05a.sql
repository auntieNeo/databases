USE twk;
SELECT et.equipment_type_code, equipment_type_description, COUNT(contract_num) AS num_rentals
  FROM equipment_type AS et LEFT JOIN equipment AS e
    ON et.equipment_type_code = e.equipment_type_code
  LEFT JOIN rental_item AS ri
    ON e.equipment_id = ri.equipment_id
  GROUP BY equipment_type_code;
