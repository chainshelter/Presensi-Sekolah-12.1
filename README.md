Halo, ini project baru kita, membangun aplikasi presensi untuk sekolah kita.

### 12 Jan 2021 : Preapre & Normalisasi Database	
Tugas 1 Membuat Article dari Awal sampai Membuat Database & Table dibawah ini, Dikirim ke email se.esemka@rbs.sch.id, dengan subject, Pakai email SMK, jangan yang lain.

```.sql
CREATE TABLE tbl_tahunajaran (
    kode_tahunajaran VARCHAR(60) PRIMARY KEY,
    tahunajaran	TEXT,
    date_created TIMESTAMP
);
	
CREATE TABLE tbl_jenjang (
    kode_jenjang VARCHAR(60) PRIMARY KEY,
    jenjang	TEXT,
    date_created TIMESTAMP
);
	
CREATE TABLE tbl_kelas (
    kode_kelas VARCHAR(60) PRIMARY KEY,
    kelas TEXT,
    date_created TIMESTAMP
);
	
CREATE TABLE tbl_jurusan (
    kode_jurusan VARCHAR(60) PRIMARY KEY,
    jurusan	TEXT,
    date_created TIMESTAMP
);

CREATE TABLE tbl_datasiswa (
    id_siswa INT(11) PRIMARY KEY,
    nis	TEXT,
    nama_siswa TEXT,
    jenis_kelamin TEXT,
    date_created TIMESTAMP
);

CREATE TABLE tbl_guru (
    id_guru	INT(11) PRIMARY KEY,
    nip	TEXT,
    nama_guru TEXT,
    jenis_kelamin TEXT,
    date_created TIMESTAMP
);
```

### 13 Jan 2021 : Mengisi data pada Table 
* Table Jenjang
Ketentuannya isi data jenjang, dari TK - SMK
* Table Tahunajaran
Ketentuan isi data tahun ajaran, format 2017/2018 - 2020/2021
* Table Kelas
Ketentuan isi data kelas, dari X - XII
* Table Jurusan
Ketentuan isi data jurusan, dari TKJ dan RPL
* Table Datasiswa 
Ketentuan isi data datasiswa, sisipkan nomor induk siswa, bebas dlu aja nanti di modify
* Table Guru
Ketentuan isi data data guru, sisipkan nomor induk pengajat, bebas dlu aja nanti di modify

Tolong ditulis kedalam article jika sudah kirim ke email se.esemka@rbs.sch.id dengan subject pertemuan 13 jan 2021

### 14 Jan 2021 : Mengisi Data kedalam Tiap-tiap Table yang sudah di Buat
* Melakukan penginputan data melalui Query untuk masing-masing table yang sudah dibuat
* Merekonstruksi table apabila terdapat redudansi

```sql
DESC tbl_datasiswa;

INSERT INTO tbl_datasiswa
(NIS, nama_siswa, jenis_kelamin)
VALUES
('311310300', 'Asep Septiadi', 'Laki-laki'),
('311310301', 'Wirda Andriyana', 'Perempuan'),
('311310302', 'Suci Alfiah', 'Perempuan'),
('311310303', 'Fithri Febiyani Yunus', 'Perempuan'),
('311310304', 'Rahmet Abdillah', 'Laki-laki');

ALTER TABLE tbl_datasiswa CHANGE id_siswa id_siswa INT(11) NOT NULL AUTO_INCREMENT;

SELECT * FROM tbl_datasiswa;

DESC tbl_guru;

INSERT INTO tbl_guru
(nip, nama_guru, jenis_kelamin)
VALUES
('5995291101', 'M. Baehaki Fahrullah', 'Laki-laki'),
('5995291102', 'Dinda Fitriana Ayu', 'Perempuan'),
('5995291103', 'Diah Duniarti', 'Perempuan'),
('5995291104', 'Tria Vivi Niarti', 'Perempuan'),
('5995291105', 'Syukur Rahman Kamil', 'Laki-laki');

ALTER TABLE tbl_guru CHANGE id_guru id_guru INT(11) NOT NULL AUTO_INCREMENT;

SELECT * FROM tbl_guru;

DESC tbl_jenjang;

INSERT INTO tbl_jenjang
(kode_jenjang, jenjang)
VALUES
('TK-1', 'TKIT'),
('SD-1', 'SDIT'),
('SMP-1', 'SMPI'),
('SMK-1', 'SMKI');

SELECT * FROM tbl_jenjang;

DESC tbl_jurusan;

INSERT INTO tbl_jurusan
(kode_jurusan, jurusan)
VALUES
('TKJ', 'Teknik Komputer & Jaringan'),
('RPL', 'Rekayasa Perangkat Lunak'),
('Mm', 'Multimedia'),
('Dg', 'Desaingrafis');

SELECT * FROM tbl_jurusan;

DESC tbl_kelas;

INSERT INTO tbl_kelas
(kode_kelas, kelas)
VALUES
('X', '10'),
('XI', '11'),
('XII', '12');

SELECT * FROM tbl_kelas;

DESC tbl_tahunajaran;

INSERT INTO tbl_tahunajaran
(kode_tahunajaran, tahunajaran)
VALUES
('1718', '2017/2018'),
('1819', '2018/2019'),
('1920', '2019/2020'),
('2021', '2020/2021');

DESC tbl_rombel;

INSERT INTO tbl_rombel
(kode_rombel, rombel_kelas, id_guru, kode_tahunajaran, kode_jenjang, kode_kelas)
VALUES
('R1718-A1', 'X 2017', 1, '1718', 'SMK-1', 'X');

ALTER TABLE tbl_rombel DROP kode_jurusan;

DESC tbl_detailabsensi

INSERT INTO tbl_detailabsensi
(kode_absensi, kode_rombel, id_siswa, kode_jurusan, kehadiran)
VALUES
('15012021-140342', 'R1718-A1', 1, 'Mm', 'H'),
('15012021-140342', 'R1718-A1', 2, 'RPL', 'A'),
('15012021-140342', 'R1718-A1', 3, 'TKJ', 'H'),
('15012021-140342', 'R1718-A1', 4, 'Dg', 'H'),
('15012021-140342', 'R1718-A1', 5, 'RPL', 'H');
```

