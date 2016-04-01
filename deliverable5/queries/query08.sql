USE twk;
SELECT e.equipment_id,
       et.equipment_type_code,
       et.equipment_type_description,
       e.equipment_status
  FROM equipment AS e JOIN rental_item AS ri
    ON e.equipment_id = ri.equipment_id
  JOIN rental_contract AS rc
    ON ri.contract_num = rc.contract_num
  JOIN equipment_type AS et
    ON e.equipment_type_code = et.equipment_type_code
  WHERE CURRENT_DATE() > rc.scheduled_return_date
    AND rc.actual_return_date IS NULL;
