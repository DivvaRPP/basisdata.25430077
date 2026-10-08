CREATE DATABASE IF NOT EXISTS kopma_077
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mhs_077'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_077.* TO 'mhs_077'@'localhost';

CREATE USER 'tamu_077'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_077.* TO 'tamu_077'@'localhost';

CREATE DATABASE IF NOT EXISTS akad_077
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'dev_077'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON akad_077.* TO 'dev_077'@'localhost';

git init
git add README.md p01_lingkungan_25430077.sql
git commit -m "p01: inisialisasi repositori dan skrip lingkungan"
git remote add origin https://github.com/DivvaRPP/basisdata.254300777.git
git push -u origin main