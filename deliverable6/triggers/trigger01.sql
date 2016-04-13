USE twk;
DELIMITER //
CREATE TRIGGER t_update_reorder_necessary BEFORE UPDATE ON equipment_type
  FOR EACH ROW
    BEGIN
      SET NEW.reorder_necessary = NEW.inventory_count < NEW.reorder_qty;
    END //
DELIMITER ;
