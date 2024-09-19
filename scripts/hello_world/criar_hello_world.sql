CREATE DATABASE hello_world;

USE hello_world;

CREATE TABLE users(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth_date DATETIME DEFAULT('1899-01-01') # yyyy-mm-dd 
);

START TRANSACTION;

INSERT INTO
    users(name, birth_date)
values
    ("Jonas", "1950-01-01");

COMMIT;

SELECT
    *
FROM
    users;