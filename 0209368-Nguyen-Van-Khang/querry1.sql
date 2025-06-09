-- số câu hỏi liên kết trong 1 đề thi 
SELECT 
    p.MaPhanThi,
    p.TenPhanThi,
    COUNT(n.MaCauHoi) AS SoCauHoiThucTe
FROM PhanThi p
LEFT JOIN NganHangCauHoi n ON p.MaPhanThi = n.MaPhanThi
WHERE p.MaPhanThi = 1 -- Thay 1 bằng MaPhanThi cần truy vấn
GROUP BY p.MaPhanThi, p.TenPhanThi;