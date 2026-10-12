# Dokumen Kebutuhan Data Sistem Informasi Akademik

## 1. Latar Belakang dan Aktivitas Organisasi

DIVRA Technologies bergerak di bidang teknologi dan pengembangan sistem informasi. Salah satu layanan yang dikembangkan adalah Sistem Informasi Akademik untuk membantu mengelola data mahasiswa, mata kuliah, jadwal kuliah, KRS, dan nilai.

Sistem ini dibuat agar data akademik lebih rapi dan mudah dicari. Kegiatannya meliputi pengelolaan data mahasiswa, pembukaan kelas setiap semester, pengisian KRS, penyusunan jadwal, dan pencatatan nilai mahasiswa.

## 2. Aktor dan Proses Bisnis

| Kode | Proses Bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mengelola data mahasiswa | Admin akademik | Ada mahasiswa baru atau perubahan data |
| PB-02 | Mengelola mata kuliah | Admin akademik | Data mata kuliah perlu ditambah atau diperbarui |
| PB-03 | Membuka kelas kuliah | Admin akademik | Jadwal perkuliahan semester baru disusun |
| PB-04 | Mengisi KRS | Mahasiswa | Mahasiswa memilih mata kuliah untuk semester berjalan |
| PB-05 | Mencatat nilai mahasiswa | Dosen | Penilaian mata kuliah selesai dilakukan |
| PB-06 | Mengelola data dosen | Admin akademik | Ada dosen baru atau perubahan data dosen |
| PB-07 | Mengelola data semester | Admin akademik | Ada semester akademik baru yang perlu disiapkan |
| PB-08 | Mengelola pilihan kelas dalam KRS | Admin akademik | Mahasiswa perlu menambah atau memperbarui pilihan kelas dalam KRS |

## 3. Dokumen Sumber yang Dianalisis

Dokumen yang digunakan adalah Kartu Rencana Studi (KRS). Dokumen ini berisi data mahasiswa dan mata kuliah yang diambil pada semester tertentu.

Data yang dicatat meliputi NIM, nama mahasiswa, semester, kode mata kuliah, nama mata kuliah, kelas, dan jumlah SKS. Data tersebut digunakan untuk mengetahui mata kuliah yang dipilih mahasiswa pada semester berjalan.

Dari dokumen KRS, data mahasiswa dapat dihubungkan dengan mata kuliah dan kelas yang dipilih. Dengan begitu, pihak akademik lebih mudah memeriksa pengambilan mata kuliah setiap mahasiswa.

### Contoh Dokumen KRS Fiktif

Berikut contoh Kartu Rencana Studi (KRS) yang dibuat sebagai dokumen sumber untuk analisis kebutuhan data Sistem Informasi Akademik.

**KARTU RENCANA STUDI (KRS)**

| Informasi | Data |
|---|---|
| Nomor KRS | KRS-2026-001 |
| NIM | 26001234 |
| Nama Mahasiswa |Gilbran Ginanjar |
| Semester | Ganjil 2026/2027 |
| Tanggal Pengisian | 10 Agustus 2026 |

**Daftar Mata Kuliah yang Diambil**

| Kode MK | Nama Mata Kuliah | Kelas | SKS |
|---|---|---|---:|
| BD101 | Basis Data | A | 3 |
| AL102 | Algoritma dan Pemrograman | B | 3 |
| MT103 | Matematika Diskrit | A | 2 |
| **Total SKS** | | | **8** |


### Pembedahan Dokumen Sumber

Dari contoh KRS tersebut, terdapat beberapa elemen data yang dapat digunakan dalam perancangan sistem:

1. **Data mahasiswa:** NIM dan nama mahasiswa digunakan untuk mengenali mahasiswa yang mengisi KRS.
2. **Data semester:** Informasi semester menunjukkan periode akademik saat KRS dibuat.
3. **Data mata kuliah:** Kode, nama mata kuliah, dan SKS digunakan untuk mengetahui mata kuliah yang dipilih.
4. **Data kelas kuliah:** Informasi kelas menunjukkan kelas yang diambil mahasiswa pada semester tersebut.
5. **Data KRS:** Nomor KRS dan tanggal pengisian digunakan untuk mencatat KRS mahasiswa.
6. **Detail KRS:** Daftar mata kuliah yang dipilih menghubungkan KRS dengan kelas-kelas kuliah yang diambil.

Total SKS diperoleh dari penjumlahan SKS seluruh mata kuliah yang dipilih. Data tersebut nantinya dapat digunakan untuk menampilkan KRS mahasiswa dan menghitung total SKS dalam satu semester.

