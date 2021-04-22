    CREATE TABLE Daftar (
    User_Name VARCHAR2(50) NOT NULL,
    Nama_Depan VARCHAR2(50),
    Nama_Belakang VARCHAR2(50),
    Password VARCHAR2(50) UNIQUE
);
ALTER TABLE Daftar ADD CONSTRAINT Daftar_PK PRIMARY KEY (User_Name);

CREATE TABLE Login (
    User_Name VARCHAR2(50) NOT NULL,
    Password VARCHAR2(50) NOT NULL
);

CREATE TABLE Admin (
    IDAdmin VARCHAR2(10) NOT NULL,
    User_Name VARCHAR2(50) NOT NULL,
    Nama_Admin VARCHAR2(50),
    Tgl_Lahir DATE,
    NomorTlp VARCHAR2(50)
);
ALTER TABLE Admin ADD CONSTRAINT Admin_PK PRIMARY KEY (IDAdmin);

CREATE TABLE Alamat(
    KodePos VARCHAR2(50) NOT NULL,
    IDPelanggan VARCHAR2(10) NOT NULL,
    NoLaundry VARCHAR2(10) NOT NULL,
    Jalan VARCHAR2(50),
    KotaKabupaten VARCHAR2(50)
);
ALTER TABLE Alamat ADD CONSTRAINT Alamat_PK PRIMARY KEY (KodePos);

CREATE TABLE Laundry (
	NoLaundry VARCHAR2(50) NOT NULL,
	Nama_Laundry VARCHAR2(50),
	NomorTlp NUMBER
);
ALTER TABLE Laundry ADD CONSTRAINT Laundry_PK PRIMARY KEY (NoLaundry);

CREATE TABLE Pembayaran (
    IDPembayaran VARCHAR2(10) NOT NULL,
    IDPemesanan VARCHAR2(10) NOT NULL,
    IDDelivery VARCHAR2(10) NOT NULL,
    Jumlah NUMBER,
    Status_Pembayaran VARCHAR2(50)
);
ALTER TABLE Pembayaran ADD CONSTRAINT Pembayaran_PK PRIMARY KEY (IDPembayaran);

CREATE TABLE Delivery (
    IDDelivery VARCHAR2(10) NOT NULL,
    IDPemesanan VARCHAR2(10) NOT NULL,
    HargaDelivery NUMBER
);
ALTER TABLE Delivery ADD CONSTRAINT Delivery_PK PRIMARY KEY (IDDelivery);

CREATE TABLE Pemesanan (
    IDPemesanan VARCHAR2(10) NOT NULL,
    IDAdmin VARCHAR2(10) NOT NULL,
    IDPelanggan VARCHAR2(10) NOT NULL,
    BeratPakaian NUMBER,
    TipePakaian VARCHAR2(50),
    KondisiPakaian VARCHAR2(50),
    HariPengerjaan NUMBER
);
ALTER TABLE Pemesanan ADD CONSTRAINT Pemesanan_PK PRIMARY KEY (IDPemesanan);

CREATE TABLE Pelanggan (
    IDPelanggan VARCHAR2(10) NOT NULL,
    User_Name VARCHAR2(50) NOT NULL,   
    NamaPelanggan VARCHAR2(50),
    NomorTlp NUMBER,
    Email VARCHAR2(50)
);
ALTER TABLE Pelanggan ADD CONSTRAINT Pelanggan_PK PRIMARY KEY (IDPelanggan);

CREATE TABLE JadwalKerja (
    IDJam VARCHAR2(10) NOT NULL,
    IDAdmin VARCHAR2(10) NOT NULL,
    Shift VARCHAR2(50),
    Waktu NUMBER
);
ALTER TABLE JadwalKerja ADD CONSTRAINT JadwalKerja_PK PRIMARY KEY (IDJam);




ALTER TABLE Login ADD CONSTRAINT Login_Daftar_FK FOREIGN KEY (User_Name) REFERENCES Daftar (User_Name);

ALTER TABLE Login ADD CONSTRAINT Login_Daftar1_FK FOREIGN KEY (Password) REFERENCES Daftar (Password);

ALTER TABLE Admin ADD CONSTRAINT Admin_Daftar_FK FOREIGN KEY (User_Name) REFERENCES Daftar (User_Name);

ALTER TABLE Pembayaran ADD CONSTRAINT Pembayaran_Pemesanan_FK FOREIGN KEY (IDPemesanan) REFERENCES Pemesanan (IDPemesanan);

ALTER TABLE Pembayaran ADD CONSTRAINT Pembayaran_Delivery_FK FOREIGN KEY (IDDelivery) REFERENCES Delivery (IDDelivery);

ALTER TABLE Delivery ADD CONSTRAINT Delivery_Pemesanan_FK FOREIGN KEY (IDPemesanan) REFERENCES Pemesanan (IDPemesanan);

ALTER TABLE Pemesanan ADD CONSTRAINT Pemesanan_Admin_FK FOREIGN KEY (IDAdmin) REFERENCES Admin (IDAdmin);

ALTER TABLE Pemesanan ADD CONSTRAINT Pemesanan_Pelanggan_FK FOREIGN KEY (IDPelanggan) REFERENCES Pelanggan (IDPelanggan);

ALTER TABLE Pelanggan ADD CONSTRAINT Pelanggan_Daftar_FK FOREIGN KEY (User_Name) REFERENCES Daftar (User_Name);

ALTER TABLE JadwalKerja ADD CONSTRAINT JadwalKerja_Admin_FK FOREIGN KEY (IDAdmin) REFERENCES Admin (IDAdmin);

ALTER TABLE Alamat ADD CONSTRAINT Alamat_Pelannggan_FK FOREIGN KEY (IDPelanggan) REFERENCES Pelanggan (IDPelanggan);

ALTER TABLE Alamat ADD CONSTRAINT Alamat_Laundry_FK FOREIGN KEY (NoLaundry) REFERENCES Laundry (NoLaundry);

