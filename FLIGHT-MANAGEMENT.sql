CREATE DATABASE QUANLI_CHUYENBAY
GO
USE QUANLI_CHUYENBAY
GO
--DROP DATABASE QUANLI_CHUYENBAY

--- PHẦN BẢNG
CREATE TABLE SANBAY
(
	MaSanBay CHAR(5) PRIMARY KEY,
	TenSanBay NVARCHAR(100) NOT NULL,
	QuocGia NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
)

-- đã xóa

CREATE TABLE CHUYENBAY
(
	MaChuyenBay CHAR(5) PRIMARY KEY,
	SanBayDi CHAR(5) NOT NULL,
	SanBayDen CHAR(5) NOT NULL,
	NgayGio SMALLDATETIME NOT NULL,
	SLGheTrong INT NOT NULL, 
	SLGheDaDat INT NOT NULL, 
	DonGia FLOAT,
	ThoiGianBay INT
)

--đã xóa
CREATE TABLE CHITIETHANGVE
(
	MaChuyenBay CHAR(5) ,
	MaHangVe char(5),
	SLVe int,
)

-- đã xóa
CREATE TABLE CHITIETCHUYENBAY
(
	MaCTCB CHAR(5) PRIMARY KEY,
	MaChuyenBay CHAR(5) NOT NULL,
	SanBayTG CHAR(5) NOT NULL,
	ThoiGianDung INT NOT NULL,
	GhiChu NVARCHAR(100)
)

-- đã xóa
CREATE TABLE VECHUYENBAY
(
	MaVe CHAR(5) PRIMARY KEY,
	MaChuyenBay CHAR(5) NOT NULL,
	MaHanhKhach CHAR(5) NOT NULL,
	GiaTien FLOAT,
	MaGhe CHAR(10) NOT NULL
)

-- đã xóa
CREATE TABLE HANHKHACH
(
	MaHanhKhach CHAR(5) PRIMARY KEY,
	TenHanhKhach NVARCHAR(40) NOT NULL,
	CMND NVARCHAR(20) NOT NULL,
	SDT NVARCHAR(30)
)


--đã xóa
CREATE TABLE GHE
(
	MaGhe CHAR(10) PRIMARY KEY,
	MaChuyenBay CHAR(5) NOT NULL,
	MaHangVe CHAR(5) NOT NULL,
	TinhTrangGhe INT,
	ViTri NVARCHAR(50) NOT NULL,
	Gia FLOAT
)

--đã xóa
CREATE TABLE PHIEUDATCHO
(
	MaPDC CHAR(5) PRIMARY KEY,
	MaChuyenBay CHAR(5) NOT NULL,
	MaHanhKhach CHAR(5) NOT NULL,
	MaHangVe CHAR(5) NOT NULL,
	GiaTien FLOAT,
	NgayDat SMALLDATETIME,
	MaGhe CHAR(10),
	TinhTrangPDC NVARCHAR(50) NOT NULL
)


CREATE TABLE HANGVE
(
	MaHangVe CHAR(5) PRIMARY KEY,
	TenHangVe NVARCHAR(50) NOT NULL,
	TyLeGiaVe INT
)

-- đã xóa
CREATE TABLE CTDT_CHUYENBAY
(
	MaChuyenBay CHAR(5) PRIMARY KEY,
	Thang int NOT NULL,
	Nam	int NOT NULL,
	SoVe INT NOT NULL,
	TyLeTungCB FLOAT NOT NULL,
	DoanhThu INT NOT NULL
)

-- đã xóa
CREATE TABLE DOANHTHUTHANG
(
	MaNam INT NOT NULL,
	Thang INT NOT NULL,
	TongDT_Thang FLOAT NOT NULL,	
	SoChuyenBay INT,
	TyLeThang FLOAT NOT NULL
	PRIMARY KEY(MaNam,Thang)
)


CREATE TABLE DOANHTHUNAM
(
	MaNam INT PRIMARY KEY,
	TongDT_Nam FLOAT
)

CREATE TABLE THAMSO
(
	TenThamSo NVARCHAR(100) PRIMARY KEY,
	GiaTri INT NOT NULL
)

CREATE TABLE NHANVIEN
(
	MaNV CHAR(8) PRIMARY KEY,
	TenNV NVARCHAR(50) NOT NULL,
	NgaySinh DATE NOT NULL,
	GioiTinh NVARCHAR(10) NOT NULL,
	SDT CHAR(10) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	QuyenTruyCap NVARCHAR(20) NOT NULL
)



CREATE TABLE TAIKHOANDANGNHAP
(
	MaNhanVien CHAR(8) NOT NULL,
	Matkhau NVARCHAR(20) NOT NULL,
)

select * from THAMSO

--khóa ngoại
----------------Khoá ngoại bảng CHUYENBAY
ALTER TABLE CHUYENBAY ADD CONSTRAINT FK_CB_SB1 FOREIGN KEY (SanBayDi) REFERENCES SANBAY (MaSanBay)
ALTER TABLE CHUYENBAY ADD CONSTRAINT FK_CB_SB2 FOREIGN KEY (SanBayDen) REFERENCES SANBAY (MaSanBay)

