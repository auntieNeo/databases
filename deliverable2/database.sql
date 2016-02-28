DROP DATABASE twk;
CREATE DATABASE twk;
USE twk;
CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  -- TODO: Add entries for name prefix, suffix, etc.
  fname VARCHAR(255),
  lname VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(32),
  address TEXT  -- TODO: Expand this attribute (very complicated)
);
CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  equipment_type_id BIGINT UNSIGNED REFERENCES equipment_type ( id ),
  equipment_condition_id BIGINT UNSIGNED REFERENCES equipment_condition ( id ),
  for_sale BOOLEAN
);
CREATE TABLE equipment_condition (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);
CREATE TABLE equipment_order (
  id SERIAL PRIMARY KEY,
  vendor_id BIGINT UNSIGNED REFERENCES vendor ( id )
  -- TODO: Add a line item for each piece of equipment in this order
);
CREATE TABLE equipment_type (
  id SERIAL PRIMARY KEY,
  retail_price DECIMAL(6,2)
);
CREATE TABLE sale (
  id SERIAL PRIMARY KEY,
  amount DECIMAL(6,2),
  customer_id BIGINT UNSIGNED REFERENCES customer ( id )
);
CREATE TABLE reservation (
  id SERIAL PRIMARY KEY,
  rental_class_id BIGINT UNSIGNED REFERENCES rental_class ( id ),
  customer_id BIGINT UNSIGNED REFERENCES customer ( id )
);
CREATE TABLE rental_class (
  id SERIAL PRIMARY KEY,
  reserve_deposit DECIMAL(6,2),
  damage_deposit DECIMAL(6,2),
  rental_fee DECIMAL(6,2)
);
CREATE TABLE rental_class_equipment (
  rental_class_id BIGINT UNSIGNED REFERENCES rental_class ( id ),
  equipment_type_id BIGINT UNSIGNED REFERENCES equipment_type ( id ),
  quantity INT UNSIGNED
);
CREATE TABLE vendor (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  phone VARCHAR(32)
);
