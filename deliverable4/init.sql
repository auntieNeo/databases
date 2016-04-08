DROP DATABASE IF EXISTS twk;
CREATE DATABASE twk;
USE twk;

CREATE TABLE customer (
    customer_num SERIAL PRIMARY KEY,
    c_name VARCHAR(255),
    c_street VARCHAR(255),
    c_city VARCHAR(255),
    c_state VARCHAR(255),
    c_zip VARCHAR(255),
    c_telephone VARCHAR(255),
    c_email VARCHAR(255)
);
CREATE TABLE rental_history (
    customer_num BIGINT UNSIGNED,
    rental_date DATE,
    problem_description TEXT,
    amount_owed DECIMAL(6,2),
    PRIMARY KEY ( customer_num, rental_date ),
    FOREIGN KEY ( customer_num ) REFERENCES customer ( customer_num )
);
CREATE TABLE reservation (
    reservation_num SERIAL PRIMARY KEY,
    reservation_date DATE,
    reservation_pickup_date DATE,
    reservation_return_date DATE,
    reservation_deposit_amount DECIMAL(6,2),
    customer_num BIGINT UNSIGNED,
    FOREIGN KEY ( customer_num ) REFERENCES customer ( customer_num )
);
CREATE TABLE rental_contract (
    contract_num SERIAL PRIMARY KEY,
    pickup_date DATE,
    scheduled_return_date DATE,
    actual_return_date DATE,
    retained_deposit DECIMAL(6,2),
    customer_num BIGINT UNSIGNED,
    FOREIGN KEY ( customer_num ) REFERENCES customer ( customer_num )
);
CREATE TABLE equipment_type (
    equipment_type_code SERIAL PRIMARY KEY,
    equipment_type_description TEXT,
    equipment_type_rental_charge DECIMAL(6,2),
    damage_deposit DECIMAL(6,2),
    inventory_count INT UNSIGNED,
    reorder_qty INT UNSIGNED
);
CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    equipment_status VARCHAR(255),
    equipment_rental_count BIGINT UNSIGNED,
    original_cost DECIMAL(6,2),
    equipment_type_code BIGINT UNSIGNED,
    FOREIGN KEY ( equipment_type_code ) REFERENCES equipment_type ( equipment_type_code )
);
CREATE TABLE rental_item (
    contract_num BIGINT UNSIGNED,
    equipment_id BIGINT UNSIGNED,
    rental_item_charge DECIMAL(6,2),
    rental_item_deposit_amount DECIMAL(6,2),
    PRIMARY KEY ( contract_num, equipment_id ),
    FOREIGN KEY ( contract_num ) REFERENCES rental_contract ( contract_num ),
    FOREIGN KEY ( equipment_id ) REFERENCES equipment ( equipment_id )
);
CREATE TABLE reservation_item (
    reservation_num BIGINT UNSIGNED,
    equipment_type_code BIGINT UNSIGNED,
    quantity INT UNSIGNED,
    PRIMARY KEY ( reservation_num, equipment_type_code ),
    FOREIGN KEY ( reservation_num ) REFERENCES reservation ( reservation_num ),
    FOREIGN KEY ( equipment_type_code ) REFERENCES equipment_type ( equipment_type_code )
);
CREATE TABLE accessory (
    accessory_code SERIAL PRIMARY KEY,
    accessory_description TEXT,
    replacement_cost DECIMAL(6,2),
    accessory_inventory_count INT UNSIGNED,
    accessory_reorder_qty INT UNSIGNED
);
CREATE TABLE equipped_with (
    equipment_type_code BIGINT UNSIGNED,
    accessory_code BIGINT UNSIGNED,
    quantity INT UNSIGNED,
    PRIMARY KEY ( equipment_type_code, accessory_code ),
    FOREIGN KEY ( equipment_type_code ) REFERENCES equipment_type ( equipment_type_code ),
    FOREIGN KEY ( accessory_code ) REFERENCES accessory ( accessory_code )
);
CREATE TABLE supplier (
    supplier_num SERIAL PRIMARY KEY,
    s_name VARCHAR(255),
    s_addr VARCHAR(255),
    s_city VARCHAR(255),
    s_state VARCHAR(255),
    s_zip VARCHAR(255),
    s_phone VARCHAR(255),
    s_fax VARCHAR(255),
    s_contact VARCHAR(255),
    s_email VARCHAR(255)
);
CREATE TABLE `order` (
    order_num SERIAL PRIMARY KEY,
    order_date DATE,
    order_date_received DATE,
    supplier_num BIGINT UNSIGNED,
    FOREIGN KEY ( supplier_num ) REFERENCES supplier ( supplier_num )
);
CREATE TABLE `line_item:equipment` (
    ord_num BIGINT UNSIGNED,
    equipment_type_code BIGINT UNSIGNED,
    e_order_item_qty INT UNSIGNED,
    e_order_item_price DECIMAL(6,2),
    PRIMARY KEY ( ord_num, equipment_type_code ),
    FOREIGN KEY ( ord_num ) REFERENCES `order` ( order_num ),
    FOREIGN KEY ( equipment_type_code ) REFERENCES equipment_type ( equipment_type_code )
);
CREATE TABLE `line_item:accessory` (
    ord_num BIGINT UNSIGNED,
    accessory_code BIGINT UNSIGNED,
    a_order_item_qty INT UNSIGNED,
    a_order_item_Price DECIMAL(6,2),
    PRIMARY KEY ( ord_num, accessory_code ),
    FOREIGN KEY ( ord_num ) REFERENCES `order` ( order_num ),
    FOREIGN KEY ( accessory_code ) REFERENCES accessory ( accessory_code )
);