## 4. Entitas Kandidat dan Elemen Data

| Entitas | Elemen Data Utama | Keterangan |
|---|---|---|
| Mahasiswa | NIM, nama, alamat, no_hp | Menyimpan data mahasiswa |
| Mata Kuliah | kode_mk, nama_mk, sks | Menyimpan data mata kuliah |
| Dosen | nidn, nama_dosen | Menyimpan data dosen |
| Semester | id_semester, tahun_ajaran | Menyimpan informasi semester |
| Kelas Kuliah | id_kelas, kode_mk, nidn, id_semester | Menyimpan kelas yang dibuka pada semester tertentu |
| KRS | id_krs, NIM, id_semester, tanggal_pengisian | Menyimpan pengambilan mata kuliah oleh mahasiswa |
| Detail KRS | id_krs, id_kelas | Menyimpan daftar kelas yang dipilih dalam KRS |
| Nilai | id_krs, id_kelas, nilai_akhir | Menyimpan nilai mahasiswa untuk kelas yang diambil |

## 5. Aturan Bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap mahasiswa memiliki NIM yang berbeda sebagai identitas mahasiswa. |
| AB-02 | Setiap mata kuliah memiliki kode mata kuliah yang berbeda. |
| AB-03 | Mata kuliah dapat dibuka menjadi kelas kuliah pada semester tertentu. |
| AB-04 | Setiap kelas kuliah yang dibuka harus memiliki mata kuliah, dosen, dan semester. |
| AB-05 | Mahasiswa mengisi KRS untuk memilih kelas kuliah pada semester yang sedang berjalan. |
| AB-06 | Mahasiswa tidak boleh mengambil kelas kuliah yang sama lebih dari satu kali dalam KRS pada semester yang sama. |
| AB-07 | Nilai diberikan kepada mahasiswa berdasarkan kelas kuliah yang diambil dalam KRS. |
| AB-08 | Data nilai hanya dapat dicatat setelah dosen menyelesaikan penilaian mahasiswa pada kelas yang diikutinya. |
| AB-09 | Jumlah SKS dalam KRS dihitung berdasarkan total SKS dari mata kuliah yang dipilih mahasiswa. |

## 6. Kebutuhan Informasi

| Kode | Kebutuhan Informasi | Pengguna | Data yang Dibutuhkan |
|---|---|---|---|
| KI-01 | Menampilkan data mahasiswa | Admin akademik | NIM, nama, alamat, no_hp |
| KI-02 | Menampilkan daftar mata kuliah beserta jumlah SKS | Admin akademik dan mahasiswa | kode_mk, nama_mk, sks |
| KI-03 | Menampilkan jadwal kelas kuliah setiap semester | Mahasiswa dan dosen | nama_mk, nama_dosen, semester, kelas |
| KI-04 | Menampilkan daftar mata kuliah yang diambil mahasiswa dalam KRS | Mahasiswa dan admin akademik | NIM, nama, semester, mata kuliah, SKS |
| KI-05 | Menampilkan total SKS yang diambil mahasiswa dalam satu semester | Mahasiswa dan admin akademik | NIM, semester, sks |
| KI-06 | Menampilkan nilai mahasiswa berdasarkan kelas kuliah | Mahasiswa, dosen, dan admin akademik | NIM, nama, mata kuliah, nilai_akhir |
| KI-07 | Menampilkan daftar mahasiswa yang mengambil kelas kuliah tertentu | Dosen dan admin akademik | nama_dosen, nama_mk, kelas, NIM, nama mahasiswa |
| KI-08 | Menampilkan rekap nilai mahasiswa pada suatu semester | Admin akademik | NIM, nama, mata kuliah, semester, nilai_akhir |

## 7. Matriks CRUD

Matriks CRUD menunjukkan tindakan pada data dalam setiap proses bisnis. C berarti Create, R berarti Read, U berarti Update, dan D berarti Delete.

| Proses Bisnis | Mahasiswa | Mata Kuliah | Dosen | Semester | Kelas Kuliah | KRS | Detail KRS | Nilai |
|---|---|---|---|---|---|---|---|---|
| PB-01 Mengelola data mahasiswa | C, R, U, D | - | - | - | - | - | - | - |
| PB-02 Mengelola mata kuliah | - | C, R, U, D | - | - | - | - | - | - |
| PB-03 Membuka kelas kuliah | - | R | R | R | C, R, U, D | - | - | - |
| PB-04 Mengisi KRS | R | R | - | R | R | C, R, U | - | - |
| PB-05 Mencatat nilai mahasiswa | R | R | R | R | R | R | R | C, R, U |
| PB-06 Mengelola data dosen | - | - | C, R, U, D | - | - | - | - | - |
| PB-07 Mengelola data semester | - | - | - | C, R, U, D | - | - | - | - |
| PB-08 Mengelola pilihan kelas dalam KRS | R | R | - | R | R | R, U | C, R, U, D | - |

