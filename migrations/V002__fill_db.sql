-- Вставка данных в таблицу spaceship_manufacturer
INSERT INTO spaceship_manufacturer (id, company_name, country, nasdaq_code) VALUES
(1, 'Ford Nuclear Engine', 'USA', 'frdne'),
(2, 'Cosmical Motors', 'USA', 'cosmot'),
(3, 'Автокосмоваз', 'RU', 'acaz'),
(4, 'BNW', 'GE', 'bnw');

-- Вставка данных в таблицу spaceship_model
INSERT INTO spaceship_model (id, manufacturer_id, model_name, horsepower) VALUES
(1, 1, 'Aerostar', 170135000.0),
(2, 2, 'Stardilac', 175000000.0),
(3, 3, 'Lada Moonta', 240000000.0),
(4, 4, 'X5000', 190000000.0);

-- Вставка данных в таблицу spaceship
INSERT INTO spaceship (id, ship_number, model_id) VALUES
(1, 'A300BC 177', 3),
(2, 'A245BC 177', 1),
(3, 'A412RE 76', 2),
(4, 'X078BA 76', 4);

-- Вставка данных в таблицу driver
INSERT INTO driver (id, name, last_name, login, city) VALUES
(1, 'Arcady', 'Volozh', 'volozh.a', 'Moscow'),
(2, 'Lena', 'Bunina', 'bunina.e', 'Tel-Aviv'),
(3, 'David', 'Patterson', 'patterson.d', 'Berkeley'),
(4, 'James', 'Gosling', 'gosling.j', 'San José'),
(5, 'Elon', 'Musk', 'elon', 'Boca Chica Village');


-- Вставка данных в таблицу spaceship_rent
INSERT INTO spaceship_rent (driver_id, spaceship_id, rent_start, rent_end) VALUES
(1, 3, '2059-07-25 11:13:54', '2059-09-30 11:14:04'),
(2, 4, '2060-06-24 11:14:23', '2064-07-31 11:14:35'),
(3, 2, '2055-12-24 11:14:55', '2061-11-01 11:15:05'),
(4, 1, '2059-12-31 11:15:27', '2060-02-29 11:15:36'),
(5, 3, '2022-07-15 11:23:35', '2059-07-31 11:23:46');
