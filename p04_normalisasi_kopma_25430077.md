### D.1 Dari UNF ke 1NF

**1. Menulis Relasi dalam Bentuk UNF**

Bentuk UNF digunakan untuk menggambarkan struktur nota penjualan yang masih memiliki grup berulang pada bagian barang. Satu nota dapat berisi beberapa jenis barang.

```text
NOTA_UNF (
    no_nota_penjualan,
    tgl_penjualan,
    kode_petugas,
    nama_petugas,
    no_anggota,
    nama_anggota,
    {
        kode_barang,
        nama_barang,
        qty_detail_penjualan,
        harga_satuan_detail_penjualan,
        subtotal_detail_penjualan
    },
    jumlah_penjualan,
    diskon_penjualan,
    total_penjualan
)
```

**2. Mengubah UNF menjadi 1NF**

Pada tahap ini, grup ber    ulang pada data barang dihilangkan. Setiap baris hanya berisi satu barang dalam satu nota penjualan. Jika satu nota berisi beberapa jenis barang, nomor nota akan muncul kembali pada beberapa baris.

Struktur relasinya menjadi:

```text
NOTA_1NF (
    no_nota_penjualan,
    kode_barang,
    tgl_penjualan,
    kode_petugas,
    nama_petugas,
    no_anggota,
    nama_anggota,
    nama_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan,
    subtotal_detail_penjualan,
    jumlah_penjualan,
    diskon_penjualan,
    total_penjualan
)
```

**Kunci utama (Primary Key):**

```text
(no_nota_penjualan, kode_barang)
```

Kunci utama menggunakan gabungan nomor nota dan kode barang karena satu nota dapat berisi beberapa barang, sedangkan satu barang dapat muncul pada banyak nota yang berbeda.

## D2. Menuliskan Dependensi Fungsional

Dependensi fungsional ditentukan berdasarkan aturan bisnis yang sudah dibuat pada Modul 2. Dependensi ini digunakan untuk mengetahui hubungan antaratribut dan menjadi dasar dalam proses normalisasi tabel.

| Kode FD | Dependensi Fungsional | Dasar |
|---|---|---|
| FD1 | `no_nota_penjualan → tgl_penjualan, kode_petugas, no_anggota` | AB-01 |
| FD2 | `kode_petugas → nama_petugas` | Identitas petugas |
| FD3 | `no_anggota → nama_anggota` | AB-05 |
| FD4 | `kode_barang → nama_barang` | Identitas barang |
| FD5 | `(no_nota_penjualan, kode_barang) → qty_detail_penjualan, harga_satuan_detail_penjualan` | AB-04 |
| FD6 | `(qty_detail_penjualan, harga_satuan_detail_penjualan) → subtotal_detail_penjualan` | Nilai turunan hasil perhitungan |

**Keterangan:**
- FD1: Satu nomor nota menentukan tanggal transaksi, petugas yang melayani, dan anggota yang berbelanja jika ada.
- FD2: Setiap kode petugas menunjukkan satu nama petugas.
- FD3: Nomor anggota menentukan identitas nama anggota.
- FD4: Kode barang menentukan nama barang.
- FD5: Nomor nota bersama kode barang menentukan jumlah dan harga satuan barang pada transaksi tersebut.
- FD6: Jumlah barang dan harga satuan digunakan untuk menghitung subtotal.

### D3. Menuju 2NF dan 3NF

#### 1. Hasil Normalisasi 2NF

Pada tahap 2NF, relasi `NOTA_1NF` dipisahkan menjadi tiga relasi:

- **PENJUALAN** (`no_nota_penjualan`, tgl_penjualan, kode_petugas, no_anggota)
- **BARANG** (`kode_barang`, nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)
- **DETAIL_PENJUALAN** (`no_nota_penjualan`, `kode_barang`, qty_detail_penjualan, harga_satuan_detail_penjualan)

Pemisahan dilakukan karena tanggal dan identitas petugas serta anggota bergantung pada nomor nota, sedangkan nama barang bergantung pada kode barang. Jumlah dan harga satuan saat transaksi bergantung pada gabungan nomor nota dan kode barang.

#### 2. Hasil Normalisasi 3NF

Pada tahap 3NF, tabel penjualan masih memiliki ketergantungan transitif melalui kode petugas dan nomor anggota. Oleh karena itu, data petugas dan anggota dipisahkan ke tabel masing-masing.

Hasil relasinya menjadi:

