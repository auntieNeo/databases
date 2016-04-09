USE twk;
SELECT equipment_type_description,
       inventory_count,
       reorder_qty,
       reorder_necessary
FROM equipment_type;
CALL p_update_reorder_necessary();
SELECT equipment_type_description,
       inventory_count,
       reorder_qty,
       reorder_necessary
FROM equipment_type;
