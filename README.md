Halo, ini project baru kita, membangun aplikasi presensi untuk sekolah kita.

### 12 Jan 2021 : Preapre & Normalisasi Database	
Tugas 1 Membuat Article dari Awal sampai Membuat Database & Table dibawah ini, Dikirim ke email se.esemka@rbs.sch.id, dengan subject, Pakai email SMK, jangan yang lain.
```.sql
tbl_tahunajaran         tipe
kode_tahunajaran    varchar(60) PK
tahunajaran	            TEXT
date_created	        timestamp
	
tbl_jenjang	tipe
kode_jenjang	varchar(60) 
jenjang	TEXT
date_created	timestamp
	
tbl_kelas	tipe
kode_kelas	varchar(60) 
kelas	TEXT
date_created	timestamp
	
tbl_jurusan	tipe
kode_jurusan	varchar(60) 
jurusan	TEXT
date_created	timestamp
	
tbl_rombel	tipe
kode_rombel	varchar(60) PK
rombel_kelas	TEXT
id_guru	integer 11 PK FK
kode_tahunajaran	varchar(60) PK FK
kode_jenjang	varchar(60) PK FK
kode_kelas	varchar(60) PK FK
kode_jurusan	varchar(60) PK FK
	
tbl_datasiswa	tipe
id_siswa	integer 11 AI PK
nis	TEXT
nama_siswa	TEXT
jenis_kelamin	TEXT
date_created	timestamp
	
tbl_detailabsensi	tipe
kode_absensi	varchar(60) PK
kode_rombel	varchar(60) PK FK
id_siswa	integer 11
kehadiran	TEXT
date_created	timestamp
	
tbl_guru	tipe
id_guru	integer 11 AI PK
nip	TEXT
nama_guru	TEXT
jenis_kelamin	TEXT
date_created	timestamp
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