--------------khoá ngoại bảng CHITIETHANGVE
ALTER TABLE CHITIETHANGVE ADD CONSTRAINT FK_CTHV_CB FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE CHITIETHANGVE ADD CONSTRAINT FK_CTHV_HV FOREIGN KEY (MaHangVe) REFERENCES HANGVE(MaHangVe)
-------------------Khoá ngoại CHITIETCHUYENBAY
ALTER TABLE CHITIETCHUYENBAY ADD CONSTRAINT FK_CTCB_CB FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE CHITIETCHUYENBAY ADD CONSTRAINT FK_CTCB_SB FOREIGN KEY (SanBayTG) REFERENCES SANBAY (MaSanBay)
-------------------khoá ngoại CTDT_CHUYENBAY
ALTER TABLE CTDT_CHUYENBAY ADD CONSTRAINT FK_CTDTCB_CB FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
------------------khoá ngoại GHE
ALTER TABLE GHE ADD CONSTRAINT FK_GHE_CB FOREIGN KEY(MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE GHE ADD CONSTRAINT FK_GHE_HANGVE FOREIGN KEY(MaHangVe) REFERENCES HANGVE (MaHangVe)
-------------------khoá ngoại PHIEUDATCHO

ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PDC_CB FOREIGN KEY(MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PDC_HK FOREIGN KEY (MaHanhKhach) REFERENCES HANHKHACH(MaHanhKhach)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PDC_GHE FOREIGN KEY (MaGhe) REFERENCES GHE(MaGhe)
ALTER TABLE PHIEUDATCHO ADD CONSTRAINT FK_PDC_HANGVE FOREIGN KEY(MaHangVe) REFERENCES HANGVE(MaHangVe)
-------------------khoá ngoại VECHUYENBAY
ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VE_CB FOREIGN KEY (MaChuyenBay) REFERENCES CHUYENBAY(MaChuyenBay)
ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VE_HK FOREIGN KEY (MaHanhKhach) REFERENCES HANHKHACH(MaHanhKhach)
ALTER TABLE VECHUYENBAY ADD CONSTRAINT FK_VE_GHE FOREIGN KEY(MaGhe) REFERENCES GHE(MaGhe)

-------------------khoá ngoại TAIKHOANDANGNHAP
ALTER TABLE TAIKHOANDANGNHAP ADD CONSTRAINT FK_TKDN_NV FOREIGN KEY (MaNhanVien) REFERENCES NHANVIEN(MaNV)

GO


-----Phần insert ----
----------------------

--INSERT THAM SỐ VÀO ĐỂ KIỂM TRA--

INSERT INTO THAMSO VALUES ('ThoiGianBayToiThieu',30)
INSERT INTO THAMSO VALUES ('SoSanBayTrungGianToiDa',2)
INSERT INTO THAMSO VALUES ('ThoiGianDungToiThieu',10)
INSERT INTO THAMSO VALUES ('ThoiGianDungToiDa', 15)
INSERT INTO THAMSO VALUES ('ThoiGianChamNhatDatVe', 1)
INSERT INTO THAMSO VALUES ('ThoiGianChamNhatHuyVe', 0)


---INSER SÂN BAY 
INSERT INTO SANBAY VALUES ('1','Suvarnabhumi',N'Thái Lan','23')
INSERT INTO SANBAY VALUES ('2',N'Bắc Kinh',N'Trung Quốc','23')
INSERT INTO SANBAY VALUES ('3',N'Tân Sơn Nhất',N'Việt Nam','23')
INSERT INTO SANBAY VALUES ('4',N'Paris','Pháp','23')
INSERT INTO SANBAY VALUES ('5','Dallas-Forth Worth',N'Mỹ','23')
----INSERT HẠNG VÉ 
INSERT INTO HANGVE VALUES('1','Hạng 1','105')
INSERT INTO HANGVE VALUES('2','Hạng 2','100')
INSERT INTO HANGVE VALUES('3','Hạng 3','100')
INSERT INTO HANGVE VALUES('4','Hạng 4','100')

--phần proc






-- PROC DÙNG ĐỂ LẤY QUYỀN CỦA NGƯỜI DÙNG TỪ MÃ SỐ NHÂN VIÊN
GO
CREATE PROC LAYQUYEN 
@msnv CHAR(8)
AS
BEGIN

	SELECT QuyenTruyCap FROM NHANVIEN WHERE MaNV = @msnv

END
GO


-- PROC DÙNG ĐỂ LẤY TÊN NHÂN VIÊN TỪ MÃ SỐ SINH VIÊN
CREATE PROC LAYTENNV
@manv CHAR(8)
AS 
BEGIN
	SELECT TenNV FROM NHANVIEN WHERE MaNV = @manv
END
GO


-- PROC KIỂM TRA XEM TÀI KHOẢN VÀ MẬT KHẨU NÀY CÓ TRONG TÀI KHOẢN HAY KHÔNG
CREATE PROC KIEMTRADANGNHAP
@manv CHAR(8), @mk NVARCHAR(20)
AS
BEGIN
	SELECT * FROM TAIKHOANDANGNHAP WHERE MaNhanVien = @manv AND Matkhau = @mk
END
GO
-- PROC NHẬP CHUYẾN BAY VÀO HỆ THỐNG 


CREATE PROC INSERTTOFLIGHT @MaChuyenBay CHAR(5), @SanBayDi NVARCHAR(100), @SanBayDen NVARCHAR(100), @NgayGio SMALLDATETIME , @DonGia FLOAT , @ThoiGianBay INT,@SLGhe INT
AS
BEGIN 
	IF(NOT EXISTS (SELECT * FROM CHUYENBAY WHERE MaChuyenBay = @MaChuyenBay))
	BEGIN
	DECLARE @MaSanBayDi CHAR(5), @MaSanBayDen CHAR(5)
	SELECT @MaSanBayDi = MaSanBay
	FROM SANBAY 
	WHERE TenSanBay = @SanBayDi
	SELECT @MaSanBayDen= MaSanBay
	FROM SANBAY
	WHERE TENSANBAY = @SanBayDen
	INSERT INTO CHUYENBAY(MaChuyenBay,SanBayDi,SanBayDen,NgayGio,SLGheDaDat,SLGheTrong,DonGia,ThoiGianBay) VALUES (@MaChuyenBay,@MaSanBayDi,@MaSanBayDen,@NgayGio,0,@SLGhe,@DonGia,@ThoiGianBay) 
	END
END
GO


--PROC NHẬP SỐ LƯỢNG CHI TIẾT TỪNG CHIẾN BAY NGƯỜI DÙNG ĐÃ CHỌN(Moi)
CREATE PROC INSERT_CHITIETHANGVE @MaChuyenBay char(5), @MaHangVe char(5), @SoLuong INT
AS
BEGIN
	INSERT INTO CHITIETHANGVE(MaChuyenBay,MaHangVe,SLVe) VALUES(@MaChuyenBay,@MaHangVe,@SoLuong)
END
GO


-- PROC NHẬP SÂN BAY TRUNG GIAN VÀO HỆ THỐNG
CREATE PROCEDURE INSERT_TRANAIRPORT @MaChuyenBay CHAR (5), @SanBayTG NVARCHAR(100), @ThoiGianCho INT, @GhiChu NVARCHAR (100)
AS 
BEGIN
	DECLARE @NUM int ,@MaSanBayTrungGian CHAR(10)

	SELECT  @MaSanBayTrungGian = MaSanBay
	FROM SANBAY
	WHERE TENSANBAY = @SanBayTG

	SELECT @NUM = COUNT(*)
	FROM CHITIETCHUYENBAY
	WHERE MaChuyenBay = @MaChuyenBay
	SET @NUM = @NUM +1 

	INSERT INTO CHITIETCHUYENBAY(MACTCB,MaChuyenBay,SanBayTG,ThoiGianDung,GhiChu) values (SUBSTRING(@MaChuyenBay,3,3)+CAST(@NUM AS CHAR),@MaChuyenBay,@MaSanBayTrungGian,@ThoiGianCho,@GhiChu)
END
GO


-- PROC ĐỂ TÌM CÁC CHUYẾN BAY CÓ NGÀY ĐI TRÙNG VỚI NGÀY KHÁCH HÀNG MUỐN ĐI
CREATE PROC DATAGRIDVIEW @QuocGiaDi NVARCHAR(100), @QuocGiaDen NVARCHAR(100),@NgayDi smalldatetime
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,A.ThoiGianBay,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE B.QuocGia = @QuocGiaDi AND C.QuocGia = @QuocGiaDen and CAST(@NgayDi AS DATE) = CAST(A.NgayGio AS DATE)
END
GO


--PROC ĐỂ TÌM CÁC GHẾ DỰA VÀO MÃ MÁY BAY
CREATE PROC SELECT_GHE @MaChuyenBay CHAR(5)
AS 
	BEGIN
	SELECT * FROM GHE 
	WHERE MaChuyenBay = @MaChuyenBay
END
GO


--PROC ĐỂ NHẬP THÔNG TIN KHÁCH HÀNG (NẾU CHƯA CÓ) ,  NHẬP THÔNG TIN VÉ , UPDATE TÌNH TRẠNG GHẾ
CREATE PROC INSERT_PASSENGER @MaChuyenBay CHAR(5), @TenKhachHang NVARCHAR(40), @CMND NVARCHAR(20), @SDT NVARCHAR(30) , @MaGhe CHAR(10),@GiaTien FLOAT
AS
BEGIN
	DECLARE @NUM_HanhKhach INT, @NUM_Ve INT, @MaHanhKhach CHAR(5)

	IF(EXISTS(SELECT * FROM HANHKHACH WHERE CMND = @CMND ))
		BEGIN 
			SELECT @MaHanhKhach = MaHanhKhach
			FROM HANHKHACH
			WHERE CMND = @CMND
			SELECT @NUM_Ve = COUNT(*)
			FROM VECHUYENBAY
			SET @NUM_Ve= @NUM_Ve + 1
			INSERT INTO VECHUYENBAY (MaVe,MaChuyenBay,MaGhe,GiaTien,MaHanhKhach) VALUES(CAST(@NUM_Ve AS CHAR(5)),@MaChuyenBay,@MaGhe,@GiaTien,@MaHanhKhach)

			UPDATE GHE 
			SET TinhTrangGhe = 1 
			WHERE MAGHE = @MAGHE
		END
	ELSE
		BEGIN
			SELECT @NUM_HanhKhach= COUNT(*)
			FROM HANHKHACH
			SET @NUM_HanhKhach = @NUM_HanhKhach +1
			INSERT INTO HANHKHACH VALUES(CAST (@NUM_HanhKhach AS CHAR(5)), @TenKhachHang,@CMND,@SDT)

			SELECT @NUM_Ve = COUNT(*)
			FROM VECHUYENBAY
			SET @NUM_Ve=@NUM_Ve+1
			INSERT INTO VECHUYENBAY (MaVe,MaChuyenBay,MaGhe,GiaTien,MaHanhKhach) VALUES(CAST(@NUM_Ve AS CHAR(5)),@MaChuyenBay,@MaGhe,@GiaTien,CAST(@NUM_HanhKhach AS CHAR(5)))
			UPDATE GHE 
			SET TinhTrangGhe = 1 
			WHERE MAGHE = @MAGHE
		END
END 
GO


------------------PHẦN TRIGGER ---------------------


---TRIGGER THÊM GHÊ KHI CÓ INSERT VAO CHITIETVECHUYENBAY(BO TRIGGER THEM GHE CHO INSERT VE CHUYEN BAY THEM NAY VAO ---
CREATE TRIGGER THEMGHE ON CHITIETHANGVE FOR INSERT
AS
BEGIN
	DECLARE @MaChuyenBay CHAR(5) ,@MaHangVe Char(5), @NUM INT, @SLGhe int,@ViTriGhe INT
	IF(NOT EXISTS (SELECT * FROM GHE WHERE MaChuyenBay = @MaChuyenBay and MaHangVe = @MaHangVe))
		BEGIN
			SELECT @MaChuyenBay = MaChuyenBay , @MaHangVe =MaHangVe,@SLGhe = SLVe
			FROM INSERTED
			SELECT @NUM = COUNT(*)
			FROM  GHE
			WHERE MaChuyenBay = @MaChuyenBay
			SET @ViTriGhe = @SLGhe + @NUM
			SET @NUM = @NUM +1
			WHILE @Num <= @ViTriGhe
				BEGIN
					INSERT INTO GHE(MaGhe,MaChuyenBay,MaHangVe,TinhTrangGhe,ViTri) VALUES (@MaChuyenBay + CAST(@Num AS NVARCHAR),@MaChuyenBay,@MaHangVe,0,@NUM)
					SET @Num = @Num +1
				END
     		END
END
GO


---TRIGGER UPDATE GIA GHE THEO HANG VE ----
CREATE TRIGGER INSERT_GHE ON GHE FOR INSERT
AS
BEGIN
	DECLARE @MaChuyenBay CHAR(5), @DonGia FLOAT,@MaGhe CHAR(10),@TyLeGiaVe INT,@MaHangVe CHAR(5)
	SELECT @Maghe = MaGhe , @MaChuyenBay = MaChuyenBay, @MaHangVe = MaHangVe
	FROM INSERTED
	SELECT @DonGia = DonGia
	FROM CHUYENBAY
	WHERE MaChuyenBay = @MaChuyenBay

	SELECT @TyLeGiaVe = HANGVE.TyLeGiaVe
	FROM HANGVE
	WHERE MaHangVe = @MaHangVe

	UPDATE GHE
	SET GIA = @DonGia*@TyLeGiaVe/100
	WHERE MaGhe = @MaGhe
END


----TRIGER CẬP NHẬT DOANH THU CHUYẾN BAY KHI CÓ VÉ NHẬP VÀO ---
GO

--TRIGGER KHI MỘT VÉ ĐƯỢC ĐẶT THÌ TỰ ĐỘNG CẬP NHẬT VÀO BẢNG DOANH THU


CREATE TRIGGER DOANH_THU_CHUYEN_BAY  ON VECHUYENBAY FOR INSERT 
AS 
BEGIN
DECLARE @MaChuyenBay CHAR (5), @NGayGio SMALLDATETIME, @DoanhThu FLOAT, @GiaTien FLOAT,  @TyLeTungCB FLOAT, @TongTien FLoat
SELECT @MaChuyenBay = MaChuyenBay, @GiaTien = GiaTien
FROM INSERTED
SELECT @NGayGio = NgayGio
FROM CHUYENBAY
WHERE MaChuyenBay = @MaChuyenBay
IF(NOT EXISTS (SELECT * FROM CTDT_CHUYENBAY WHERE Thang = MONTH(@NGayGio) AND Nam = YEAR(@NGayGio)))
	BEGIN
		INSERT INTO CTDT_CHUYENBAY(MaChuyenBay, Thang, Nam, SoVe, TyLeTungCB, DoanhThu) VALUES (@MaChuyenBay, MONTH(@NgayGio),YEAR(@NGayGio),1,100,@GiaTien)
	END
ELSE
	BEGIN 
	SELECT @TongTien = SUM(DoanhThu)
	FROM CTDT_CHUYENBAY
	WHERE Thang = MONTH(@NgayGio) AND Nam = YEAR(@NgayGio)
	SET @TongTien = @TongTien + @GiaTien

		IF(NOT EXISTS (SELECT * FROM CTDT_CHUYENBAY WHERE MaChuyenBay = @MaChuyenBay))
			BEGIN
				UPDATE CTDT_CHUYENBAY 
				SET TyLeTungCB = ROUND (DoanhThu/@TongTien * 100, 2)
				WHERE Thang =MONTH(@NGayGio) AND Nam = YEAR(@NgayGio)
				INSERT INTO CTDT_CHUYENBAY(MaChuyenBay, Thang, Nam, SoVe, TyLeTungCB, DoanhThu) VALUES(@MaChuyenBay,MONTH(@NgayGio),YEAR(@NgayGio),1,ROUND((@GiaTien/@TongTien)*100,2),@GiaTien)

			END
		ELSE
			BEGIN
				UPDATE CTDT_CHUYENBAY 
				SET TyLeTungCB = ROUND((DoanhThu/@TongTien) * 100,2)
				WHERE Thang =MONTH(@NgayGio) AND Nam = YEAR(@NgayGio) AND MaChuyenBay <> @MaChuyenBay
				SELECT @DoanhThu = DoanhThu
				FROM CTDT_CHUYENBAY
				WHERE MaChuyenBay = @MaChuyenBay
				SET @DoanhThu = @DoanhThu + @GiaTien
				UPDATE CTDT_CHUYENBAY 
				SET DoanhThu = @DoanhThu , TyLeTungCB = ROUND ((@DoanhThu /@TongTien) *100,2),SoVe = SoVe + 1
				WHERE MaChuyenBay = @MaChuyenBay
			END
	END	

END
GO



----TRIGGER UPDATE GHE KHI TRANG THAI GHE THAY DOI 
CREATE TRIGGER UPDATE_GHE ON GHE FOR UPDATE 
AS
BEGIN
	DECLARE @TrangThaiBanDau INT , @TrangThaiSau INT ,@MaChuyenBay CHAR(5),@MaGhe CHAR(10), @MaHangVe CHAR(5),@TyLeGiaVe INT , @DonGia FLOAT
	SELECT @TrangThaiSau = TinhTrangGhe, @MaChuyenBay = MaChuyenBay,@MaGhe = MaGhe, @MaHangVe = MaHangVe
	FROM inserted
	SELECT @TrangThaiBanDau = TinhTrangGhe 
	FROM deleted
	IF((@TrangThaiBanDau = 0) AND (@TrangThaiBanDau <> @TrangThaiSau))
	BEGIN
		UPDATE CHUYENBAY
		SET SLGheDaDat = SLGheDaDat +1, SLGheTrong = SLGheTrong - 1
		WHERE MaChuyenBay = @MaChuyenBay
	END
	IF((@TrangThaiBanDau = 1) AND (@TrangThaiBanDau <>@TrangThaiSau))
	BEGIN 
			UPDATE CHUYENBAY
			SET SLGheDaDat = SLGheDaDat - 1, SLGheTrong = SLGheTrong +1
			WHERE MaChuyenBay = @MaChuyenBay

			SELECT @DonGia = DonGia
			FROM CHUYENBAY
			WHERE MaChuyenBay = @MaChuyenBay

			SELECT @TyLeGiaVe = HANGVE.TyLeGiaVe
			FROM HANGVE
			WHERE MaHangVe = @MaHangVe

			UPDATE GHE
			SET GIA = @DonGia*@TyLeGiaVe/100
			WHERE MaGhe = @MaGhe
	END
END
GO


-----TRIGGER UPDATE GIÁ GHẾ KHI TỈ LỆ GIÁ VÉ THAY ĐỔI ----
CREATE TRIGGER UPDATE_GIA_GHE ON HANGVE FOR UPDATE 
AS
BEGIN 
	DECLARE @TyLeTruoc int , @TyLeSau int, @MaHangVe CHAR(5)
	SELECT @TyLeSau = TyLeGiaVe, @MaHangVe = MaHangVe
	FROM INSERTED
	SELECT @TyLeTruoc = TyLeGiaVe
	FROM DELETED
	IF(@TyLeSau<>@TyLeTruoc)
	BEGIN
		UPDATE GHE
		SET Gia = Gia / @TyLeTruoc * @TyLeSau
		WHERE MaHangVe =@MaHangVe AND TinhTrangGhe = 0
	END
END
GO


----PROC XOA CHUYENBAY -------
CREATE PROC XOACHUYENBAY @MACB CHAR(5)
AS
BEGIN
	DELETE FROM CHUYENBAY
	WHERE MaChuyenBay = @MACB
	DELETE FROM GHE 
	WHERE MaChuyenBay = @MACB
	DELETE FROM CHITIETCHUYENBAY
	WHERE MaChuyenBay = @MACB
	DELETE FROM CHITIETHANGVE
	WHERE MaChuyenBay = @MACB
END
GO


---PROC TIM THEO QUOC GiA Di 
CREATE PROC TraCuuCB_QuocGiaDi @QuocGiaDi NVARCHAR(100)
AS
	BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE B.QuocGia = @QuocGiaDi
END
GO


---PROC TIM THEO QUOC GIA DEN
CREATE PROC TraCuuCB_QuocGiaDen @QuocGiaDen NVARCHAR(100)
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A 
	JOIN SANBAY B ON A.SanBayDi = B.MaSanBay 
	JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE C.QuocGia = @QuocGiaDen
END
GO


--PROC TIM THEO QUOC GiA DI VA DEN 
CREATE PROC TraCuuCB_QGDi_QGDen @QuocGiaDi NVARCHAR(100),@QuocGiaDen NVARCHAR(100)
AS
	BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A 
	JOIN SANBAY B ON A.SanBayDi = B.MaSanBay 
	JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE C.QuocGia = @QuocGiaDen 
	AND B.QuocGia = @QuocGiaDi
END
GO


---PRODURE THEM HANG VE--

--PRODURE SUA HANG VE ---
CREATE PROC SUAHANGVE @MaHangVe Char(5), @TenHangVe NVARCHAR(50), @TyLe INT
AS 
BEGIN
	IF(EXISTS (SELECT * FROM HANGVE WHERE MaHangVe = @MaHangVe))
	BEGIN
		UPDATE HANGVE
		SET TenHangVe = @TenHangVe,TyLeGiaVe = @TyLe
		WHERE MaHangVe = @MaHangVe
	END
END
GO


--PRODURE XOA HANG VE ---
CREATE PROC XOAHANGVE @MaHangVe Char(5)
AS 
BEGIN
	IF(NOT EXISTS (SELECT * FROM CHITIETHANGVE WHERE MaHangVe = @MaHangVe))
	BEGIN
		DELETE FROM HANGVE
		WHERE MaHangVe = @MaHangVe
	END
END
GO



-------------------------hoa-----------------------------------------------------
-------------- PHẦN PROC VÀ TRIG CHO CHỨC NĂNG TRA CỨU VÀ ĐẶT CHỖ ----------------------------

-- PROC THÊM KHÁCH HÀNG MỚI
CREATE PROC THEM_HANHKHACH @MACB CHAR(5), @HOTEN NVARCHAR(40), @CMND NVARCHAR(20),@SDT NVARCHAR(20), @MAGHE CHAR(10),@GIAVE float,@MAHANGVE char(5)
AS
	BEGIN
		DECLARE @NUM INT,@NUM_1 INT, @MAHK CHAR(5)
		IF EXISTS ( SELECT* FROM HANHKHACH WHERE CMND = @CMND)
			BEGIN
				SELECT @MAHK = MaHanhKhach
				FROM HANHKHACH
				WHERE CMND = @CMND
				SELECT @NUM_1 = COUNT(*)
				FROM PHIEUDATCHO
				SET @NUM_1 = @NUM_1+1
				DECLARE @STR CHAR(5)
				INSERT INTO PHIEUDATCHO (MaPDC,MaChuyenBay,MaHanhKhach,MaHangVe,GiaTien,NgayDat,MaGhe,TinhTrangPDC) VALUES(@NUM_1,@MACB,@MAHK,@MAHANGVE,@GIAVE,GETDATE(),@MAGHE,N'CHƯA THANH TOÁN')
				UPDATE GHE
				SET TinhTrangGhe = 1
				WHERE MAGHE = @MAGHE
		    END
		ELSE
			BEGIN
				SELECT @NUM = COUNT(*)
				FROM HANHKHACH
				SET @NUM = @NUM+1
				SELECT @NUM_1 = COUNT(*)
				FROM PHIEUDATCHO
				SET @NUM_1 = @NUM_1 +1
				INSERT INTO HANHKHACH VALUES(CAST(@NUM AS CHAR(5)),@HOTEN,@CMND,@SDT)
				INSERT INTO PHIEUDATCHO (MaPDC,MaChuyenBay,MaHanhKhach,MaHangVe,GiaTien,NgayDat,MaGhe,TinhTrangPDC) VALUES(@NUM_1,@MACB,@NUM,@MAHANGVE,@GIAVE,GETDATE(),@MAGHE,N'CHƯA THANH TOÁN')
				UPDATE GHE
				SET TinhTrangGhe = 1
				WHERE MAGHE = @MAGHE
			END
END
GO


--PROC SET TÌNH TRẠNG GHẾ KHI CÓ NGƯỜI MUA VES
CREATE PROCEDURE SET_GHE @MAGHE CHAR(10)
AS
BEGIN
	UPDATE GHE
	SET TinhTrangGhe = 1
	WHERE MAGHE =@MAGHE
END
GO



-- PROC SET TÌNH TRẠNG CÁC GHẾ THÀNH HẾT HẠN KHI ĐẾN NGÀY QUY ĐỊNH
CREATE PROC DAT_TRANGTHAI_HETHAN @MACB char(5) AS
BEGIN
	UPDATE PHIEUDATCHO
	SET TinhTrangPDC = N'HẾT HẠN'
	WHERE MaChuyenBay = @MACB
	UPDATE GHE
	SET TinhTrangGhe = 3
	WHERE MaChuyenBay = @MACB
END
GO

-- PROC LẤY NGÀY GIỜ CỦA CHUYẾN BAY
CREATE PROC SELECT_DATETIME @MACB CHAR(5) AS
BEGIN
	SELECT NgayGio
	FROM CHUYENBAY
	WHERE MaChuyenBay = @MACB
END
GO


--PROC LẤY MÃ PHIẾU ĐẶT CHỖ TỪ CMND CỦA NGƯỜI ĐẶT
CREATE PROC LAYMA_PDC @CMND NVARCHAR(20) AS
BEGIN
	SELECT MaPDC
	FROM PHIEUDATCHO P, HANHKHACH H
	WHERE P.MaHanhKhach = h.MaHanhKhach and H.CMND = @CMND
END
GO



--- PROC LẤY TẤT CẢ CHUYẾN BAY
CREATE PROC get_all_flight 
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay 
	JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE A.NgayGio > GETDATE()
END
GO



-- proc lấy vị trí từ mã chuyến bay và hạng vé
CREATE PROC lay_vitri @Macb CHAR(5),@Mahv CHAR(5) AS
BEGIN
	SELECT ViTri
	FROM GHE
	WHERE MaChuyenBay = @Macb and MaHangVe = @Mahv
END
GO


---------------- phần lấy thông tin hiển thị pdc -------------------------------

 create proc lay_macb @mapdc char(5) as
 begin
	select MaChuyenBay
	FROM PHIEUDATCHO
	WHERE MaPDC = @mapdc
 end
 GO


 -- LAY SANBAYDI --
 create proc lay_SANBAYDI @mapdc char(5) as
 begin
	select S.TenSanBay
	FROM PHIEUDATCHO P, SANBAY S, CHUYENBAY C
	WHERE MaPDC = @mapdc AND P.MaChuyenBay = C.MaChuyenBay AND C.SanBayDi = S.MaSanBay
 end
 GO


 -- LAY SANBAYDEN --
 create proc lay_SANBAYDEN @mapdc char(5) as
 begin
	select S.TenSanBay
	FROM PHIEUDATCHO P, SANBAY S, CHUYENBAY C
	WHERE MaPDC = @mapdc AND P.MaChuyenBay = C.MaChuyenBay AND C.SanBayDen = S.MaSanBay
 end
 GO



 -- LAY NGAY BAY --
 create proc lay_NGAYBAY @mapdc char(5) as
 begin
	select C.NgayGio
	FROM PHIEUDATCHO P, CHUYENBAY C
	WHERE MaPDC = @mapdc AND P.MaChuyenBay = C.MaChuyenBay 
 end 
 GO


 -- LAY TEN HANH KHACH
 create proc lay_tenhk @mapdc char(5) as
 begin
	select h.TenHanhKhach
	FROM PHIEUDATCHO P, HANHKHACH h
	WHERE MaPDC = @mapdc AND P.MaHanhKhach = h.MaHanhKhach
 end 
 GO


 -- lay cmnd --
 create proc lay_CMND @mapdc char(5) as
 begin
	select h.CMND
	FROM PHIEUDATCHO P, HANHKHACH h
	WHERE MaPDC = @mapdc AND P.MaHanhKhach = h.MaHanhKhach
 end 
 GO


 -- LAY SDT
 create proc lay_SDT @mapdc char(5) as
 begin
	select h.SDT
	FROM PHIEUDATCHO P, HANHKHACH h
	WHERE MaPDC = @mapdc AND P.MaHanhKhach = h.MaHanhKhach
 end 
 GO


 -- LAY HANGVE --
 create proc lay_HANGVE @mapdc char(5) as
 begin
	select MaHangVe
	FROM PHIEUDATCHO 
	WHERE MaPDC = @mapdc 
 end 
 GO


  -- LAY GIATIEN --
 create proc lay_GIATIEN @mapdc char(5) as
 begin
	select GiaTien
	FROM PHIEUDATCHO 
	WHERE MaPDC = @mapdc 
 end 
 GO


  -- LAY TINH TRANG --
 create proc lay_TINHTRANG @mapdc char(5) as
 begin
	select TinhTrangPDC
	FROM PHIEUDATCHO 
	WHERE MaPDC = @mapdc 
 end 
 GO


   -- LAY vị trí --
 create proc lay_vitripdc @mapdc char(5) as
 begin
	select g.ViTri
	FROM PHIEUDATCHO p, GHE g
	WHERE MaPDC = @mapdc and p.MaGhe = g.MaGhe
 end 
 GO


 -- LAY MAGHE
 CREATE PROC LAY_MAGHE @MAPDC CHAR(5) AS
 BEGIN
	SELECT MaGhe
	FROM PHIEUDATCHO WHERE MaPDC = @MAPDC
 END
 GO


 --- PROC XOA PDC
 create proc XOA_PDC @mapdc char(5) as
 begin
 UPDATE GHE
	SET TinhTrangGhe = 0
	WHERE MaGhe = (SELECT MaGhe FROM PHIEUDATCHO WHERE MaPDC = @mapdc)
	DELETE FROM HANHKHACH WHERE MaHanhKhach IN ( SELECT MaHanhKhach FROM PHIEUDATCHO WHERE MaPDC = @mapdc)
	DELETE FROM PHIEUDATCHO WHERE MaPDC = @mapdc
 end 
 GO



 ---- proc dem mapdc
 create proc dem_pdc @mapdc as char(5) as
 begin
	select count(MaPDC)
	from PHIEUDATCHO
	where MaPDC  = @mapdc
 end
 GO


 -- proc check trung vi tri
 create proc kiem_tra_trung_vitri @macb char(5),@vitri int as
 begin
	select count(MaGhe)
	from GHE
	where MaChuyenBay = @macb and ViTri = @vitri and TinhTrangGhe = 1 
 end
 GO


 --PROC
 create proc pos_exists @macb char(5), @vitri nvarchar(50), @hangve char(5) as
 begin
	select count(*)
	from GHE
	where MaChuyenBay = @macb and MaHangVe = @hangve and ViTri = @vitri
 end
 GO



--- kiem tra hang ve hop le --
create proc kiem_tra_hangve @macb char(5), @mahv char(5) as
begin
	select count(*)
	from CHITIETHANGVE
	WHERE MaChuyenBay= @macb AND MaHangVe  =@mahv
end
GO


--  trigger tự động hủy vé khi hết thời hạn sử dụng
create trigger auto_canel_pdc on PHIEUDATCHO FOR INSERT AS
BEGIN
	UPDATE PHIEUDATCHO 
	SET TinhTrangPDC = N'HẾT HẠN'
	FROM PHIEUDATCHO P, (SELECT MaChuyenBay FROM CHUYENBAY  WHERE DATEDIFF(DD,GETDATE(),NgayGio) <= (SELECT GiaTri FROM THAMSO WHERE TenThamSo = 'ThoiGianChamNhatHuyVe' )) H
	WHERE P.MaChuyenBay = H.MaChuyenBay 

	UPDATE GHE
	SET TinhTrangGhe = 3
	FROM GHE P, (SELECT MaChuyenBay FROM CHUYENBAY  WHERE DATEDIFF(DD,GETDATE(),NgayGio) <= (SELECT GiaTri FROM THAMSO WHERE TenThamSo = 'ThoiGianChamNhatHuyVe' )) H
	WHERE P.MaChuyenBay = H.MaChuyenBay 
END
GO


--PROC
CREATE PROC SET_STATUS_OUTOFDATE_PDC
AS
BEGIN
	UPDATE PHIEUDATCHO 
	SET TinhTrangPDC = N'HẾT HẠN'
	FROM PHIEUDATCHO P, (SELECT MaChuyenBay FROM CHUYENBAY  WHERE DATEDIFF(DD,GETDATE(),NgayGio) <= (SELECT GiaTri FROM THAMSO WHERE TenThamSo = 'ThoiGianChamNhatHuyVe' )) H
	WHERE P.MaChuyenBay = H.MaChuyenBay 

	UPDATE GHE
	SET TinhTrangGhe = 3
	FROM GHE P, (SELECT MaChuyenBay FROM CHUYENBAY  WHERE DATEDIFF(DD,GETDATE(),NgayGio) <= (SELECT GiaTri FROM THAMSO WHERE TenThamSo = 'ThoiGianChamNhatHuyVe' )) H
	WHERE P.MaChuyenBay = H.MaChuyenBay 
END
GO





---------------------------phần proc tra cuu ve ---------------------------------------
-------proc tìm kiếm hanh khách -----------
create proc tim_hk @cmnd nvarchar(20)
as
begin
	select count(*)
	from VECHUYENBAY v, HANHKHACH H
	WHERE V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @cmnd 
end
GO


--- LAY MACB VE
create proc lay_macb_ve @cmnd nvarchar(20) as
begin
	select MaChuyenBay
	from VECHUYENBAY v, HANHKHACH h
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
end
GO

-- LAY SAN BAY DI VE
CREATE PROC LAY_SANBAYDI_VE @CMND NVARCHAR(20) AS
BEGIN
	SELECT S.TenSanBay
	FROM VECHUYENBAY V, HANHKHACH H, CHUYENBAY C, SANBAY S
	WHERE V.MaHanhKhach = H.MaHanhKhach AND C.MaChuyenBay  = V.MaChuyenBay AND C.SanBayDi = S.MaSanBay AND H.CMND = @CMND
END
GO


--LAY SAN BAY DEN VE
CREATE PROC LAY_SANBAYDEN_VE @CMND NVARCHAR(20) AS
BEGIN
	SELECT S.TenSanBay
	FROM VECHUYENBAY V, HANHKHACH H, CHUYENBAY C, SANBAY S
	WHERE V.MaHanhKhach = H.MaHanhKhach AND C.MaChuyenBay  = V.MaChuyenBay AND C.SanBayDen = S.MaSanBay AND H.CMND = @CMND
END
GO


-- LAY NGAYGIO
create proc lay_NGAYGIO_VE @cmnd nvarchar(20) as
begin
	select C.NgayGio
	from VECHUYENBAY v, HANHKHACH h, CHUYENBAY C
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND AND C.MaChuyenBay = V.MaChuyenBay
end
GO


-- LAY HO TEN HK --
create proc lay_HOTEN_ve @cmnd nvarchar(20) as
begin
	select H.TenHanhKhach
	from VECHUYENBAY v, HANHKHACH h
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
end
GO


-- LAY SDT HK --
create proc lay_SDT_ve @cmnd nvarchar(20) as
begin
	select H.SDT
	from VECHUYENBAY v, HANHKHACH h
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
end
GO


-- LAY HANG VE HK --
create proc lay_HANGVE_ve @cmnd nvarchar(20) as
begin
	select G.MaHangVe
	from VECHUYENBAY v, HANHKHACH h,GHE G
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND AND G.MaGhe = V.MaGhe
end
GO

-- LAY VITRI --
create proc lay_VITRI_ve @cmnd nvarchar(20) as
begin
	select G.ViTri
	from VECHUYENBAY v, HANHKHACH h, GHE G
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND AND V.MaGhe = G.MaGhe
end
GO


-- LAY GIA TIEN
create proc lay_GIATIEN_ve @cmnd nvarchar(20) as
begin
	select V.GiaTien
	from VECHUYENBAY v, HANHKHACH h
	where V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
end
GO

-- kiem tra hop le ma chuyen bay --------
create proc kiem_tra_hopLe_macb @macb char(5) as
begin
	select count(*)
	from CHUYENBAY
	where MaChuyenBay = @macb and NgayGio > GETDATE()
end
GO

-- tra cuu chuyen bay
CREATE PROC TraCuuchuyenBay @QuocGiaDi NVARCHAR(100), @QuocGiaDen NVARCHAR(100),@NgayDi smalldatetime
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE B.QuocGia = @QuocGiaDi AND C.QuocGia = @QuocGiaDen and CAST(@NgayDi AS DATE) = CAST(A.NgayGio AS DATE)
END
GO


-- tra cuu chuyen bay theo qg đi và thời gian
CREATE PROC TraCuuCB_qgdi_tg @QuocGiaDi NVARCHAR(100),@NgayDi smalldatetime
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE B.QuocGia = @QuocGiaDi  and CAST(@NgayDi AS DATE) = CAST(A.NgayGio AS DATE)
END
GO


-- tra cuu chuyen bay theo qg đen và thời gian
CREATE PROC TraCuuCB_qgden_tg  @QuocGiaDen NVARCHAR(100),@NgayDi smalldatetime
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A 
	JOIN SANBAY B ON A.SanBayDi = B.MaSanBay 
	JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE C.QuocGia = @QuocGiaDen  and CAST(@NgayDi AS DATE) = CAST(A.NgayGio AS DATE)
END
GO


-- tra cuu cb theo tg
CREATE PROC TraCuuCB_tg @NgayDi smalldatetime
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE  CAST(@NgayDi AS DATE) = CAST(A.NgayGio AS DATE)
END
GO


-- lấy tất cả chuyến bay khả dụng --
CREATE PROC Lay_tat_ca_cb 
AS
BEGIN
	SELECT A.MaChuyenBay AS MACB,NgayGio AS NGAYGIO,SLGheTrong,SLGheDaDat,B.TenSanBay AS DIEMDI,C.TenSanBay AS DIEMDEN,a.DonGia,a.ThoiGianBay
	FROM CHUYENBAY A JOIN SANBAY B ON A.SanBayDi = B.MaSanBay JOIN SANBAY C ON A.SanBayDen = C.MaSanBay
	WHERE  a.NgayGio >= GETDATE()
END
GO


-- proc kt pdc  -- update 12/6/2021 ----------
create proc kt_pdc @cmnd nvarchar(20)
as
begin
	select count(*)
	from PHIEUDATCHO p, HANHKHACH h
	where p.MaHanhKhach = h.MaHanhKhach and  h.CMND = @cmnd
end
GO


-- proc kt pdc theo cmnd và tên ---- update 13/6/2021 ----------
create proc kt_pdc2 @hoten nvarchar(40),@cmnd nvarchar(20)
as
begin
	select count(*)
	from PHIEUDATCHO p, HANHKHACH h
	where p.MaHanhKhach = h.MaHanhKhach and h.TenHanhKhach = @hoten  and h.CMND = @cmnd
end
GO


-- tim kiếm vé theo mã cb -- 2021-06-14 07:40:57.737----
create PROC TIMKIEM_VE_MACB @MACB CHAR(5) AS
BEGIN
	select V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien
	from VECHUYENBAY V , HANHKHACH H, GHE G 
	where V.MaChuyenBay = @MACB AND V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach
END
GO


-- lấy tất cả phiếu đặt chỗ
create proc Lay_tat_ca_pdc as
begin
	select V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien,V.MaPDC,V.TinhTrangPDC
	from PHIEUDATCHO V , HANHKHACH H, GHE G 
	where  V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach
end
GO


-- lấy tất cả vé
create proc Lay_tat_ca_ve as
begin
	select V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien
	from VECHUYENBAY V , HANHKHACH H, GHE G 
	where  V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach
end
GO



-- TÌM KIẾM VÉ THEO CMND -- 2021-06-14 08:13:30.550--
CREATE PROC TIMKIEM_VE_CMND @CMND NVARCHAR(20) AS
BEGIN
	select V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien 
	from VECHUYENBAY V , HANHKHACH H, GHE G 
	where  V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
END
GO


-- TÌM KIẾM VÉ THEO CMND và macb -- 2021-06-14 08:13:30.550--
create PROC TIMKIEM_VE_MACB_cmnd @MACB CHAR(5),@CMND NVARCHAR(20) AS
BEGIN
	select V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien 
	from VECHUYENBAY V , HANHKHACH H, GHE G 
	where V.MaChuyenBay = @MACB AND V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
END
GO

-- tim kiem pdc theo macb ----
CREATE PROC TIMKIEM_pdc_MACB @MACB CHAR(5) AS
BEGIN
	select V.MaPDC,V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien,V.TinhTrangPDC
	from PHIEUDATCHO V , HANHKHACH H, GHE G 
	where V.MaChuyenBay = @MACB AND V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach
END
GO


-- TÌM KIẾM pdc THEO CMND -- 2021-06-14 08:13:30.550--
CREATE PROC TIMKIEM_pdc_CMND @CMND NVARCHAR(20) AS
BEGIN
	select V.MaPDC,V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien,V.TinhTrangPDC
	from PHIEUDATCHO V , HANHKHACH H, GHE G 
	where  V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
END
GO


-- TÌM KIẾM pdc THEO CMND và macb -- 2021-06-14 08:13:30.550--
CREATE PROC TIMKIEM_pdc_MACB_cmnd @MACB CHAR(5),@CMND NVARCHAR(20) AS
BEGIN
	select V.MaPDC, V.MaChuyenBay,H.TenHanhKhach,H.CMND,H.SDT,G.MaHangVe,V.GiaTien,V.TinhTrangPDC
	from PHIEUDATCHO V , HANHKHACH H, GHE G 
	where V.MaChuyenBay = @MACB AND V.MaGhe = G.MaGhe AND V.MaHanhKhach = H.MaHanhKhach AND H.CMND = @CMND
END
GO


-- proc thanh toán phiếu đặt chỗ -- 12/6/2021----S
CREATE PROC THANHTOAN_PDC @MaChuyenBay CHAR(5), @TenKhachHang NVARCHAR(40), @CMND NVARCHAR(20), @SDT NVARCHAR(30) , @MaGhe CHAR(10),@GiaTien FLOAT,@MAPDC CHAR(5)
AS
BEGIN
DECLARE @NUM_HanhKhach INT, @NUM_Ve INT, @MaHanhKhach CHAR(5)



IF(EXISTS(SELECT * FROM HANHKHACH WHERE CMND = @CMND ))
BEGIN
SELECT @MaHanhKhach = MaHanhKhach
FROM HANHKHACH
WHERE CMND = @CMND
SELECT @NUM_Ve = COUNT(*)
FROM VECHUYENBAY
SET @NUM_Ve= @NUM_Ve + 1
INSERT INTO VECHUYENBAY (MaVe,MaChuyenBay,MaGhe,GiaTien,MaHanhKhach) VALUES(CAST(@NUM_Ve AS CHAR(5)),@MaChuyenBay,@MaGhe,@GiaTien,@MaHanhKhach)
update PHIEUDATCHO
set TinhTrangPDC = N'ĐÃ THANH TOÁN'
WHERE MaPDC = @MAPDC
--DELETE FROM PHIEUDATCHO WHERE MaPDC = @MAPDC
UPDATE GHE
SET TinhTrangGhe = 1
WHERE MAGHE = @MAGHE
END



ELSE



BEGIN
SELECT @NUM_HanhKhach= COUNT(*)
FROM HANHKHACH
SET @NUM_HanhKhach = @NUM_HanhKhach +1
INSERT INTO HANHKHACH VALUES(CAST (@NUM_HanhKhach AS CHAR(5)), @TenKhachHang,@CMND,@SDT)



SELECT @NUM_Ve = COUNT(*)
FROM VECHUYENBAY
SET @NUM_Ve=@NUM_Ve+1
INSERT INTO VECHUYENBAY (MaVe,MaChuyenBay,MaGhe,GiaTien,MaHanhKhach) VALUES(CAST(@NUM_Ve AS CHAR(5)),@MaChuyenBay,@MaGhe,@GiaTien,CAST(@NUM_HanhKhach AS CHAR(5)))
update PHIEUDATCHO
set TinhTrangPDC = N'ĐÃ THANH TOÁN'
WHERE MaPDC = @MAPDC
--DELETE FROM PHIEUDATCHO WHERE MaPDC = @MAPDC
UPDATE GHE
SET TinhTrangGhe = 1
WHERE MAGHE = @MAGHE
END
END
GO


--DROP PROC THANHTOAN_PDC

----PROC Lấy chi tiết các sân bay trung gian của chuyến bay 
CREATE PROC lay_chi_tiet_chuyen_bay @MACB CHAR(5) AS
BEGIN
	select C.MaChuyenBay,S.TenSanBay,S.QuocGia,ThoiGianDung,GhiChu
	from CHITIETCHUYENBAY C, SANBAY S
	WHERE MaChuyenBay = @MACB AND C.SanBayTG = S.MaSanBay
END
GO


--PROC THÊM HẠNG VÉ
CREATE PROC THEMHANGVE @MaHangVe Char(5), @TenHangVe NVARCHAR(50), @TyLe INT
AS 
BEGIN
IF(NOT EXISTS (SELECT * FROM HANGVE WHERE MaHangVe = @MaHangVe))
	BEGIN
		INSERT INTO HANGVE VALUES (@MaHangVe,@TenHangVe,@TyLe)
	END

END
GO
------------------------------ end hòa --------------------------------------------------------------------------------

-- PROC CHÈN DỮ LIỆU VÀO BẢNG DOANH THU THÁNG
CREATE PROC BAOCAODOANHTHUNAM
@nam INT
AS
BEGIN
	DECLARE @doanhthunam float,
			@doanhthuthang float,
			@thang int = 1,
			@sochuyenbay int,
			@tyle float
			
	while @thang < 13
	begin 
			select @doanhthuthang = sum(DoanhThu) from CTDT_CHUYENBAY where Thang = @thang and Nam = @nam
			if @doanhthuthang is null
			begin
			        set @doanhthuthang = 0;
			end
			select @doanhthunam = sum(DoanhThu) from CTDT_CHUYENBAY where Nam = @nam
			if @doanhthunam is null
			begin
			        set @doanhthunam = 0;
					set @tyle = 0;
			end
			else
			begin
				set @tyle = @doanhthuthang/@doanhthunam
				if @tyle is null
				begin
						set @tyle = 0;
				end
				else
				begin
				   set @tyle = ROUND(@tyle * 100, 2)
				end
				
			end
			select @sochuyenbay = COUNT(*) from CTDT_CHUYENBAY where Thang = @thang and Nam = @nam
			if @sochuyenbay is null
			begin
			        set @sochuyenbay = 0;
			end
			
			
		if (not exists (select * from DOANHTHUTHANG where Thang = @thang and MaNam = @nam))
		begin
			
			insert into DOANHTHUTHANG values(@nam,@thang,@doanhthuthang,@sochuyenbay,@tyle)
		end
		else
		begin
			
			update DOANHTHUTHANG set TongDT_Thang = @doanhthuthang,SoChuyenBay= @sochuyenbay,TyLeThang = @tyle
			where MaNam = @nam and Thang = @thang
		end
		set @thang = @thang + 1
	end
	
	select * from DOANHTHUTHANG where MaNam = @nam
	order by Thang asc
	END
GO




--PROC TÍNH TỔNG DOANH THU THÁNG
CREATE PROC TONGDOANHTHUTHANG
@thang INT, @nam INT
as
BEGIN 
	SELECT * FROM CTDT_CHUYENBAY WHERE Thang = @thang and Nam = @nam
END
GO



--PROC LẤY TÊN SÂN BAY ĐI TỪ MÃ CHUYẾN BAY
CREATE PROC LAYTENSANBAYDI
@macb char(5)
AS
BEGIN 
	DECLARE @masb char(5)
	SELECT @masb = SanBayDi FROM CHUYENBAY WHERE MaChuyenBay = @macb
	select TenSanBay from SANBAY WHERE MaSanBay = @masb
END
GO

--PROC LẤY TÊN SÂN BAY ĐẾN TỪ MÃ CHUYẾN BAY
CREATE PROC LAYTENSANBAYDEN
@macb char(5)
AS
BEGIN 
	DECLARE @masb char(5)
	SELECT @masb = SanBayDen FROM CHUYENBAY WHERE MaChuyenBay = @macb
	select TenSanBay from SANBAY WHERE MaSanBay = @masb
END
GO

--PROC LẤY CHUYẾN BAY CÓ DOANH THU CAO NHẤT
create proc GETMAXDOANHTHUCB
@thang INT, @nam INT
AS
BEGIN 
	SELECT MaChuyenBay FROM CTDT_CHUYENBAY WHERE Thang = @thang and Nam = @nam
	ORDER BY DoanhThu DESC
END
GO

--PROC TÍNH TỔNG DOANH THU THÁNG
create proc SUMDTTHANG
@thang INT, @nam INT
AS
BEGIN 
	SELECT SUM(DoanhThu) FROM CTDT_CHUYENBAY WHERE Thang = @thang and Nam = @nam
END
GO


--PROC TÍNH TỔNG DOANH THU NĂM
create proc SUMDTNAM
@nam INT
AS
BEGIN 
	SELECT SUM(TongDT_Thang) FROM DOANHTHUTHANG WHERE MaNam = @nam
END
GO


--PROC LẤY THÁNG CÓ DOANH THU CAO NHẤT
create proc GETMAXDOANHTHUTHANG
@nam INT
AS
BEGIN 
	SELECT Thang FROM DOANHTHUTHANG WHERE MaNam = @nam
	ORDER BY   TongDT_Thang DESC
END
GO


--PROC CHECK SÂN BAY
create proc CheckSB
@masb char(5)
as
begin
	select * from CHUYENBAY WHERE SanBayDi = @masb or SanBayDen = @masb
end
GO


------------------------ UPDATE THAM SO---*LY*-------------
CREATE PROC SETTING_UPDATE
@min_fly_time INT ,
@num_tran_airpot INT ,
@min_wait_time INT ,
@max_wait_time INT ,
@latest_time_book INT,
@latest_time_cancel INT
AS
BEGIN
	UPDATE THAMSO
	SET GiaTri=@min_fly_time
	where TenThamSo='ThoiGianBayToiThieu'

	UPDATE THAMSO
	SET GiaTri=@num_tran_airpot
	where TenThamSo='SoSanBayTrungGianToiDa'

	UPDATE THAMSO
	SET GiaTri=@min_wait_time
	where TenThamSo='ThoiGianDungToiThieu'

	UPDATE THAMSO
	SET GiaTri=@max_wait_time
	where TenThamSo='ThoiGianDungToiDa'

	UPDATE THAMSO
	SET GiaTri=@latest_time_book
	where TenThamSo='ThoiGianChamNhatDatVe'

	UPDATE THAMSO
	SET GiaTri=@latest_time_cancel
	where TenThamSo='ThoiGianChamNhatHuyVe'	
END
GO

-----------------------------------insert dữ liệu đăng nhập--------------------------------------------
INSERT INTO NHANVIEN VALUES ('19521817', N'Như Lý', '2001/01/31', 'Nữ', '0123456789', N'Huế', 'Quản lý')
insert into TAIKHOANDANGNHAP values('19521817', '0000')