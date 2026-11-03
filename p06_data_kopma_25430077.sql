USE kopma_077;

-- =========================================
-- D.1 MEMASUKKAN DATA PETUGAS
-- =========================================

INSERT INTO petugas (
    kode_petugas,
    nama_petugas,
    peran_petugas
) VALUES
('K01', 'Dimas', 'kasir'),
('K02', 'Sari', 'kasir'),
('K03', 'Rina', 'kasir'),
('G01', 'Joko', 'gudang'),
('P01', 'Ketua Kopma', 'ketua');


-- =========================================
-- D.1 MEMASUKKAN DATA BARANG
-- =========================================

INSERT INTO barang (
    kode_barang,
    nama_barang,
    kategori_barang,
    harga_jual_barang,
    stok_barang,
    stok_min_barang
) VALUES
('B001', 'Buku Tulis', 'ATK', 5000, 20, 5),
('B002', 'Pulpen', 'ATK', 3000, 15, 5),
('ATK-001', 'Duplikat', 'ATK', 1000, 3, 1),
('UJI-NEG', 'Uji Stok Minimum', 'ATK', 1000, 0, 1);


-- =========================================
-- D.1 MEMASUKKAN DATA ANGGOTA
-- =========================================

INSERT INTO anggota (
    no_anggota,
    nim_anggota,
    nama_anggota,
    prodi_anggota,
    status_anggota,
    tgl_daftar_anggota
) VALUES
('A-0001', '2543001101', 'Andi Saputra',
 'Ilmu Komputer', 'aktif', '2025-01-10'),

('A-0002', '2543001202', 'Siti Rahma',
 'Sistem Informasi', 'aktif', '2025-02-15'),

('A-0003', '2543001303', 'Budi Santoso',
 'Ilmu Komputer', 'nonaktif', '2024-08-20');


-- =========================================
-- D.1 MEMASUKKAN DATA PEMASOK
-- =========================================

INSERT INTO pemasok (
    nama_pemasok,
    telepon_pemasok,
    alamat_pemasok
) VALUES
('CV Sumber ATK', '081234567804', 'Bandar Lampung'),
('PT Berkah Sejahtera', '081234567805', 'Lampung Selatan');


-- =========================================
-- D.2 MEMBUAT NOTA PENJUALAN
-- =========================================

INSERT INTO penjualan (
    no_nota_penjualan,
    tgl_penjualan,
    id_petugas,
    id_anggota,
    bayar_penjualan
)
SELECT
    'PJ-2609-0142',
    '2026-09-24 10:15:00',
    p.id_petugas,
    a.id_anggota,
    30000
FROM petugas p
CROSS JOIN anggota a
WHERE p.kode_petugas = 'K03'
  AND a.no_anggota = 'A-0001';


-- =========================================
-- D.2 MENAMBAHKAN DETAIL NOTA
-- =========================================

-- Detail barang pertama: B001
INSERT INTO detail_penjualan (
    id_penjualan,
    id_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
SELECT
    p.id_penjualan,
    b.id_barang,
    2,
    b.harga_jual_barang
FROM penjualan p
JOIN barang b ON b.kode_barang = 'B001'
WHERE p.no_nota_penjualan = 'PJ-2609-0142';


-- Detail barang kedua: B002
INSERT INTO detail_penjualan (
    id_penjualan,
    id_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
SELECT
    p.id_penjualan,
    b.id_barang,
    2,
    b.harga_jual_barang
FROM penjualan p
JOIN barang b ON b.kode_barang = 'B002'
WHERE p.no_nota_penjualan = 'PJ-2609-0142';


-- Detail barang ketiga: ATK-001
INSERT INTO detail_penjualan (
    id_penjualan,
    id_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
SELECT
    p.id_penjualan,
    b.id_barang,
    3,
    b.harga_jual_barang
FROM penjualan p
JOIN barang b ON b.kode_barang = 'ATK-001'
WHERE p.no_nota_penjualan = 'PJ-2609-0142';


-- =========================================
-- D.2 MENGURANGI STOK BARANG
-- =========================================

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'B001';

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'B002';

UPDATE barang
SET stok_barang = stok_barang - 3
WHERE kode_barang = 'ATK-001';