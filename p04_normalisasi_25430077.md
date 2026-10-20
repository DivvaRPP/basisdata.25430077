# F. Tugas Mandiri: Milestone Proyek 4
## F.1 Bentuk Tidak Normal (UNF)

Dokumen sumber yang digunakan pada tahap normalisasi ini adalah Kartu Rencana Studi (KRS) dari proyek Sistem Informasi Akademik DIVRA Technologies. Dokumen KRS berisi identitas mahasiswa, semester, tanggal pengisian, serta daftar mata kuliah yang diambil mahasiswa.

Pada bentuk tidak normal (UNF), data KRS masih digambarkan dalam satu struktur yang memiliki kelompok data mata kuliah berulang. Satu KRS dapat berisi beberapa mata kuliah yang dipilih mahasiswa.

Struktur relasi UNF:

`KRS_UNF (id_krs, NIM, nama, id_semester, tahun_ajaran, semester_ke, tanggal_pengisian, {kode_mk, nama_mk, kelas, sks})`

Contoh data dari dokumen KRS:

| Nomor KRS | NIM | Nama Mahasiswa | Semester | Kode MK | Nama Mata Kuliah | Kelas | SKS |
|---|---|---|---|---|---|---|---:|
| KRS-2026-001 | 26001234 | Gilbran Ginanjar | Ganjil 2026/2027 | BD101 | Basis Data | A | 3 |
| KRS-2026-001 | 26001234 | Gilbran Ginanjar | Ganjil 2026/2027 | AL102 | Algoritma dan Pemrograman | B | 3 |
| KRS-2026-001 | 26001234 | Gilbran Ginanjar | Ganjil 2026/2027 | MT103 | Matematika Diskrit | A | 2 |

Berdasarkan contoh tersebut, satu KRS memiliki tiga mata kuliah. Informasi identitas KRS dan mahasiswa berlaku untuk seluruh mata kuliah yang dipilih. Kelompok data mata kuliah yang berulang menunjukkan bahwa struktur ini masih berada pada bentuk UNF.

Total SKS pada contoh KRS adalah 8, yang diperoleh dari penjumlahan SKS ketiga mata kuliah. Total SKS merupakan nilai turunan karena dapat dihitung dari data SKS mata kuliah yang dipilih.

## F.2 Dependensi Fungsional (FD)

Dependensi fungsional menunjukkan hubungan antara atribut penentu dan atribut yang nilainya ditentukan. Penentuan dependensi fungsional pada proyek Sistem Informasi Akademik mengacu pada aturan bisnis, kamus data, dan ERD yang telah dibuat pada modul sebelumnya.

| Kode | Dependensi Fungsional | Dasar |
|---|---|---|
| FD-01 | `NIM → nama, alamat, no_hp` | AB-01 |
| FD-02 | `kode_mk → nama_mk, sks` | AB-02 |
| FD-03 | `nidn → nama_dosen` | Identitas unik dosen pada ERD |
| FD-04 | `id_semester → tahun_ajaran, semester_ke` | Kamus data Semester |
| FD-05 | `id_kelas → kode_mk, nidn, id_semester` | AB-03 dan AB-04 |
| FD-06 | `id_krs → NIM, id_semester, tanggal_pengisian` | Struktur entitas KRS |
| FD-07 | `(id_krs, id_kelas) → nilai_akhir` | AB-07 dan struktur entitas Nilai |

### Penjelasan Dependensi Fungsional

1. **FD-01:** NIM menentukan nama, alamat, dan nomor telepon mahasiswa karena setiap mahasiswa memiliki NIM yang berbeda.
2. **FD-02:** Kode mata kuliah menentukan nama dan jumlah SKS mata kuliah.
3. **FD-03:** NIDN menentukan nama dosen yang bersangkutan.
4. **FD-04:** ID semester menentukan tahun ajaran dan jenis semester.
5. **FD-05:** ID kelas menentukan mata kuliah yang dibuka, dosen pengampu, dan semester pembukaan kelas.
6. **FD-06:** ID KRS menentukan mahasiswa pemilik KRS, semester, dan tanggal pengisian.
7. **FD-07:** Gabungan ID KRS dan ID kelas menentukan nilai akhir mahasiswa untuk kelas yang tercatat dalam KRS, dengan asumsi satu kelas hanya memiliki satu nilai akhir untuk setiap KRS.

### Catatan Pemeriksaan Data

Total SKS KRS merupakan nilai turunan yang dihitung dari penjumlahan SKS kelas-kelas yang dipilih mahasiswa sesuai AB-09. Karena nilainya dapat dihitung dari data yang tersedia, total SKS tidak perlu dijadikan atribut penentu dalam daftar dependensi fungsional ini.

## F.3 Tahapan Normalisasi

### 1. Bentuk Normal Pertama (1NF)

