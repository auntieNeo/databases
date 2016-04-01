USE twk;
SELECT et.equipment_type_code, equipment_type_description, COUNT(contract_num) AS num_rentals
  FROM equipment_type AS et LEFT JOIN equipment AS e
    ON et.equipment_type_code = e.equipment_type_code
  LEFT JOIN rental_item AS ri
    ON e.equipment_id = ri.equipment_id
  GROUP BY equipment_type_code
  HAVING num_rentals =
    (SELECT MAX(num_rentals2) FROM
      (SELECT COUNT(contract_num) AS num_rentals2
        FROM equipment_type AS et2 LEFT JOIN equipment AS e2
          ON et2.equipment_type_code = e2.equipment_type_code
        LEFT JOIN rental_item AS ri2
          ON e2.equipment_id = ri2.equipment_id
        GROUP BY et2.equipment_type_code
      ) AS foo
    );
