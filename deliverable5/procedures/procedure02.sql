USE twk;
delimiter //
CREATE PROCEDURE p_update_reorder_necessary()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE l_equipment_type_code BIGINT UNSIGNED;
  DECLARE l_inventory_count INT UNSIGNED;
  DECLARE l_reorder_qty INT UNSIGNED;
  DECLARE l_reorder_necessary BOOLEAN;
  DECLARE computed BOOLEAN;
  DECLARE cur CURSOR FOR
    SELECT
      equipment_type_code,
      inventory_count,
      reorder_qty,
      reorder_necessary
    FROM equipment_type;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;

  update_loop: LOOP
    FETCH cur INTO
      l_equipment_type_code,
      l_inventory_count,
      l_reorder_qty,
      l_reorder_necessary;
    IF done THEN
      LEAVE update_loop;
    END IF;
    SET computed = l_inventory_count < l_reorder_qty;
    IF (computed != l_reorder_necessary) THEN
      UPDATE equipment_type AS et
        SET et.reorder_necessary=computed
        WHERE et.equipment_type_code = l_equipment_type_code;
    END IF;
  END LOOP;
END//
delimiter ;