Tolong ditulis kedalam article jika sudah kirim ke email se.esemka@rbs.sch.id dengan subject pertemuan 14 jan 2021

### 15 Jan 2021 : Merelasikan Antar Table yang sudah dibuat & Merekonstruksi Table yang redudansi
* Melakukan Relasi table dengan Query dan menampilkannya kedalam Design di phpMyAdmin
* Rekonstruksi table apabila terdapat redudansi

```.sql
-- Relasi antar TABLE 
ALTER TABLE tbl_rombel
ADD CONSTRAINT fk_rombel2guru
FOREIGN KEY (id_guru) REFERENCES tbl_guru (id_guru);

ALTER TABLE tbl_rombel
ADD CONSTRAINT fk_rombel2jenjang
FOREIGN KEY (kode_jenjang) REFERENCES tbl_jenjang (kode_jenjang);

ALTER TABLE tbl_rombel
ADD CONSTRAINT fk_rombel2ta
FOREIGN KEY (kode_tahunajaran) REFERENCES tbl_tahunajaran(kode_tahunajaran);

ALTER TABLE tbl_rombel
ADD CONSTRAINT fk_rombel2kelas
FOREIGN KEY (kode_kelas) REFERENCES tbl_kelas(kode_kelas);

ALTER TABLE tbl_detailabsensi
ADD CONSTRAINT fk_absensi2rombel
FOREIGN KEY (kode_rombel) REFERENCES tbl_rombel(kode_rombel);

ALTER TABLE tbl_detailabsensi
ADD CONSTRAINT fk_absensi2jurusan
FOREIGN KEY (kode_jurusan) REFERENCES tbl_jurusan(kode_jurusan);

ALTER TABLE tbl_detailabsensi
ADD CONSTRAINT fk_absensi2datasiswa
FOREIGN KEY (id_siswa) REFERENCES tbl_datasiswa(id_siswa);
```

<img src="https://github.com/eljitech/campusystem/blob/master/picture/github/Screenshot%20from%202021-01-15%2014-49-22.png"/>

Tolong ditulis kedalam article jika sudah kirim ke email se.esemka@rbs.sch.id dengan subject pertemuan 15 jan 2021

### 18 Jan 2021 : Membangun Project Native API pada Webserver Local
* Re-konstruksi Database (<a href="https://github.com/eljitech/campusystem/blob/master/picture/github/Screenshot%20from%202021-01-18%2012-18-32.png">Update</a>)
* Membuat Table Mata Pelajaran dan Menambahkan beberapa Mata pelajaran & Merelasikan ke table Guru
* Membuat Table Presensi dan Detail absensi beserta Relasi
* Membuat Detail tampilan data dari Absensi Siswa & mengimplementasikannya kedalam File API dengan method Post

### Rilis Update : Bisa di download di link berikut
* <a href="https://github.com/eljitech/campusystem/releases/tag/150121.2">Pertemuan Terakhir 15 Januari 2021</a> : Update Struktur table Database db_presensi persiapan Membangun Native API. (<i>Unstable</i>)

### Documentation
Belum tersedia