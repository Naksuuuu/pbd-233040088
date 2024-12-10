CREATE TABLE jurusan (
	id bigINT IDENTITY(1,1) PRIMARY KEY,
	nama_jurusan bigint
)

CREATE TABLE Dosen_Wali (
	id bigINT IDENTITY(1,1) PRIMARY KEY,
	NIP bigINT,
	nama VARCHAR(255),
	tanggal_lahir DATE,
	alamat VARCHAR(255)
)

CREATE TABLE Mahasiswa (
	id bigINT IDENTITY(1,1) PRIMARY KEY,
	NPM bigINT,
	nama VARCHAR(255),
	tanggal_lahir DATE,
	alamat VARCHAR(255),
	no_hp int,
	jurusan_id bigint,    
	dosen_wali_id bigint,  
    FOREIGN KEY (jurusan_id) REFERENCES jurusan(id),
    FOREIGN KEY (dosen_wali_id) REFERENCES dosen_wali(id)
)