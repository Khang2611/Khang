USE HeThongThi;

-- Môn học
INSERT INTO MonHoc (TenMonHoc, MoTa) VALUES
('Cơ sở dữ liệu', 'Học về lý thuyết và thực hành CSDL');

-- Module đánh giá
INSERT INTO ModuleDanhGia (TenModuleDanhGia, MaMonHoc) VALUES
('Module 1', 1);

-- Chương
INSERT INTO Chuong (TenChuong, MaModuleDanhGia, SoCauHoi) VALUES
('Chương 1', 1, 5);

-- Đề thi
INSERT INTO DeThi (MaMonHoc, NgayThi, ThoiLuong) VALUES
(1, '2025-06-01', 90);

-- Sinh viên
INSERT INTO SinhVien (Ten, Ho) VALUES
('An', 'Nguyen');

-- Phiên thi
INSERT INTO PhienThi (MaDeThi, MaSinhVien, NgayTao) VALUES
(1, 1, NOW());

-- Phần thi
INSERT INTO PhanThi (MaMonHoc, TenPhanThi, SoCauHoi) VALUES
(1, 'Phần 1', 5),
(1, 'Phần 2', 10); -- dùng cho test truy vấn 3

-- Ngân hàng câu hỏi (phần 1 có 3 câu hỏi, phần 2 có 13 câu hỏi)
INSERT INTO NganHangCauHoi (MaPhanThi, NoiDungCauHoi, LoaiCauHoi) VALUES
-- Phần 1 (ID 1): đủ dùng cho test querry1
(1, 'Câu hỏi 1 phần 1', 'Single'),
(1, 'Câu hỏi 2 phần 1', 'Single'),
(1, 'Câu hỏi 3 phần 1', 'Single'),

-- Phần 2 (ID 2): 13 câu hỏi để test querry3 (120% của 10)
(2, 'Câu hỏi 1 phần 2', 'Single'),
(2, 'Câu hỏi 2 phần 2', 'Single'),
(2, 'Câu hỏi 3 phần 2', 'Single'),
(2, 'Câu hỏi 4 phần 2', 'Single'),
(2, 'Câu hỏi 5 phần 2', 'Single'),
(2, 'Câu hỏi 6 phần 2', 'Single'),
(2, 'Câu hỏi 7 phần 2', 'Single'),
(2, 'Câu hỏi 8 phần 2', 'Single'),
(2, 'Câu hỏi 9 phần 2', 'Single'),
(2, 'Câu hỏi 10 phần 2', 'Single'),
(2, 'Câu hỏi 11 phần 2', 'Single'),
(2, 'Câu hỏi 12 phần 2', 'Single'),
(2, 'Câu hỏi 13 phần 2', 'Single');
INSERT INTO LuaChonTraLoi (MaCauHoi, NoiDungLuaChon, LaDung) VALUES
(1, 'A. Chỉ 1 lựa chọn', TRUE);

-- Câu hỏi 2: có 2 lựa chọn nhưng đều sai => sai
INSERT INTO LuaChonTraLoi (MaCauHoi, NoiDungLuaChon, LaDung) VALUES
(2, 'A. Sai', FALSE),
(2, 'B. Cũng sai', FALSE);

-- Câu hỏi 3: 2 lựa chọn, 1 đúng => đạt yêu cầu
INSERT INTO LuaChonTraLoi (MaCauHoi, NoiDungLuaChon, LaDung) VALUES
(3, 'A. Sai', FALSE),
(3, 'B. Đúng', TRUE);

-- Gán các câu hỏi vào đề thi (test querry2)
-- Lặp câu hỏi 3 hai lần
INSERT INTO DeThiCauHoi (MaDeThi, MaCauHoi) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 3);
