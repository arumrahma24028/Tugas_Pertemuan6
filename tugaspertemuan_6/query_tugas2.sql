-- =======================
-- TABEL KATEGORI BUKU
-- =======================
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==================
--  TABEL PENERBIT
-- ==================
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==================
--  TABEL RAK
-- ==================
CREATE TABLE rak (
    id_rak INT AUTO_INCREMENT PRIMARY KEY,
    kode_rak VARCHAR(20) NOT NULL,
    lokasi VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at DATETIME DEFAULT NULL
);


-- =======================
--  INSERT DATA KATEGORI
-- =======================
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming', 'Buku pemrograman'),
('Database', 'Buku database'),
('Jaringan', 'Buku jaringan komputer'),
('Desain', 'Buku desain grafis'),
('Bisnis', 'Buku bisnis dan manajemen');

-- =======================
--  INSERT DATA PENERBIT
-- =======================
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika', 'Bandung', '0811111111', 'info@informatika.com'),
('Elex Media', 'Jakarta', '0822222222', 'elex@media.com'),
('Gramedia', 'Jakarta', '0833333333', 'gramedia@mail.com'),
('Andi ', 'Yogyakarta', '0844444444', 'andi@mail.com'),
('Deepublish', 'Yogyakarta', '0855555555', 'deepublish@mail.com');

-- =========================================
-- INSERT DATA TABEL RAK
-- =========================================
INSERT INTO rak (kode_rak, lokasi) VALUES
('R001', 'Lantai 1 - Dekat Pintu Masuk'),
('R002', 'Lantai 1 - Area Programming'),
('R003', 'Lantai 1 - Area Database'),
('R004', 'Lantai 2 - Area Jaringan'),
('R005', 'Lantai 2 - Area Desain'),
('R006', 'Lantai 2 - Area Bisnis'),
('R007', 'Lantai 3 - Rak Referensi'),
('R008', 'Lantai 3 - Arsip Lama');

-- =============
--  QUERY JOIN
-- =============
SELECT 
    b.judul,
    k.nama_kategori,
    p.nama_penerbit,
    r.kode_rak,
    r.lokasi
FROM buku b
LEFT JOIN kategori_buku k ON b.id_kategori = k.id_kategori
LEFT JOIN penerbit p ON b.id_penerbit = p.id_penerbit
LEFT JOIN rak r ON b.id_rak = r.id_rak;