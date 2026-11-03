
-- Modul 6: Data Sistem Informasi Akademik
-- NIM: 25430077
-- Proyek: DIVRA Technologies
-- Periode KRS: Ganjil 2025/2026

USE akad_077;

-- 1. Mengosongkan data lama agar script dapat dijalankan ulang.
DELETE FROM nilai;
DELETE FROM detail_krs;
DELETE FROM krs;
DELETE FROM kelas_kuliah;
DELETE FROM semester;
DELETE FROM dosen;
DELETE FROM mata_kuliah;
DELETE FROM mahasiswa;

-- Mengatur ulang AUTO_INCREMENT.
ALTER TABLE semester AUTO_INCREMENT = 1;
ALTER TABLE kelas_kuliah AUTO_INCREMENT = 1;
ALTER TABLE krs AUTO_INCREMENT = 1;

-- 2. DATA MAHASISWA
INSERT INTO mahasiswa (NIM, nama, alamat, no_hp) VALUES
('25430078', 'Arunika Putri Maheswari', 'Bandar Lampung', '081278451201'),
('25430079', 'Rafi Althaf Pradana', 'Metro', '081278451202'),
('25430080', 'Keisya Nadhira Putri', 'Pringsewu', '081278451203'),
('25430081', 'Zayyan Fathir Ramadhan', 'Lampung Selatan', '081278451204'),
('25430082', 'Naira Salsabila Azzahra', 'Bandar Lampung', '081278451205'),
('25430083', 'Damar Aditya Prakoso', 'Bandar Lampung', '081278451206'),
('25430084', 'Almira Zahwa Anindita', 'Pesawaran', '081278451207'),
('25430085', 'Rangga Mahardika', 'Metro', '081278451208'),
('25430086', 'Talitha Maharani', 'Lampung Tengah', '081278451209'),
('25430087', 'Fikri Dzaky Firmansyah', 'Bandar Lampung', '081278451210'),
('25430088', 'Nadira Aulia Prameswari', 'Pringsewu', '081278451211'),
('25430089', 'Rendra Abimanyu', 'Metro', '081278451212'),
('25430090', 'Citra Ayuningtyas', 'Bandar Lampung', '081278451213'),
('25430091', 'Ilham Fadhlurrahman', 'Lampung Selatan', '081278451214'),
('25430092', 'Syifa Rahmadani', 'Pesawaran', '081278451215');

-- 3. DATA MATA KULIAH
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks) VALUES
('IF101', 'Pengantar Teknologi Informasi', 2),
('IF102', 'Algoritma dan Pemrograman', 3),
('IF103', 'Matematika Diskrit', 3),
('IF104', 'Dasar-Dasar Basis Data', 3),
('IF105', 'Sistem Digital', 2),
('IF201', 'Struktur Data', 3),
('IF202', 'Basis Data Lanjut', 3),
('IF203', 'Pemrograman Berorientasi Objek', 3),
('IF204', 'Jaringan Komputer', 3),
('IF205', 'Analisis dan Desain Sistem', 3),
('IF301', 'Rekayasa Perangkat Lunak', 3),
('IF302', 'Sistem Operasi', 3),
('IF303', 'Keamanan Sistem Informasi', 3),
('IF304', 'Interaksi Manusia dan Komputer', 2),
('IF305', 'Manajemen Proyek Teknologi Informasi', 3);

-- 4. DATA DOSEN
INSERT INTO dosen (nidn, nama_dosen) VALUES
('0010127801', 'Dr. Mahendra Kusuma, M.Kom.'),
('0020158201', 'Ratri Wulandari, M.Kom.'),
('0030188501', 'Fajar Nugroho, M.Kom.'),
('0040208701', 'Dr. Laksmi Puspitasari, M.Kom.'),
('0050229001', 'Bagas Pratama, M.Kom.');

-- 5. DATA SEMESTER
INSERT INTO semester (id_semester, tahun_ajaran, semester_ke) VALUES
(1, '2025/2026', 'Ganjil'),
(2, '2025/2026', 'Genap'),
(3, '2026/2027', 'Ganjil'),
(4, '2026/2027', 'Genap'),
(5, '2027/2028', 'Ganjil');

-- 6. DATA KELAS KULIAH
-- Semua kelas dibuka pada Ganjil 2025/2026.
INSERT INTO kelas_kuliah
(id_kelas, kode_mk, nidn, id_semester) VALUES
(1, 'IF101', '0010127801', 1),
(2, 'IF102', '0020158201', 1),
(3, 'IF103', '0030188501', 1),
(4, 'IF104', '0040208701', 1),
(5, 'IF105', '0050229001', 1),
(6, 'IF201', '0020158201', 1),
(7, 'IF202', '0030188501', 1),
(8, 'IF203', '0040208701', 1),
(9, 'IF204', '0050229001', 1),
(10, 'IF205', '0010127801', 1),
(11, 'IF301', '0030188501', 1),
(12, 'IF302', '0040208701', 1),
(13, 'IF303', '0050229001', 1),
(14, 'IF304', '0010127801', 1),
(15, 'IF305', '0020158201', 1);

