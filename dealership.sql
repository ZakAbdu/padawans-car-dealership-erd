CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE salesperson(
    salesperson_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(100)
);

CREATE TABLE car(
    serial_number INT PRIMARY KEY,
    salesperson_id INTEGER,
    customer_id INTEGER,
    make VARCHAR(100),
    model VARCHAR(100),
    year INT,
    color VARCHAR(50),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice(
    invoice_id INT PRIMARY KEY,
    car_serial_number INTEGER,
    salesperson_id INTEGER,
    customer_id INTEGER,
    date_issued DATE,
    FOREIGN KEY (car_serial_number) REFERENCES car(serial_number),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE service_ticket(
    service_ticket_id INT PRIMARY KEY,
    car_serial_number INTEGER,
    customer_id INTEGER,
    date_serviced DATE,
    FOREIGN KEY (car_serial_number) REFERENCES car(serial_number),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_history(
    service_history_id INT PRIMARY KEY,
    service_ticket_id INTEGER,
    car_serial_number INTEGER,
    service_details VARCHAR(100),
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id),
    FOREIGN KEY (car_serial_number) REFERENCES car(serial_number)
);

CREATE TABLE mechanic(
    mechanic_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE repairs(
    car_serial_number INTEGER,
    mechanic_id INTEGER,
    PRIMARY KEY (car_serial_number, mechanic_id),
    FOREIGN KEY (car_serial_number) REFERENCES car(serial_number),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);



INSERT INTO customer(customer_id, first_name, last_name, phone_number, email, address)
VALUES
    (1, 'Ziggy', 'Zak', '111-111-1111', 'ziggy@zak.com', '123 Pimp St.'),
    (2, 'John', 'Doe', '000-000-0000', 'john.doe@email.com', '321 Boom Pl.');

INSERT INTO salesperson(salesperson_id, first_name, last_name, phone_number, address)
VALUES
    (1, 'Will', 'Smith', '999-999-9999', '12 Pursuit of Happiness St.'),
    (2, 'Monica', 'Lewinsky', '699-699-6969', '69 Fellatio Ave.');

INSERT INTO car(serial_number, salesperson_id, customer_id, make, model, year, color)
VALUES
    (12345, 1, 2, 'Toyota', 'Camry', 2019, 'DooDoo Brown'),
    (20122, 2, 1, 'BMW', 'M340i', 2023, 'Brooklyn Gray');

INSERT INTO invoice(invoice_id, car_serial_number, salesperson_id, customer_id, date_issued)
VALUES
    (1, 12345, 1, 2, '2023-01-09'),
    (2, 20122, 2, 1, '2023-11-18');

INSERT INTO service_ticket(service_ticket_id, car_serial_number, customer_id, date_serviced)
VALUES
    (1, 12345, 2, '2023-01-30'),
    (2, 20122, 1, '2023-12-01');

INSERT INTO service_history(service_history_id, service_ticket_id, car_serial_number, service_details)
VALUES
    (1, 1, 12345, 'DooDoo stains everywhere. Deep deeep deep clean'),
    (2, 2, 20122, 'Tinted extra dark windows');

INSERT INTO mechanic(mechanic_id, first_name, last_name, phone_number)
VALUES
    (1, 'Stone Cold', 'Steve Austin', 666-666-6666),
    (2, 'Barrack', 'Obama', 000-704-1776);

INSERT INTO repairs(car_serial_number, mechanic_id)
VALUES
    (12345, 1),
    (20122, 2);


SELECT * FROM customer

SELECT * FROM salesperson

SELECT * FROM car

SELECT * FROM invoice

SELECT * FROM service_ticket

SELECT * FROM service_history

SELECT * FROM mechanic

SELECT * FROM repairs

