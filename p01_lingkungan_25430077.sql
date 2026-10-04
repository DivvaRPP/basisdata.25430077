CREATE DATABASE IF NOT EXISTS kopma_077
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mhs_077'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_077.* TO 'mhs_077'@'localhost';