-- 7. DATA KRS
INSERT INTO krs (id_krs, NIM, id_semester, tanggal_pengisian) VALUES
(1, '25430078', 1, '2025-08-10'),
(2, '25430079', 1, '2025-08-10'),
(3, '25430080', 1, '2025-08-11'),
(4, '25430081', 1, '2025-08-11'),
(5, '25430082', 1, '2025-08-12'),
(6, '25430083', 1, '2025-08-10'),
(7, '25430084', 1, '2025-08-10'),
(8, '25430085', 1, '2025-08-11'),
(9, '25430086', 1, '2025-08-11'),
(10, '25430087', 1, '2025-08-12'),
(11, '25430088', 1, '2025-08-10'),
(12, '25430089', 1, '2025-08-10'),
(13, '25430090', 1, '2025-08-11'),
(14, '25430091', 1, '2025-08-11'),
(15, '25430092', 1, '2025-08-12');

-- 8. DATA DETAIL KRS
-- Setiap mahasiswa memilih 4 kelas sesuai kelompok tingkat studinya.
-- Total: 15 KRS x 4 kelas = 60 baris.
INSERT INTO detail_krs
(id_krs, id_kelas, tanggal_pemilihan) VALUES
(1, 2, '2025-08-10'),
(1, 3, '2025-08-10'),
(1, 4, '2025-08-10'),
(1, 5, '2025-08-10'),
(2, 1, '2025-08-10'),
(2, 3, '2025-08-10'),
(2, 4, '2025-08-10'),
(2, 5, '2025-08-10'),
(3, 1, '2025-08-11'),
(3, 2, '2025-08-11'),
(3, 4, '2025-08-11'),
(3, 5, '2025-08-11'),
(4, 1, '2025-08-11'),
(4, 2, '2025-08-11'),
(4, 3, '2025-08-11'),
(4, 5, '2025-08-11'),
(5, 1, '2025-08-12'),
(5, 2, '2025-08-12'),
(5, 3, '2025-08-12'),
(5, 4, '2025-08-12'),

(6, 7, '2025-08-10'),
(6, 8, '2025-08-10'),
(6, 9, '2025-08-10'),
(6, 10, '2025-08-10'),
(7, 6, '2025-08-10'),
(7, 8, '2025-08-10'),
(7, 9, '2025-08-10'),
(7, 10, '2025-08-10'),
(8, 6, '2025-08-11'),
(8, 7, '2025-08-11'),
(8, 9, '2025-08-11'),
(8, 10, '2025-08-11'),
(9, 6, '2025-08-11'),
(9, 7, '2025-08-11'),
(9, 8, '2025-08-11'),
(9, 10, '2025-08-11'),
(10, 6, '2025-08-12'),
(10, 7, '2025-08-12'),
(10, 8, '2025-08-12'),
(10, 9, '2025-08-12'),

(11, 12, '2025-08-10'),
(11, 13, '2025-08-10'),
(11, 14, '2025-08-10'),
(11, 15, '2025-08-10'),
(12, 11, '2025-08-10'),
(12, 13, '2025-08-10'),
(12, 14, '2025-08-10'),
(12, 15, '2025-08-10'),
(13, 11, '2025-08-11'),
(13, 12, '2025-08-11'),
(13, 14, '2025-08-11'),
(13, 15, '2025-08-11'),
(14, 11, '2025-08-11'),
(14, 12, '2025-08-11'),
(14, 13, '2025-08-11'),
(14, 15, '2025-08-11'),
(15, 11, '2025-08-12'),
(15, 12, '2025-08-12'),
(15, 13, '2025-08-12'),
(15, 14, '2025-08-12');

-- 9. DATA NILAI
-- Setiap detail KRS memiliki satu nilai akhir.
INSERT INTO nilai (id_krs, id_kelas, nilai_akhir) VALUES
(1, 2, 87.50),
(1, 3, 78.00),
(1, 4, 91.00),
(1, 5, 82.50),
(2, 1, 88.00),
(2, 3, 75.50),
(2, 4, 84.00),
(2, 5, 90.00),
(3, 1, 79.50),
(3, 2, 86.00),
(3, 4, 88.50),
(3, 5, 80.00),
(4, 1, 92.00),
(4, 2, 81.50),
(4, 3, 77.00),
(4, 5, 85.50),
(5, 1, 83.00),
(5, 2, 89.50),
(5, 3, 86.50),
(5, 4, 90.00),

(6, 7, 88.50),
(6, 8, 82.00),
(6, 9, 79.50),
(6, 10, 91.00),
(7, 6, 85.00),
(7, 8, 90.50),
(7, 9, 84.50),
(7, 10, 78.00),
(8, 6, 89.00),
(8, 7, 83.50),
(8, 9, 92.00),
(8, 10, 86.00),
(9, 6, 76.50),
(9, 7, 88.00),
(9, 8, 81.50),
(9, 10, 90.50),
(10, 6, 91.50),
(10, 7, 79.00),
(10, 8, 87.50),
(10, 9, 84.00),

(11, 12, 90.00),
(11, 13, 86.50),
(11, 14, 88.00),
(11, 15, 93.50),
(12, 11, 84.50),
(12, 13, 91.00),
(12, 14, 82.50),
(12, 15, 87.00),
(13, 11, 88.50),
(13, 12, 85.00),
(13, 14, 94.00),
(13, 15, 89.50),
(14, 11, 79.00),
(14, 12, 92.50),
(14, 13, 86.00),
(14, 15, 90.00),
(15, 11, 93.00),
(15, 12, 87.50),
(15, 13, 89.00),
(15, 14, 84.50);

-- Selesai: data Akademik Modul 6 berhasil dimasukkan.
