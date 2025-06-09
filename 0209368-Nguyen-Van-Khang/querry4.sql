-- Kiểm tra các câu hỏi trong đề thi có đáp ứng yêu cầu về đáp án hay không 
SELECT 
    n.MaCauHoi,
    n.NoiDungCauHoi,
    COUNT(l.MaLuaChon) AS SoLuongLuaChon,
    SUM(CASE WHEN l.LaDung = TRUE THEN 1 ELSE 0 END) AS SoDapAnDung,
    CASE 
        WHEN COUNT(l.MaLuaChon) < 2 THEN 'Không đủ 2 lựa chọn'
        WHEN SUM(CASE WHEN l.LaDung = TRUE THEN 1 ELSE 0 END) < 1 THEN 'Không có đáp án đúng'
        ELSE 'Đạt yêu cầu'
    END AS TrangThai
FROM NganHangCauHoi n
LEFT JOIN LuaChonTraLoi l ON n.MaCauHoi = l.MaCauHoi
GROUP BY n.MaCauHoi, n.NoiDungCauHoi
HAVING SoLuongLuaChon < 2 OR SoDapAnDung < 1;