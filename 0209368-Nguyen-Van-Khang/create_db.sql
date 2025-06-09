CREATE DATABASE IF NOT EXISTS HeThongThi;
USE HeThongThi;
-- Bảng MonHoc
CREATE TABLE MonHoc (
    MaMonHoc INT AUTO_INCREMENT PRIMARY KEY,
    TenMonHoc VARCHAR(100) NOT NULL,
    MoTa TEXT
);
-- Bảng ModuleDanhGia
CREATE TABLE ModuleDanhGia (
    MaModuleDanhGia INT AUTO_INCREMENT PRIMARY KEY,
    TenModuleDanhGia VARCHAR(100) NOT NULL,
    MaMonHoc INT NOT NULL,
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);

-- Bảng Chuong
CREATE TABLE Chuong (
    MaChuong INT AUTO_INCREMENT PRIMARY KEY,
    TenChuong VARCHAR(100),
    MaModuleDanhGia INT NOT NULL,
    SoCauHoi INT NOT NULL,
    FOREIGN KEY (MaModuleDanhGia) REFERENCES ModuleDanhGia(MaModuleDanhGia)
);

-- Bảng DeThi
CREATE TABLE DeThi (
    MaDeThi INT AUTO_INCREMENT PRIMARY KEY,
    MaMonHoc INT NOT NULL,
    NgayThi DATE NOT NULL,
    ThoiLuong INT NOT NULL,
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);

-- Bảng SinhVien
CREATE TABLE SinhVien (
    MaSinhVien INT AUTO_INCREMENT PRIMARY KEY,
    Ten VARCHAR(50) NOT NULL,
    Ho VARCHAR(50) NOT NULL
);

-- Bảng PhienThi
CREATE TABLE PhienThi (
    MaPhienThi INT AUTO_INCREMENT PRIMARY KEY,
    MaDeThi INT NOT NULL,
    MaSinhVien INT NOT NULL,
    NgayTao DATETIME NOT NULL,
    FOREIGN KEY (MaDeThi) REFERENCES DeThi(MaDeThi),
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien)
);

-- Bảng PhanThi
CREATE TABLE PhanThi (
    MaPhanThi INT AUTO_INCREMENT PRIMARY KEY,
    MaMonHoc INT NOT NULL,
    TenPhanThi VARCHAR(100) NOT NULL,
    SoCauHoi INT NOT NULL,
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);

-- Bảng NganHangCauHoi
CREATE TABLE NganHangCauHoi (
    MaCauHoi INT AUTO_INCREMENT PRIMARY KEY,
    MaPhanThi INT NOT NULL,
    NoiDungCauHoi TEXT NOT NULL,
    LoaiCauHoi ENUM('Single', 'Multiple') NOT NULL,
    FOREIGN KEY (MaPhanThi) REFERENCES PhanThi(MaPhanThi)
);

-- Bảng LuaChonTraLoi
CREATE TABLE LuaChonTraLoi (
    MaLuaChon INT AUTO_INCREMENT PRIMARY KEY,
    MaCauHoi INT NOT NULL,
    NoiDungLuaChon TEXT NOT NULL,
    LaDung BOOLEAN NOT NULL,
    FOREIGN KEY (MaCauHoi) REFERENCES NganHangCauHoi(MaCauHoi)
);
-- Bảng trung gian DeThiCauHoi
CREATE TABLE DeThiCauHoi (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MaDeThi INT NOT NULL,
    MaCauHoi INT NOT NULL,
    FOREIGN KEY (MaDeThi) REFERENCES DeThi(MaDeThi),
    FOREIGN KEY (MaCauHoi) REFERENCES NganHangCauHoi(MaCauHoi)
);

