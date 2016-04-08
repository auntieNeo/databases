USE twk;
SELECT equipment_type_code, equipment_type_description
  FROM equipment_type
	WHERE equipment_type_description LIKE '%kayak';
