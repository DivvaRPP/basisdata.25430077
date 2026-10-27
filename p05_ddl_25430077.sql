-- Modul 5: DDL Sistem Informasi Akademik
-- NIM: 25430077
-- Proyek: DIVRA Technologies

CREATE DATABASE IF NOT EXISTS akad_077;
USE akad_077;

-- Menghapus tabel dari anak ke induk agar FK tidak menghalangi.
DROP TABLE IF EXISTS nilai;
DROP TABLE IF EXISTS detail_krs;
DROP TABLE IF EXISTS krs;
DROP TABLE IF EXISTS kelas_kuliah;
DROP TABLE IF EXISTS semester;
DROP TABLE IF EXISTS dosen;
DROP TABLE IF EXISTS mata_kuliah;
DROP TABLE IF EXISTS mahasiswa;

-- AB-01: Setiap mahasiswa memiliki NIM yang berbeda.
CREATE TABLE mahasiswa (
    NIM VARCHAR(20) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    no_hp VARCHAR(20),
    CONSTRAINT pk_mahasiswa PRIMARY KEY (NIM)
) ENGINE=InnoDB;

-- AB-02: Setiap mata kuliah memiliki kode yang berbeda.
CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(20) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL,
    sks TINYINT UNSIGNED NOT NULL,
    CONSTRAINT pk_mata_kuliah PRIMARY KEY (kode_mk)
) ENGINE=InnoDB;

-- Data dosen digunakan untuk mengelola pengajar kelas kuliah.
CREATE TABLE dosen (
    nidn VARCHAR(20) NOT NULL,
    nama_dosen VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dosen PRIMARY KEY (nidn)
) ENGINE=InnoDB;

-- Data semester digunakan untuk mengelompokkan kegiatan akademik.
CREATE TABLE semester (
    id_semester INT NOT NULL AUTO_INCREMENT,
    tahun_ajaran VARCHAR(20) NOT NULL,
    semester_ke ENUM('Ganjil', 'Genap') NOT NULL,
    CONSTRAINT pk_semester PRIMARY KEY (id_semester)
) ENGINE=InnoDB;

-- AB-03: Mata kuliah dapat dibuka sebagai kelas pada semester tertentu.
-- AB-04: Setiap kelas harus memiliki mata kuliah, dosen, dan semester.
CREATE TABLE kelas_kuliah (
    id_kelas INT NOT NULL AUTO_INCREMENT,
    kode_mk VARCHAR(20) NOT NULL,
    nidn VARCHAR(20) NOT NULL,
    id_semester INT NOT NULL,

    CONSTRAINT pk_kelas_kuliah PRIMARY KEY (id_kelas),

    -- AB-03 dan AB-04: Kelas harus terhubung dengan mata kuliah.
    CONSTRAINT fk_kelas_kuliah_mata_kuliah
        FOREIGN KEY (kode_mk)
        REFERENCES mata_kuliah(kode_mk),

    -- AB-04: Kelas harus memiliki dosen.
    CONSTRAINT fk_kelas_kuliah_dosen
        FOREIGN KEY (nidn)
        REFERENCES dosen(nidn),

    -- AB-03 dan AB-04: Kelas harus memiliki semester.
    CONSTRAINT fk_kelas_kuliah_semester
        FOREIGN KEY (id_semester)
        REFERENCES semester(id_semester)
) ENGINE=InnoDB;

-- AB-05: Mahasiswa mengisi KRS untuk semester tertentu.
CREATE TABLE krs (
    id_krs INT NOT NULL AUTO_INCREMENT,
    NIM VARCHAR(20) NOT NULL,
    id_semester INT NOT NULL,
    tanggal_pengisian DATE NOT NULL,

    CONSTRAINT pk_krs PRIMARY KEY (id_krs),

    -- AB-05: KRS harus terhubung dengan mahasiswa.
    CONSTRAINT fk_krs_mahasiswa
        FOREIGN KEY (NIM)
        REFERENCES mahasiswa(NIM),

    -- AB-05: KRS harus terhubung dengan semester.
    CONSTRAINT fk_krs_semester
        FOREIGN KEY (id_semester)
        REFERENCES semester(id_semester)
) ENGINE=InnoDB;

-- AB-06: Kelas yang sama tidak boleh dipilih dua kali dalam satu KRS.
-- P = (77 MOD 9) + 1 = 6, sehingga P+2 = 8 kelas.
-- Batas maksimal 8 kelas perlu ditangani pada Modul 14;
-- CHECK biasa tidak dapat membatasi jumlah baris dalam satu KRS.
CREATE TABLE detail_krs (
    id_krs INT NOT NULL,
    id_kelas INT NOT NULL,
    tanggal_pemilihan DATE,

    -- PK gabungan mencegah kelas yang sama tercatat dua kali
    -- pada KRS yang sama.
    CONSTRAINT pk_detail_krs PRIMARY KEY (id_krs, id_kelas),

    -- AB-06: Detail harus terhubung dengan KRS.
    CONSTRAINT fk_detail_krs_krs
        FOREIGN KEY (id_krs)
        REFERENCES krs(id_krs),

    -- AB-06: Detail harus terhubung dengan kelas kuliah.
    CONSTRAINT fk_detail_krs_kelas_kuliah
        FOREIGN KEY (id_kelas)
        REFERENCES kelas_kuliah(id_kelas)
) ENGINE=InnoDB;

-- AB-07: Nilai hanya untuk kelas yang tercatat pada detail KRS.
-- AB-08: Pencatatan nilai setelah penilaian selesai memerlukan
-- pengendalian proses aplikasi atau mekanisme lanjutan.
CREATE TABLE nilai (
    id_krs INT NOT NULL,
    id_kelas INT NOT NULL,
    nilai_akhir DECIMAL(5,2),

    CONSTRAINT pk_nilai PRIMARY KEY (id_krs, id_kelas),

    -- AB-07: Nilai harus merujuk pada kelas yang dipilih
    -- dalam KRS mahasiswa.
    CONSTRAINT fk_nilai_detail_krs
        FOREIGN KEY (id_krs, id_kelas)
        REFERENCES detail_krs(id_krs, id_kelas)
) ENGINE=InnoDB;

-- AB-09: Total SKS dihitung dari SKS mata kuliah yang dipilih,
-- sehingga total SKS tidak disimpan sebagai kolom tetap pada KRS.