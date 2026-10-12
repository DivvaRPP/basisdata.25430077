## 1. Latar Belakang dan Aktivitas Organisasi

Koperasi Mahasiswa Sejahtera (Kopma) menjual berbagai kebutuhan mahasiswa, seperti alat tulis, makanan ringan, dan minuman. Pembelinya bisa dari anggota koperasi maupun orang umum. Selama ini, pencatatan penjualan masih menggunakan buku tulis dan spreadsheet.

Kegiatan Kopma meliputi pendaftaran anggota, penjualan barang, pengecekan stok, dan pemesanan barang kepada pemasok jika stok mulai menipis. Barang yang datang dari pemasok juga perlu dicatat berdasarkan faktur. Anggota yang masih aktif mendapat potongan harga sebesar 5% saat berbelanja.

Setiap bulan, ketua koperasi membutuhkan laporan tentang hasil penjualan, barang yang paling laris, stok barang yang menipis, dan anggota yang paling sering berbelanja. Karena itu, data Kopma perlu dicatat dengan rapi agar lebih mudah dikelola dan dibuat laporannya.

## 2. Aktor dan Proses Bisnis

Berdasarkan studi kasus Kopma, terdapat lima proses bisnis utama yang dilakukan oleh kasir, petugas gudang, dan ketua koperasi.

| Kode | Proses Bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli membayar di kasir |
| PB-03 | Memesan barang ke pemasok | Petugas gudang | Stok di bawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |
| PB-06 | Mengelola data master barang, petugas, dan pemasok | Ketua koperasi | Ada data baru atau perubahan data barang, petugas, dan pemasok |

## 3. Dokumen Sumber yang Dianalisis

Dokumen sumber yang dianalisis adalah nota penjualan Kopma. Nota digunakan untuk mencatat barang yang dibeli, jumlah barang, harga, serta total pembayaran dalam satu transaksi.

| Elemen Data | Jenis | Keterangan |
|---|---|---|
| Nomor nota | Tersimpan | Identitas unik setiap transaksi |
| Tanggal dan waktu | Tersimpan | Waktu terjadinya transaksi |
| Nama kasir | Tersimpan | Kasir yang melayani transaksi |
| Anggota | Tersimpan jika ada | Identitas anggota yang melakukan pembelian |
| Nama barang | Tersimpan sebagai referensi | Barang yang dibeli |
| Jumlah barang | Tersimpan | Banyaknya barang yang dibeli |
| Harga satuan saat transaksi | Tersimpan | Harga barang ketika transaksi berlangsung |
| Subtotal | Nilai turunan | Hasil perkalian jumlah barang dengan harga satuan |
| Total pembayaran | Nilai turunan | Hasil perhitungan seluruh subtotal dan potongan jika ada |

## 4. Entitas Kandidat dan Elemen Data

Berdasarkan studi kasus Kopma, terdapat beberapa entitas kandidat yang diperlukan untuk mendukung kegiatan koperasi.

| Entitas | Elemen Data yang Dicatat |
|---|---|
| Anggota | Nomor anggota, NIM, nama, program studi, nomor HP, status anggota |
| Barang | Kode barang, nama barang, harga, stok, stok minimum |
| Petugas | ID petugas, nama petugas, jabatan |
| Penjualan | Nomor nota, tanggal dan waktu, kasir, anggota jika ada, total pembayaran |
| Detail Penjualan | Nomor nota, barang, jumlah, harga satuan saat transaksi, subtotal |
| Pemasok | ID pemasok, nama pemasok, alamat, nomor HP |
| Pembelian | Nomor pembelian, tanggal pembelian, pemasok, petugas |
| Detail Pembelian | Nomor pembelian, barang, jumlah, harga beli |

## 5. Aturan Bisnis

Aturan bisnis digunakan sebagai pedoman agar pencatatan dan pengelolaan data Kopma berjalan dengan benar.

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap nota penjualan memiliki nomor yang unik dan minimal satu detail barang. |
| AB-02 | Penjualan dapat dilakukan tanpa menjadi anggota. Jika pembeli merupakan anggota, potongan 5% diberikan kepada anggota yang berstatus aktif. |
| AB-03 | Stok barang tidak boleh negatif. Penjualan ditolak jika jumlah yang dibeli melebihi stok tersedia. |
| AB-04 | Harga barang saat transaksi harus disimpan pada detail penjualan agar tidak berubah ketika harga barang saat ini diperbarui. |
| AB-05 | NIM anggota harus unik. Pencarian anggota dapat dilakukan menggunakan nomor anggota atau NIM. |
| AB-06 | Pemesanan barang kepada pemasok dilakukan ketika stok berada di bawah batas minimum.
| AB-07 | Setiap kelipatan belanja Rp10.000 oleh anggota mendapatkan 1 poin loyalitas. |
| AB-08 | Anggota yang memiliki 50 poin loyalitas dapat menukarkannya dengan potongan harga Rp5.000. |

## 6. Kebutuhan Informasi

Kopma membutuhkan informasi dari database untuk memantau penjualan, persediaan barang, dan aktivitas anggota.

| Kode | Kebutuhan Informasi | Keterangan |
|---|---|---|
| KI-01 | Laporan penjualan harian dan bulanan | Menampilkan omzet dan jumlah nota penjualan. |
| KI-02 | Lima barang terlaris setiap bulan | Menampilkan lima barang dengan jumlah penjualan terbanyak. |
| KI-03 | Daftar barang dengan stok rendah | Menampilkan barang yang stoknya di bawah batas minimum. |
| KI-04 | Sepuluh anggota paling aktif setiap bulan | Menampilkan anggota dengan total belanja terbesar. |
| KI-05 | Menampilkan jumlah poin loyalitas setiap anggota dan anggota yang memenuhi syarat penukaran poin. |

