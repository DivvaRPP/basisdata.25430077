-- KI-03: Barang yang perlu dipesan ulang
-- Pertanyaan: Barang apa saja yang stoknya di bawah stok minimum?
-- Hasil yang diharapkan: Menampilkan barang dengan stok kurang
-- dari batas minimum, beserta jumlah kekurangannya.

SELECT kode_barang, nama_barang, stok_barang, stok_min_barang,
       stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_barang < stok_min_barang
ORDER BY kurang DESC;

-- D.1: Menampilkan barang kategori ATK atau minuman
SELECT kode_barang, nama_barang, kategori_barang, harga_jual_barang
FROM barang
WHERE kategori_barang IN ('ATK', 'minuman')
ORDER BY kategori_barang, nama_barang;

-- D.1: Menampilkan penjualan pada rentang tanggal September 2026
SELECT no_nota_penjualan, tgl_penjualan, id_anggota, bayar_penjualan
FROM penjualan
WHERE tgl_penjualan BETWEEN '2026-09-01 00:00:00'
                        AND '2026-09-30 23:59:59'
ORDER BY tgl_penjualan;

-- D.1: Menampilkan anggota yang belum memiliki nomor HP
SELECT no_anggota, nama_anggota, no_hp_anggota
FROM anggota
WHERE no_hp_anggota IS NULL
ORDER BY nama_anggota;

-- Titik Analisis 1: Menguji penggunaan alias pada WHERE
SELECT kode_barang, nama_barang, stok_barang, stok_min_barang,
       stok_min_barang - stok_barang AS kurang
FROM barang
WHERE kurang > 0
ORDER BY kurang DESC;

-- Titik Analisis 1: Perbaikan penggunaan alias pada WHERE
SELECT kode_barang, nama_barang, stok_barang, stok_min_barang,
       stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_min_barang - stok_barang > 0
ORDER BY kurang DESC;

-- D.2: Mencari anggota yang namanya mengandung huruf a
SELECT CONCAT(nama_anggota, ' (', no_anggota, ')') AS anggota,
       DATE_FORMAT(tgl_daftar_anggota, '%d-%m-%Y') AS tgl_daftar,
       IFNULL(no_hp_anggota, '-') AS hp,
       CASE status_anggota
           WHEN 'aktif' THEN 'Diskon 5%'
           ELSE 'Tanpa diskon'
       END AS keterangan
FROM anggota
WHERE nama_anggota LIKE '%a%'
ORDER BY tgl_daftar_anggota DESC
LIMIT 5;

-- Titik Analisis 2: Menguji penggunaan = NULL
SELECT no_anggota, nama_anggota, no_hp_anggota
FROM anggota
WHERE no_hp_anggota = NULL;

-- Titik Analisis 2: Perbaikan penggunaan NULL
SELECT no_anggota, nama_anggota, no_hp_anggota
FROM anggota
WHERE no_hp_anggota IS NULL;

-- D.3: Menghitung lama keanggotaan anggota
SELECT no_anggota, nama_anggota, tgl_daftar_anggota,
       DATEDIFF(CURDATE(), tgl_daftar_anggota) AS lama_hari,
       CASE
           WHEN DATEDIFF(CURDATE(), tgl_daftar_anggota) < 180
           THEN 'Baru'
           ELSE 'Lama'
       END AS kategori
FROM anggota
ORDER BY lama_hari DESC;

-- D.3: Menghitung subtotal setiap barang dalam nota penjualan
SELECT p.no_nota_penjualan,
       b.kode_barang,
       b.nama_barang,
       d.qty_detail_penjualan,
       d.harga_satuan_detail_penjualan,
       d.qty_detail_penjualan * d.harga_satuan_detail_penjualan AS subtotal
FROM detail_penjualan d
JOIN penjualan p ON d.id_penjualan = p.id_penjualan
JOIN barang b ON d.id_barang = b.id_barang
WHERE p.no_nota_penjualan = 'PJ-2609-0142';