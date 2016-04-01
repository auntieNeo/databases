USE twk;
-- FIXME: This does not generate rows for equipment types with no equipment in stock
SELECT et.equipment_type_code,
       et.equipment_type_description,
       COUNT(e.equipment_id) AS num_in_stock
  FROM equipment_type AS et LEFT JOIN equipment AS e
    ON et.equipment_type_code = e.equipment_type_code
  LEFT JOIN rental_item AS ri 
    ON e.equipment_id = ri.equipment_id
  LEFT JOIN rental_contract AS rc
    ON ri.contract_num = rc.contract_num
  WHERE 0 = (SELECT COUNT(*)
           FROM rental_contract AS rc2 JOIN rental_item AS ri2
           ON rc2.contract_num = ri2.contract_num
           WHERE ri2.equipment_id = e.equipment_id
             AND rc2.actual_return_date IS NULL)
  GROUP BY et.equipment_type_code;
