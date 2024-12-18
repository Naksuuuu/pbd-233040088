CREATE TABLE Mahasiswa (
ID INT IDENTITY(1,1) PRIMARY KEY, 
Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Tanggal_lahir DATE
)

CREATE TABLE Account (
	AccountID INT IDENTITY(1,1) PRIMARY KEY,
	ID INT UNIQUE FOREIGN KEY REFERENCES Mahasiswa(ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Email VARCHAR(255),
	Password Varchar(255)
)


INSERT INTO Mahasiswa (Name, Email, Tanggal_lahir)
VALUES ('Kusuma', 'arielkusuma17@gmail.com', '2004-12-17' ) 


CREATE OR  ALTER VIEW semuaMahasiswa AS 
SELECT * FROM Mahasiswa

SELECT * FROM semuaMahasiswa


CREATE OR ALTER PROCEDURE SP_semuaMahasiswa
	@ID INT,
	@Name VARCHAR(255)


AS 
BEGIN

	IF EXISTS (SELECT 1 FROM Mahasiswa WHERE ID = @ID)

		BEGIN
		UPDATE Mahasiswa
		SET Name = @Name
		WHERE ID = @ID;
		PRINT 'Mahasiswa telah di perbarui'
		END

END


EXEC SP_semuaMahasiswa 
	@ID = 2,
	@Name = Wijaya



	DBCC CHECKIDENT ('Mahasiswa', RESEED, 3);


	-- RESET AUTO_INCREMENT nama tabel = idnya (0)




CREATE OR ALTER TRIGGER menambahDataakun
ON mahasiswa
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	--menambah data ke akun
	INSERT INTO Account (ID, Email)
	SELECT
		ID, Email
	FROM inserted;

	PRINT 'Data akun telah dibuat';
	
	--query


END


CREATE OR ALTER PROCEDURE tambahMahasiswaBaru
	@name VARCHAR(255),
	@email VARCHAR(255),
	@date DATE
AS
BEGIN

INSERT INTO Mahasiswa (Name, Email, Tanggal_lahir)
VALUES (@name, @email, @date)

END


EXEC tambahMahasiswaBaru
@name = 'tes',
@email = 'tes@gmail.com',
@date = '2000-10-10'


