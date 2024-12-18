UPDATE InfoAkun 

SET JumlahUser = JumlahUser - (
    
	SELECT COUNT(*)
    
	FROM Transaksi
    
	WHERE TanggalAkhir < GETDATE() 
	AND AkunId = InfoAkun.AkunID

	)

WHERE AkunID IN (
    
	SELECT AkunID
    
	FROM Transaksi
    
	WHERE TanggalAkhir < GETDATE()

	)

AND JumlahUser > 0;


UPDATE Akun
 SET Status = 'Tersedia'

WHERE AkunID IN (
    
	SELECT IA.AkunID
    
	FROM InfoAkun IA
    
	WHERE IA.JumlahUser < IA.MaksUser

	);

UPDATE Akun
 
SET Status = 'Penuh'

WHERE AkunID IN (
    
	SELECT IA.AkunID
    
	FROM InfoAkun IA
    
	WHERE IA.JumlahUser >= IA.MaksUser

	);

UPDATE Transaksi
SET MasaSewa = 'Non-Aktif'
WHERE TanggalAkhir < GETDATE();