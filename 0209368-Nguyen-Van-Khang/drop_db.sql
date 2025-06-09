	-- Xóa các bảng trong cơ sở dữ liệu HeThongThi theo thứ tự phụ thuộc
USE HeThongThi;
-- Xóa bảng trung gian trước
DROP TABLE IF EXISTS DeThiCauHoi;
-- Xóa bảng con
DROP TABLE IF EXISTS LuaChonTraLoi;
DROP TABLE IF EXISTS NganHangCauHoi;
DROP TABLE IF EXISTS PhienThi;
DROP TABLE IF EXISTS ChiTietDeThi;
-- Xóa bảng trung gian và bảng liên quan
DROP TABLE IF EXISTS DeThi;
DROP TABLE IF EXISTS PhanThi;
DROP TABLE IF EXISTS Chuong;
-- Xóa bảng gốc
DROP TABLE IF EXISTS ModuleDanhGia;
DROP TABLE IF EXISTS SinhVien;
DROP TABLE IF EXISTS MonHoc;
