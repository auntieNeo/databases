USE twk;
SELECT e.equipment_id, rc.scheduled_return_date, equipment_status
  FROM rental_contract AS rc JOIN rental_item AS ri
    ON rc.contract_num = ri.contract_num
  JOIN equipment AS e
    ON ri.equipment_id = e.equipment_id
  WHERE rc.actual_return_date IS NULL;
