USE twk;
SELECT COUNT(reservation_num) AS total_num_reservations
  FROM reservation AS r
  WHERE r.reservation_pickup_date BETWEEN '2016-05-14' AND '2016-05-15';
