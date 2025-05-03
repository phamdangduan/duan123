IF EXISTS (SELECT * FROM sys.databases WHERE name = 'baicotrang')
	BEGIN
		USE master
		ALTER DATABASE baicotrang SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE baicotrang
	END
CREATE DATABASE baicotrang
GO
USE baicotrang
GO
CREATE TABLE LOP (
    MALOP VARCHAR(3) PRIMARY KEY,
    TENLOP NVARCHAR(50),
    SISO INT
);
CREATE TABLE SINHVIEN (
    MASV VARCHAR(4) PRIMARY KEY,
    TENSV NVARCHAR(50),
    NGSINH DATE
);
CREATE TABLE SINHVIEN_LOPHOC (
    MASV VARCHAR(4),
    MALOP VARCHAR(3),
    PRIMARY KEY (MASV, MALOP),
    FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV)
		on delete cascade
		on update cascade,
    FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
		on delete cascade
		on update cascade
);

-- Thêm d? li?u vào b?ng LOP
INSERT INTO LOP (MALOP, TENLOP, SISO) VALUES
('L01', N'Công ngh? thông tin 1', 3),
('L02', N'K? thu?t ph?n m?m', 2),
('L03', N'H? th?ng thông tin', 2);

-- Thêm d? li?u vào b?ng SINHVIEN
INSERT INTO SINHVIEN (MASV, TENSV, NGSINH) VALUES
('SV01', N'Nguy?n V?n A', '2002-01-01'),
('SV02', N'Lê Th? B', '2002-03-15'),
('SV03', N'Tr?n V?n C', '2001-11-20'),
('SV04', N'Ph?m Th? D', '2003-06-10'),
('SV05', N'Hoàng V?n E', '2002-09-09'),
('SV06', N'?? Th? F', '2001-12-12'),
('SV07', N'V? V?n G', '2002-08-08');

-- Thêm d? li?u vào b?ng SINHVIEN_LOPHOC (m?i sinh viên có th? h?c nhi?u l?p)
INSERT INTO SINHVIEN_LOPHOC (MASV, MALOP) VALUES
('SV01', 'L01'),
('SV01', 'L02'),
('SV02', 'L01'),
('SV03', 'L01'),
('SV03', 'L03'),
('SV04', 'L02'),
('SV05', 'L02'),
('SV06', 'L03'),
('SV07', 'L03');


select *
from SINHVIEN
