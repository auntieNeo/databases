USE twk;
SELECT supplier_num, s_name
  FROM supplier
  WHERE NOT supplier_num IN (
    SELECT supplier_num
    FROM `order`
    WHERE order_date_received IS NULL)
  ORDER BY s_name ASC;
