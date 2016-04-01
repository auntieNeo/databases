USE twk;
SELECT et.equipment_type_code,
       et.equipment_type_description,
       COUNT(s.supplier_num) AS num_of_suppliers
  FROM equipment_type AS et LEFT JOIN `line_item:equipment` AS lie
    ON et.equipment_type_code = lie.equipment_type_code
  LEFT JOIN `order` AS o
  	ON lie.ord_num = o.order_num
  LEFT JOIN supplier AS s
    ON o.supplier_num = s.supplier_num
  GROUP BY s.supplier_num;
