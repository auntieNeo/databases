USE twk;
SELECT * FROM equipment_type
  WHERE equipment_type_code = 4;
UPDATE equipment_type
  SET inventory_count=2
  WHERE equipment_type_code = 4;
SELECT * FROM equipment_type
  WHERE equipment_type_code = 4;