**Keterangan:**
- **C (Create):** menambahkan data.
- **R (Read):** membaca atau menampilkan data.
- **U (Update):** memperbarui data.
- **D (Delete):** menghapus data.
- Tanda `-` berarti tidak ada operasi utama pada entitas tersebut dalam proses terkait.**Keterangan:**

## 8. Kamus Data Awal

| Entitas | Elemen Data | Keterangan | Pemilik Data |
|---|---|---|---|
| Mahasiswa | NIM | Nomor identitas mahasiswa | Admin akademik |
| Mahasiswa | nama | Nama lengkap mahasiswa | Admin akademik |
| Mahasiswa | alamat | Alamat mahasiswa | Admin akademik |
| Mahasiswa | no_hp | Nomor telepon mahasiswa | Admin akademik |
| Mata Kuliah | kode_mk | Kode unik mata kuliah | Admin akademik |
| Mata Kuliah | nama_mk | Nama mata kuliah | Admin akademik |
| Mata Kuliah | sks | Jumlah SKS mata kuliah | Admin akademik |
| Dosen | nidn | Nomor identitas dosen | Admin akademik |
| Dosen | nama_dosen | Nama lengkap dosen | Admin akademik |
| Semester | id_semester | Identitas unik semester | Admin akademik |
| Semester | tahun_ajaran | Tahun ajaran yang berlaku | Admin akademik |
| Semester | semester_ke | Semester ganjil atau genap | Admin akademik |
| Kelas Kuliah | id_kelas | Identitas unik kelas kuliah | Admin akademik |
| Kelas Kuliah | kode_mk | Kode mata kuliah yang dibuka | Admin akademik |
| Kelas Kuliah | nidn | Dosen pengampu kelas | Admin akademik |
| Kelas Kuliah | id_semester | Semester pembukaan kelas | Admin akademik |
| KRS | id_krs | Identitas unik KRS | Admin akademik |
| KRS | NIM | Mahasiswa pemilik KRS | Admin akademik |
| KRS | id_semester | Semester pengisian KRS | Admin akademik |
| KRS | tanggal_pengisian | Tanggal KRS dibuat | Admin akademik |
| Detail KRS | id_krs | KRS yang memuat pilihan kelas | Admin akademik |
| Detail KRS | id_kelas | Kelas yang dipilih mahasiswa | Admin akademik |
| Nilai | nilai_akhir | Nilai akhir mahasiswa pada kelas | Dosen |
| Nilai | id_krs | KRS milik mahasiswa | Admin akademik |
| Nilai | id_kelas | Kelas tempat nilai diberikan | Admin akademik |

## 9. Kebutuhan Non-Fungsional Data

### 9.1 Volume Data

Berdasarkan NIM 25430077, nilai P dihitung sebagai berikut:

P = (77 mod 9) + 1 = 6

Perkiraan transaksi harian = 40 + (5 × 6) = **70 transaksi per hari**.

### 9.2 Retensi Data

Data mahasiswa, KRS, dan nilai perlu disimpan agar riwayat akademik tetap tersedia untuk keperluan administrasi.

### 9.3 Privasi dan Hak Akses

Data pribadi mahasiswa harus dilindungi. Admin akademik mengelola data akademik, dosen mencatat nilai kelas yang diampu, sedangkan mahasiswa hanya dapat melihat data akademiknya sendiri.

## 10. Isu Kualitas Data yang Diantisipasi

| No. | Isu Kualitas Data | Cara Mengantisipasi |
|---|---|---|
| 1 | NIM mahasiswa tercatat ganda | Menggunakan NIM sebagai identitas unik mahasiswa. |
| 2 | Data mahasiswa tidak lengkap | Memeriksa data wajib sebelum disimpan. |
| 3 | Mata kuliah tercatat lebih dari satu kali | Menggunakan kode mata kuliah yang unik. |
| 4 | Mahasiswa mengambil kelas yang sama lebih dari sekali | Memeriksa pilihan kelas pada KRS sebelum disimpan. |
| 5 | Nilai mahasiswa salah atau belum terisi | Memeriksa nilai berdasarkan mahasiswa dan kelas yang diikuti. |
| 6 | Data KRS tidak sesuai dengan semester | Memastikan KRS terhubung dengan semester yang benar. |