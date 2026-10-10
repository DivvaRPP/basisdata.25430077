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

## 6. Kebutuhan Informasi

Kopma membutuhkan informasi dari database untuk memantau penjualan, persediaan barang, dan aktivitas anggota.

| Kode | Kebutuhan Informasi | Keterangan |
|---|---|---|
| KI-01 | Laporan penjualan harian dan bulanan | Menampilkan omzet dan jumlah nota penjualan. |
| KI-02 | Lima barang terlaris setiap bulan | Menampilkan lima barang dengan jumlah penjualan terbanyak. |
| KI-03 | Daftar barang dengan stok rendah | Menampilkan barang yang stoknya di bawah batas minimum. |
| KI-04 | Sepuluh anggota paling aktif setiap bulan | Menampilkan anggota dengan total belanja terbesar. |

## 7. Matriks CRUDS

Matriks CRUDS menunjukkan tindakan pada data dalam setiap proses bisnis. C berarti Create, R berarti Read, U berarti Update, D berarti Delete, dan S berarti Search.

| Proses Bisnis | Anggota | Barang | Petugas | Penjualan | Detail Penjualan | Pemasok | Pembelian | Detail Pembelian |
|---|---|---|---|---|---|---|---|---|
| PB-01 Pendaftaran anggota | C | - | R | - | - | - | - | - |
| PB-02 Pencatatan penjualan | R, S | R, S, U | R | C | C | - | - | - |
| PB-03 Pemesanan barang | - | R, S | R | - | - | R, S | C | C |
| PB-04 Penerimaan barang | - | U | R | - | - | R, S | R, U | R |
| PB-05 Laporan bulanan | R | R | R | R | R | - | R | R |

Keterangan:
- C (Create): menambahkan data baru.
- R (Read): membaca atau menampilkan data.
- U (Update): memperbarui data.
- D (Delete): menghapus data.
- S (Search): mencari data berdasarkan kriteria tertentu.
- Tanda (-) berarti tidak ada tindakan utama pada entitas tersebut dalam proses terkait.

## 8. Kamus Data Awal

| Elemen | Arti | Contoh | Aturan | Penanggung Jawab |
|---|---|---|---|---|
| `no_anggota` | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua |
| `nim_anggota` | NIM anggota | 2301010123 | Unik, 10 digit | Ketua |
| `no_hp_anggota` | Nomor HP anggota | 0812xxxx | Data pribadi, akses terbatas | Ketua |
| `no_nota_penjualan` | Nomor nota penjualan | PJ-2609-0142 | Unik per nota | Kasir |
| `harga_satuan_detail_penjualan` | Harga jual saat transaksi | 4000 | Bilangan bulat ≥ 0 (rupiah) | Kasir |
| `stok_barang` | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | Petugas gudang |

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