## 7. Matriks CRUD

Matriks CRUD menunjukkan tindakan pada data dalam setiap proses bisnis. C berarti Create, R berarti Read, U berarti Update, dan D berarti Delete.

| Proses Bisnis | Anggota | Barang | Petugas | Penjualan | Detail Penjualan | Pemasok | Pembelian | Detail Pembelian |
|---|---|---|---|---|---|---|---|---|
| PB-01 Pendaftaran anggota | C | - | R | - | - | - | - | - |
| PB-02 Pencatatan penjualan | R, U | R, U | R | C | C | - | - | - |
| PB-03 Pemesanan barang | - | R | R | - | - | R | C | C |
| PB-04 Penerimaan barang | - | U | R | - | - | R | R, U | R |
| PB-05 Laporan bulanan | R | R | R | R | R | - | - | - |
| PB-06 Pengelolaan data master | - | C, R, U | C, R, U | - | - | C, R, U | - | - |

**Keterangan:**
- **C (Create):** menambahkan data.
- **R (Read):** membaca atau menampilkan data.
- **U (Update):** memperbarui data.
- **D (Delete):** menghapus data.
- Tanda `-` berarti tidak ada tindakan utama pada entitas tersebut dalam proses terkait.

## 8. Kamus Data Awal

Kamus data awal berisi elemen data penting dari setiap entitas yang digunakan dalam pengelolaan data Kopma. Setiap elemen dilengkapi dengan penanggung jawab data.

| No. | Entitas | Elemen Data | Keterangan | Penanggung Jawab |
|---:|---|---|---|---|
| 1 | Anggota | `nim_anggota` | NIM anggota sebagai identitas anggota | Petugas pendaftaran |
| 2 | Anggota | `nama_anggota` | Nama lengkap anggota | Petugas pendaftaran |
| 3 | Anggota | `no_hp_anggota` | Nomor telepon anggota | Ketua koperasi |
| 4 | Anggota | `status_anggota` | Status keanggotaan untuk menentukan hak diskon | Ketua koperasi |
| 5 | Anggota | `poin_loyalitas` | Jumlah poin loyalitas yang dimiliki anggota | Kasir |
| 6 | Barang | `kode_barang` | Kode unik untuk mengidentifikasi barang | Petugas gudang |
| 7 | Barang | `nama_barang` | Nama barang yang dijual | Petugas gudang |
| 8 | Barang | `harga_barang` | Harga jual barang | Ketua koperasi |
| 9 | Barang | `stok_barang` | Jumlah stok barang yang tersedia | Petugas gudang |
| 10 | Barang | `stok_minimum_barang` | Batas minimum stok untuk menentukan kebutuhan pemesanan | Petugas gudang |
| 11 | Penjualan | `no_nota_penjualan` | Nomor unik nota penjualan | Kasir |
| 12 | Penjualan | `tanggal_waktu_penjualan` | Tanggal dan waktu transaksi | Kasir |
| 13 | Penjualan | `total_pembayaran` | Total pembayaran setelah perhitungan transaksi dan diskon | Kasir |
| 14 | Detail Penjualan | `jumlah_detail_penjualan` | Jumlah barang yang dibeli dalam satu baris detail | Kasir |
| 15 | Detail Penjualan | `harga_satuan_detail_penjualan` | Harga satuan barang saat transaksi | Kasir |
| 16 | Petugas | `id_petugas` | Identitas unik petugas | Ketua koperasi |
| 17 | Petugas | `nama_petugas` | Nama petugas koperasi | Ketua koperasi |
| 18 | Pemasok | `id_pemasok` | Identitas unik pemasok | Petugas gudang |
| 19 | Pemasok | `nama_pemasok` | Nama pemasok barang | Petugas gudang |
| 20 | Pembelian | `no_pembelian` | Nomor transaksi pembelian dari pemasok | Petugas gudang |
| 21 | Pembelian | `tanggal_pembelian` | Tanggal pembelian barang dari pemasok | Petugas gudang |
| 22 | Detail Pembelian | `jumlah_detail_pembelian` | Jumlah barang yang dibeli dari pemasok | Petugas gudang |
| 23 | Detail Pembelian | `harga_beli_detail_pembelian` | Harga beli per satuan barang | Petugas gudang |

## 9. Kebutuhan Non-Fungsional Data

- **Volume:** Perkiraan sekitar 150 nota penjualan per hari.
- **Retensi:** Data transaksi disimpan minimal lima tahun.
- **Privasi:** Nomor HP anggota hanya boleh dilihat oleh ketua koperasi.

## 10. Isu Kualitas Data yang Diantisipasi

| Isu | Dampak | Antisipasi |
|---|---|---|
| NIM anggota tercatat ganda | Data anggota menjadi tidak akurat | NIM harus unik |
| Stok barang tidak sesuai kondisi sebenarnya | Penjualan dan pemesanan barang terganggu | Stok diperbarui setiap ada transaksi |
| Harga transaksi tidak tercatat dengan benar | Total pembayaran bisa salah | Simpan harga barang saat transaksi |
| Nomor nota tercatat ganda | Transaksi sulit dibedakan | Setiap nota harus memiliki nomor unik |
