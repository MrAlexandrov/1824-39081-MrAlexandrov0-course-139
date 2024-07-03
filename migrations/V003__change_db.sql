ALTER TABLE driver ADD COLUMN full_name VARCHAR(255) NOT NULL DEFAULT '';
UPDATE driver SET full_name = CASE
    WHEN last_name IS NULL OR last_name = '' THEN name
    ELSE name || ' ' || last_name
END WHERE full_name = '';
ALTER TABLE driver ALTER COLUMN full_name DROP DEFAULT;
ALTER TABLE driver DROP COLUMN name;
ALTER TABLE driver DROP COLUMN last_name;


ALTER TABLE spaceship_manufacturer ADD COLUMN moex_code VARCHAR(53);
UPDATE spaceship_manufacturer SET moex_code = nasdaq_code || '_ru';
ALTER TABLE spaceship_manufacturer DROP COLUMN nasdaq_code;