Pada tahap 1NF, kelompok mata kuliah yang berulang pada satu KRS dipisahkan menjadi baris-baris tersendiri. Setiap baris mencatat satu kelas yang dipilih mahasiswa.

Relasi 1NF:

`KRS_1NF (id_krs, NIM, nama, alamat, no_hp, id_semester, tahun_ajaran, semester_ke, tanggal_pengisian, id_kelas, kode_mk, nama_mk, sks, nidn, nama_dosen, nilai_akhir)`

Kunci kandidat yang digunakan pada tahap ini adalah gabungan (id_krs, id_kelas)`, karena satu KRS dapat berisi beberapa kelas dan kelas yang sama tidak boleh dipilih lebih dari satu kali dalam KRS yang sama sesuai AB-06.

### 2. Bentuk Normal Kedua (2NF)

Pada tahap 2NF, atribut yang hanya bergantung pada sebagian kunci gabungan dipisahkan ke relasi masing-masing. Data mahasiswa, mata kuliah, dosen, semester, dan kelas kuliah tidak perlu diulang pada setiap detail KRS.

Relasi hasil pemisahan:

- `MAHASISWA (NIM, nama, alamat, no_hp)`
- `MATA_KULIAH (kode_mk, nama_mk, sks)`
- `DOSEN (nidn, nama_dosen)`
- `SEMESTER (id_semester, tahun_ajaran, semester_ke)`
- `KELAS_KULIAH (id_kelas, kode_mk, nidn, id_semester)`
- `KRS (id_krs, NIM, id_semester, tanggal_pengisian)`
- `DETAIL_KRS (id_krs, id_kelas)`
- `NILAI (id_krs, id_kelas, nilai_akhir)`

### 3. Bentuk Normal Ketiga (3NF)

Pada tahap 3NF, atribut yang tidak bergantung langsung pada kunci utama dipisahkan agar tidak menimbulkan ketergantungan transitif. Contohnya, nama mata kuliah disimpan pada relasi MATA_KULIAH, bukan di KELAS_KULIAH atau KRS.

Berdasarkan dependensi fungsional yang telah diidentifikasi, relasi hasil normalisasi 3NF adalah:

1. `MAHASISWA (NIM, nama, alamat, no_hp)`
2. `MATA_KULIAH (kode_mk, nama_mk, sks)`
3. `DOSEN (nidn, nama_dosen)`
4. `SEMESTER (id_semester, tahun_ajaran, semester_ke)`
5. `KELAS_KULIAH (id_kelas, kode_mk, nidn, id_semester)`
6. `KRS (id_krs, NIM, id_semester, tanggal_pengisian)`
7. `DETAIL_KRS (id_krs, id_kelas)`
8. `NILAI (id_krs, id_kelas, nilai_akhir)`

Pemisahan tersebut mengurangi pengulangan data dan membantu menjaga konsistensi ketika data mahasiswa, mata kuliah, dosen, atau semester diperbarui.

## F.4 Pemeriksaan BCNF dan Skema Relasional

### 1. Pemeriksaan Boyce-Codd Normal Form (BCNF)

BCNF merupakan bentuk normal yang mensyaratkan setiap atribut penentu pada dependensi fungsional nontrivial merupakan superkey. Pemeriksaan dilakukan berdasarkan dependensi fungsional pada F.2 dan rancangan relasi pada F.3.

| Relasi | Atribut Penentu | Kunci | Hasil |
|---|---|---|---|
| MAHASISWA | NIM | NIM | Memenuhi BCNF |
| MATA_KULIAH | kode_mk | kode_mk | Memenuhi BCNF |
| DOSEN | nidn | nidn | Memenuhi BCNF |
| SEMESTER | id_semester | id_semester | Memenuhi BCNF |
| KELAS_KULIAH | id_kelas | id_kelas | Memenuhi BCNF |
| KRS | id_krs | id_krs | Memenuhi BCNF |
| DETAIL_KRS | (id_krs, id_kelas) | (id_krs, id_kelas) | Memenuhi BCNF |
| NILAI | (id_krs, id_kelas) | (id_krs, id_kelas) | Memenuhi BCNF |

Berdasarkan dependensi fungsional yang telah ditetapkan, setiap atribut penentu pada relasi di atas merupakan kunci atau superkey. Oleh karena itu, relasi-relasi tersebut memenuhi BCNF dengan asumsi tidak terdapat dependensi fungsional tambahan yang belum dicatat.

### 2. Skema Relasional Hasil Normalisasi

Berikut skema relasional untuk Sistem Informasi Akademik DIVRA Technologies.

| Relasi | Primary Key (PK) | Foreign Key (FK) |
|---|---|---|
| MAHASISWA | `NIM` | - |
| MATA_KULIAH | `kode_mk` | - |
| DOSEN | `nidn` | - |
| SEMESTER | `id_semester` | - |
| KELAS_KULIAH | `id_kelas` | `kode_mk`, `nidn`, `id_semester` |
| KRS | `id_krs` | `NIM`, `id_semester` |
| DETAIL_KRS | `(id_krs, id_kelas)` | `id_krs`, `id_kelas` |
| NILAI | `(id_krs, id_kelas)` | `(id_krs, id_kelas)` yang merujuk ke DETAIL_KRS |

### 3. Bentuk Relasi

1. `MAHASISWA (NIM, nama, alamat, no_hp)`
2. `MATA_KULIAH (kode_mk, nama_mk, sks)`
3. `DOSEN (nidn, nama_dosen)`
4. `SEMESTER (id_semester, tahun_ajaran, semester_ke)`
5. `KELAS_KULIAH (id_kelas, kode_mk, nidn, id_semester)`
6. `KRS (id_krs, NIM, id_semester, tanggal_pengisian)`
7. `DETAIL_KRS (id_krs, id_kelas)`
8. `NILAI (id_krs, id_kelas, nilai_akhir)`

### 4. Alasan Penetapan Kunci

- `NIM`, `kode_mk`, dan `nidn` digunakan sebagai kunci utama karena masing-masing merupakan identitas unik mahasiswa, mata kuliah, dan dosen.
- `id_semester`, `id_kelas`, dan `id_krs` digunakan sebagai kunci utama sesuai rancangan entitas pada Modul 2.
- Gabungan `id_krs` dan `id_kelas` menjadi kunci utama DETAIL_KRS agar kelas yang sama tidak dicatat berulang dalam satu KRS, sesuai AB-06.
- NILAI menggunakan gabungan `id_krs` dan `id_kelas` sebagai kunci utama sekaligus kunci tamu gabungan yang merujuk ke DETAIL_KRS. Dengan demikian, nilai hanya dapat dicatat untuk kelas yang tercatat dalam KRS.
hap berikutnya, yaitu penentuan keputusan penyimpanan nilai turunan dan pemeriksaan konsistensi dengan ERD Modul 3.

## F.5 Keputusan Penyimpanan Nilai Turunan

Pada sistem informasi akademik, ada data yang bisa dihitung dari data lain. Karena itu, perlu ditentukan data mana yang harus disimpan dan mana yang cukup dihitung saat dibutuhkan.

### 1. Total SKS dalam KRS

Total SKS didapat dari penjumlahan SKS semua mata kuliah yang dipilih mahasiswa. Hal ini sesuai dengan aturan bisnis AB-09.

Total SKS tidak perlu disimpan secara terpisah di tabel KRS karena jumlahnya bisa dihitung saat dibutuhkan. Dengan begitu, data tidak perlu dicatat dua kali dan risiko perbedaan jumlah SKS bisa dikurangi.

### 2. Nilai Akhir Mahasiswa

Nilai akhir mahasiswa disimpan di tabel NILAI karena nilai tersebut merupakan hasil penilaian dosen. Sesuai aturan bisnis AB-07 dan AB-08, nilai diberikan berdasarkan kelas yang diambil mahasiswa dan dicatat setelah dosen menyelesaikan penilaian.

Nilai ini perlu disimpan supaya bisa dilihat kembali dan digunakan untuk membuat rekap nilai mahasiswa.

### 3. Tanggal Pemilihan Kelas

Pada ERD sebelumnya, terdapat atribut `tanggal_pemilihan` di entitas Detail KRS. Namun, atribut ini belum ada di kamus data Modul 2.

Jika tanggal tersebut memang diperlukan untuk mencatat kapan mahasiswa memilih kelas, atribut ini tetap digunakan di tabel DETAIL_KRS. Kamus data Modul 2 juga perlu disesuaikan agar keduanya sama.

## F.6 Pemeriksaan dan Pembaruan ERD

### 1. Hasil Pemeriksaan ERD

Setelah dilakukan normalisasi, struktur ERD Sistem Informasi Akademik tetap menggunakan delapan entitas, yaitu MAHASISWA, MATA_KULIAH, DOSEN, SEMESTER, KELAS_KULIAH, KRS, DETAIL_KRS, dan NILAI.

Entitas dan hubungan tersebut tetap dipertahankan karena sudah sesuai dengan kebutuhan sistem dan hasil normalisasi.

### 2. Perubahan ERD

Perubahan yang dilakukan adalah mempertahankan atribut `tanggal_pemilihan` pada entitas DETAIL_KRS dan menambahkannya ke kamus data Modul 2 agar keduanya konsisten.

Total SKS tidak ditambahkan sebagai atribut tetap pada KRS karena jumlahnya dapat dihitung dari SKS mata kuliah yang dipilih mahasiswa.

Entitas NILAI tetap memiliki atribut `nilai_akhir` dengan kunci utama gabungan `id_krs` dan `id_kelas`, yang juga menjadi kunci tamu ke DETAIL_KRS.
