## Laporan Praktikum Basis Data - Pertemuan 1
**Nama:**Divva Ramadhan Puja Pratama **NIM:**25430077 **Kelas:**C **Tanggal:**06-10-2026

## 1. Tujuan Praktikum
Praktikum ini bertujuan supaya bisa mengenal lingkungan kerja MariaDB menggunakan XAMPP dan Git. Di praktikum ini juga dipelajari cara menjalankan MariaDB,
masuk ke database lewat CLI dan phpMyAdmin, mengatur akun dan hak akses, serta menyimpan pekerjaan ke GitHub.

## 2. Ringkasan Dasar Teori
Basis data digunakan untuk menyimpan data supaya lebih teratur dan mudah dikelola. Untuk mengelolanya menggunakan MariaDB. MariaDB menggunakan sistem klien-server. 
Kita bisa mengaksesnya melalui mysql di Command Prompt atau menggunakan phpMyAdmin melalui browser. XAMPP digunakan untuk menjalankan MariaDB dengan lebih mudah 
melalui Control Panel. Di modul ini juga dibahas akun root, akun kerja, dan pemberian hak akses sesuai kebutuhan. Selain MariaDB, digunakan juga Git untuk mencatat p
erubahan pekerjaan dan menyimpan proyek ke GitHub.

## 3. Hasil Langkah Percobaan
D1_mariadb = Menjalankan Layanan MariaDB
D2_ClienBarisPerintah =  Masuk Melalui Klien Baris Perintah
D3_Root2 = Mengamankan Akun root
D4_database = masuk akun kerja
D5_phpmyadmin = tampilan phpmyadmin
D6_git = Repositori Git

## 4. Jawaban Titik Analisis
Titik Analisis 1
Walaupun tombol di XAMPP tertulis MySQL, server yang dipakai sebenarnya MariaDB. Dokumentasi MySQL masih bisa dipakai untuk hal umum
Titik Analisis 2
Login tanpa -p gagal karena root sudah diberi password. Jadi server menolak login karena password tidak dikirim.
Titik Analisis 3
information_schema tetap terlihat karena database tersebut masih bisa diakses oleh akun mhs_123. Sedangkan database mysql ditolak karena akun tersebut tidak punya hak 
akses. 1044 berarti akses database ditolak, sedangkan 1045 berkaitan dengan login.
Titik Analisis 4
Mode cookie lebih aman karena password tidak disimpan di file konfigurasi. Jadi password harus dimasukkan saat login ke phpMyAdmin

## 5. Hasil Latihan dan Modifikasi
5_latihandanmodifikasi = Hasil latihan akun tamu_077 yang hanya memiliki hak akses tertentu. Saat mencoba mengakses kopma_077, muncul ERROR 1044 karena akses ditolak.

## 6. Tugas Mandiri: Milestone Proyek 1
Pada tahap ini saya mulai menyiapkan database dan akun untuk proyek. Saya juga mengisi README.md, membuat .gitignore, lalu melakukan commit dan push ke GitHub.

## 7. Pembahasan dan Kendala
Selama praktikum saya masih agak bingung saat mengatur hak aksesnya. Contohnya saat akun hanya diberi hak SELECT, Saya juga sempat bingung saat membuat akun yang tidak 
memiliki hak akses. Setelah dicoba beberapa kali,mengikuti panduan buku dan di bntu asisten AI akhirny berhasil.

## 8. Kesimpulan
Praktikum ini memberikan pemahaman tentang cara menjalankan MariaDB melalui XAMPP, menggunakan CLI dan phpMyAdmin, serta mengatur akun dan hak akses. Selain itu, 
dipahami juga penggunaan Git dan GitHub untuk menyimpan serta mengelola hasil praktikum.

## 9. Pernyataan Penggunaan AI
Dalam beberapa langkah praktikum, AI digunakan sebagai bantuan untuk memahami perintah, mencari penyebab error, dan membantu menyelesaikan kendala yang ditemui. Hasil 
praktikum tetap dikerjakan dan diperiksa kembali secara langsung.

## 10. Bukti Git 
Tautan repository:https://github.com/DivvaRPP/basisdata.25430077
Hash commit: 979d218