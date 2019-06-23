CREATE DATABASE IF NOT EXISTS staff;
USE staff;
CREATE TABLE IF NOT EXISTS people (
id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
first_name VARCHAR(30) NOT NULL, 
last_name VARCHAR(30) NOT NULL,
salary INT UNSIGNED NOT NULL
);
INSERT INTO people ( id, first_name, last_name, salary) VALUES ( null, 'Ivan', 'Ivanov', 50000);
INSERT INTO people ( id, first_name, last_name, salary) VALUES ( null, 'Petr', 'Petrov', 25000);
INSERT INTO people ( id, first_name, last_name, salary) VALUES ( null, 'Alex', 'Sidorov', 25000);
INSERT INTO people ( id, first_name, last_name, salary) VALUES ( null, 'Nikon', 'Abramov', 40000);
INSERT INTO people ( id, first_name, last_name, salary) VALUES ( null, 'Oleg', 'Chudov', 15000);
CREATE TABLE IF NOT EXISTS positions (
id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key, 
position_name VARCHAR(30) NOT NULL
);
INSERT INTO positions (id, position_name) VALUES (null, 'Technical_Director');
INSERT INTO positions (id, position_name) VALUES (null, 'Manager');
INSERT INTO positions (id, position_name) VALUES (null, 'Driver');
INSERT INTO positions (id, position_name) VALUES (null, 'Specialist');
ALTER TABLE people ADD position_id INTEGER NOT NULL;
UPDATE people SET position_id = 1 WHERE id = 1;
UPDATE people SET position_id = 2 WHERE id = 4;
UPDATE people SET position_id = 3 WHERE id = 5;
UPDATE people SET position_id = 4 WHERE id IN (2,3);
SELECT * FROM staff.people WHERE salary < 30000;
SELECT p.first_name, p.last_name, p.salary, pos.position_name FROM people p
INNER JOIN positions pos ON p.position_id = pos.id
WHERE salary < 30000 AND pos.position_name = 'Specialist';
CREATE TABLE IF NOT EXISTS subordination (
chief_id INT UNSIGNED NOT NULL, 
subordinate_id INT UNSIGNED NOT NULL,
PRIMARY KEY (chief_id, subordinate_id)
);
INSERT INTO subordination (chief_id, subordinate_id) VALUES
(1, 4),
(1, 5),
(4, 2),
(4, 3)
;
SELECT p.first_name, p.last_name, s.chief_id, s.subordinate_id FROM people p
INNER JOIN subordination s ON p.id = s.subordinate_id
WHERE s.chief_id = 1;