Halo, ini project baru kita, membangun aplikasi presensi untuk sekolah kita.

### 12 Jan 2021 : Preapre & Normalisasi Database	
```.sql
tbl_tahunajaran	tipe
kode_tahunajaran	varchar(60) PK
tahunajaran	TEXT
date_created	timestamp
	
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