- **PENJUALAN** (`no_nota_penjualan`, tgl_penjualan, kode_petugas, no_anggota, bayar_penjualan)
- **DETAIL_PENJUALAN** (`no_nota_penjualan`, `kode_barang`, qty_detail_penjualan, harga_satuan_detail_penjualan)
- **BARANG** (`kode_barang`, nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)
- **PETUGAS** (`kode_petugas`, nama_petugas, peran_petugas)
- **ANGGOTA** (`no_anggota`, nim_anggota, nama_anggota, prodi_anggota, no_hp_anggota, status_anggota, tgl_daftar_anggota)

Keterangan:
- Atribut yang ditulis pertama pada tabel merupakan kunci primer, kecuali pada `DETAIL_PENJUALAN` yang menggunakan kunci primer gabungan.
- `kode_petugas` dan `no_anggota` pada tabel penjualan menjadi kunci tamu.
- `no_nota_penjualan` dan `kode_barang` pada tabel detail penjualan menjadi kunci tamu yang sekaligus membentuk kunci primer gabungan.

#### 3. Penyimpanan Nilai Turunan

Subtotal dihitung dari jumlah barang dikalikan harga satuan saat transaksi. Jumlah penjualan dan total pembayaran juga dapat dihitung dari detail transaksi serta potongan yang berlaku. Karena itu, nilai turunan tidak perlu disimpan sebagai data operasional jika dapat dihitung kembali. Harga satuan saat transaksi tetap disimpan agar riwayat harga tidak berubah ketika harga barang diperbarui.

## D4. Mencocokkan dengan Skema Kanonik

### 1. Perbandingan dengan Skema Kanonik

Skema kanonik pada buku praktikum menggunakan **surrogate key**, yaitu kolom `id_*` sebagai kunci primer. Kode alami, seperti no_nota_penjualan dan kode_barang, tetap digunakan sebagai kunci unik agar data tidak memiliki identitas ganda.

Berikut hasil pencocokan skema Kopma dengan Tabel 4.2 pada buku praktikum.

| Tabel | Primary Key (PK) | Unique Key | Foreign Key (FK) |
|---|---|---|---|
| `petugas` | `id_petugas` | `kode_petugas` | - |
| `anggota` | `id_anggota` | `no_anggota`, `nim_anggota` | - |
| `barang` | `id_barang` | `kode_barang` | - |
| `pemasok` | `id_pemasok` | - | - |
| `penjualan` | `id_penjualan` | `no_nota_penjualan` | `id_petugas`, `id_anggota` (boleh NULL) |
| `detail_penjualan` | `id_penjualan`, `id_barang` | - | `id_penjualan`, `id_barang` |
| `pembelian` | `id_pembelian` | - | `id_pemasok` |
| `detail_pembelian` | `id_pembelian`, `id_barang` | - | `id_pembelian`, `id_barang` |

Keterangan: NULL pada id_anggota berarti transaksi penjualan tetap dapat dilakukan oleh pembeli yang bukan anggota. Pada tabel detail, kunci primer terdiri dari dua kolom karena satu transaksi dapat berisi beberapa barang.

### 2. Pemeriksaan BCNF

BCNF (Boyce-Codd Normal Form) merupakan bentuk normal yang mengharuskan setiap penentu dalam dependensi fungsional merupakan kunci kandidat.

| Tabel | Hasil Pemeriksaan | Alasan |
|---|---|---|
| `petugas` | Memenuhi BCNF | `id_petugas` dan `kode_petugas` masing-masing dapat mengidentifikasi satu petugas. |
| `anggota` | Memenuhi BCNF | `id_anggota`, `no_anggota`, dan `nim_anggota` dapat mengidentifikasi satu anggota karena kunci-kunci tersebut unik. |
| `barang` | Memenuhi BCNF | `id_barang` dan `kode_barang` dapat mengidentifikasi satu barang. |
| `pemasok` | Memenuhi BCNF | `id_pemasok` menjadi kunci untuk mengidentifikasi pemasok. |
| `penjualan` | Memenuhi BCNF | `id_penjualan` dan `no_nota_penjualan` dapat mengidentifikasi satu transaksi penjualan. |
| `detail_penjualan` | Memenuhi BCNF | Gabungan `id_penjualan` dan `id_barang` mengidentifikasi satu detail penjualan. |
| `pembelian` | Memenuhi BCNF | `id_pembelian` mengidentifikasi satu transaksi pembelian. |
| `detail_pembelian` | Memenuhi BCNF | Gabungan `id_pembelian` dan `id_barang` mengidentifikasi satu detail pembelian. |

Berdasarkan pemeriksaan terhadap dependensi fungsional yang telah ditentukan, seluruh tabel pada skema kanonik memenuhi BCNF. Kesimpulan ini berlaku selama tidak ada dependensi fungsional tambahan yang membuat atribut nonkunci menjadi penentu atribut lain.
