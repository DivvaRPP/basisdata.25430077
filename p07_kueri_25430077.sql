-- KI-01
-- Pertanyaan: Bagaimana cara melihat seluruh data mahasiswa?
-- Hasil yang diharapkan: Menampilkan 15 mahasiswa beserta NIM,
-- nama, alamat, dan nomor HP.
SELECT NIM, nama, alamat, no_hp
FROM mahasiswa
ORDER BY nama;

-- KI-01
-- Pertanyaan: Bagaimana cara mencari mahasiswa yang namanya mengandung kata "Putri"?
-- Hasil yang diharapkan: Menampilkan mahasiswa yang memiliki kata "Putri" pada namanya.
SELECT NIM, nama, alamat, no_hp
FROM mahasiswa
WHERE nama LIKE '%Putri%'
ORDER BY nama;

-- KI-01
-- Pertanyaan: Apakah ada mahasiswa yang belum mengisi nomor HP?
-- Hasil yang diharapkan: Menampilkan mahasiswa yang kolom no_hp-nya bernilai NULL.
SELECT NIM, nama, no_hp
FROM mahasiswa
WHERE no_hp IS NULL;

-- KI-02
-- Pertanyaan: Apa saja mata kuliah yang tersedia beserta jumlah SKS-nya?
-- Hasil yang diharapkan: Menampilkan 15 mata kuliah beserta kode, nama, dan SKS.
SELECT kode_mk, nama_mk, sks
FROM mata_kuliah
ORDER BY kode_mk;

-- KI-02
-- Pertanyaan: Mata kuliah apa saja yang memiliki 2 SKS atau 3 SKS?
-- Hasil yang diharapkan: Menampilkan mata kuliah dengan jumlah SKS 2 atau 3.
SELECT kode_mk, nama_mk, sks
FROM mata_kuliah
WHERE sks IN (2, 3)
ORDER BY sks, kode_mk;

-- KI-02
-- Pertanyaan: Bagaimana kategori mata kuliah berdasarkan jumlah SKS?
-- Hasil yang diharapkan: Menampilkan nama mata kuliah, jumlah SKS, dan kategorinya.
SELECT nama_mk, sks,
       CASE
           WHEN sks = 2 THEN 'Mata Kuliah 2 SKS'
           WHEN sks = 3 THEN 'Mata Kuliah 3 SKS'
           ELSE 'SKS lainnya'
       END AS kategori
FROM mata_kuliah
ORDER BY kode_mk;

-- KI-02
-- Pertanyaan: Bagaimana menampilkan kode dan nama mata kuliah dalam satu kolom?
-- Hasil yang diharapkan: Menampilkan kode mata kuliah dan nama mata kuliah yang digabungkan.
SELECT CONCAT(kode_mk, ' - ', nama_mk) AS informasi_mata_kuliah
FROM mata_kuliah
ORDER BY kode_mk;

-- KI-04
-- Pertanyaan: KRS apa saja yang diisi pada tanggal 10 sampai 12 Agustus 2025?
-- Hasil yang diharapkan: Menampilkan data KRS yang tanggal pengisiannya berada dalam rentang tersebut.
SELECT id_krs, NIM, id_semester, tanggal_pengisian
FROM krs
WHERE tanggal_pengisian BETWEEN '2025-08-10' AND '2025-08-12'
ORDER BY tanggal_pengisian;

-- KI-04
-- Pertanyaan: Bagaimana menampilkan tanggal pengisian KRS dengan format hari-bulan-tahun?
-- Hasil yang diharapkan: Menampilkan ID KRS, NIM, dan tanggal pengisian dengan format DD-MM-YYYY.
SELECT id_krs, NIM,
       DATE_FORMAT(tanggal_pengisian, '%d-%m-%Y') AS tanggal_format
FROM krs
ORDER BY tanggal_pengisian;

-- KI-06
-- Pertanyaan: Data nilai apa saja yang berada pada rentang 80 sampai 90?
-- Hasil yang diharapkan: Menampilkan ID KRS, ID kelas, dan nilai akhir dalam rentang tersebut.
SELECT id_krs, id_kelas, nilai_akhir
FROM nilai
WHERE nilai_akhir BETWEEN 80 AND 90
ORDER BY nilai_akhir DESC;

-- ==========================================
-- KI YANG BELUM DAPAT DIJAWAB DENGAN SATU TABEL
-- ==========================================

-- KI-03: Membutuhkan tabel kelas_kuliah, mata_kuliah,
-- dosen, dan semester.

-- KI-04: Membutuhkan tabel mahasiswa, krs, semester,
-- detail_krs, kelas_kuliah, dan mata_kuliah.

-- KI-05: Membutuhkan tabel krs, detail_krs,
-- kelas_kuliah, dan mata_kuliah.

-- KI-06: Membutuhkan tabel nilai, detail_krs,
-- krs, mahasiswa, kelas_kuliah, dan mata_kuliah.

-- KI-07: Membutuhkan tabel detail_krs, krs,
-- mahasiswa, kelas_kuliah, dosen, dan mata_kuliah.

-- KI-08: Membutuhkan tabel nilai, detail_krs,
-- krs, mahasiswa, kelas_kuliah, mata_kuliah, dan semester.

-- KI tersebut akan dikerjakan menggunakan JOIN
-- pada pertemuan berikutnya.