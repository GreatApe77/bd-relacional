CREATE DATABASE IF NOT EXISTS base_de_dados;

USE base_de_dados;

CREATE TABLE IF NOT EXISTS users(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS roles(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS profiles(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bio VARCHAR(255),
    description VARCHAR(255),
    user_id INT NOT NULL
);

CREATE TABLE users_roles(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

ALTER TABLE
    users_roles
ADD
    CONSTRAINT fk_users_roles_role FOREIGN KEY (role_id) REFERENCES roles(id);

ALTER TABLE
    users_roles
ADD
    CONSTRAINT fk_users_roles_user FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE
    profiles
ADD
    CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users(id);