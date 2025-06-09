-- Kiểm tra ngân hàng có đủ câu hỏi để tạo đề thi hay không 
SELECT 
    p.MaPhanThi,
    p.TenPhanThi,
    p.SoCauHoi AS SoCauHoiYeuCau,
    COUNT(n.MaCauHoi) AS SoCauHoiThucTe,
    (p.SoCauHoi * 1.2) AS SoCauHoiToiThieu,
    CASE 
        WHEN COUNT(n.MaCauHoi) >= (p.SoCauHoi * 1.2) THEN 'Đạt yêu cầu'
        ELSE 'Không đạt yêu cầu'
    END AS TrangThai
FROM PhanThi p
JOIN MonHoc m ON p.MaMonHoc = m.MaMonHoc
JOIN DeThi d ON m.MaMonHoc = d.MaMonHoc
LEFT JOIN NganHangCauHoi n ON p.MaPhanThi = n.MaPhanThi
WHERE d.MaDeThi = 1 -- Thay 1 bằng MaDeThi cần truy vấn
GROUP BY p.MaPhanThi, p.TenPhanThi, p.SoCauHoi
HAVING SoCauHoiThucTe < (p.SoCauHoi * 1.2);