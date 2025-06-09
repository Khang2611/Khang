-- Kiểm tra câu hỏi bị trùng lặp trong 1 đề thi 
SELECT 
    dc.MaDeThi,
    dc.MaCauHoi,
    n.NoiDungCauHoi,
    COUNT(dc.MaCauHoi) AS SoLanXuatHien
FROM DeThiCauHoi dc
JOIN NganHangCauHoi n ON dc.MaCauHoi = n.MaCauHoi
WHERE dc.MaDeThi = 1 -- Thay 1 bằng MaDeThi cần truy vấn
GROUP BY dc.MaDeThi, dc.MaCauHoi, n.NoiDungCauHoi
HAVING SoLanXuatHien > 1;