CREATE TABLE spaceship_manufacturer (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    nasdaq_code VARCHAR(50)
);

CREATE TABLE spaceship_model (
    id SERIAL PRIMARY KEY,
    manufacturer_id INTEGER NOT NULL REFERENCES spaceship_manufacturer(id),
    model_name VARCHAR(50),
    horsepower DOUBLE PRECISION NOT NULL CHECK (horsepower BETWEEN 170000000 AND 240000000)
);

CREATE TABLE spaceship (
    id SERIAL PRIMARY KEY,
    ship_number VARCHAR(50) NOT NULL,
    model_id INTEGER NOT NULL REFERENCES spaceship_model(id)
);

CREATE TABLE driver (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    login VARCHAR(50) NOT NULL UNIQUE,
    city VARCHAR(30)
);

CREATE TABLE spaceship_rent (
    driver_id INTEGER NOT NULL,
    spaceship_id INTEGER NOT NULL,
    rent_start TIMESTAMP(6) NOT NULL,
    rent_end TIMESTAMP(6) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (spaceship_id) REFERENCES spaceship(id)
);
