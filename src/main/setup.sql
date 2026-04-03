-- Création de la base de données
CREATE DATABASE IF NOT EXISTS jee CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE jee;

-- Création de la table users
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(60) PRIMARY KEY,
    password VARCHAR(60) NOT NULL
);

-- Insertion de l'utilisateur user/user
-- SHA-1("user") = 12dea96fec20593566ab75692c9949596833adc9
-- Attention : CryptSha.cryptSha pad à 32 chars minimum, ici 40 chars donc pas de padding
INSERT INTO users (username, password)
VALUES ('user', '12dea96fec20593566ab75692c9949596833adc9')
ON DUPLICATE KEY UPDATE password = VALUES(password);

-- Vérification
SELECT username, password FROM users;
