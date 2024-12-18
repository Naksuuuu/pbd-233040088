CREATE TRIGGER CekMaksUser
ON Transaksi
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @AkunId INT;
    DECLARE @JumlahUser INT;
    DECLARE @MaksUser INT;

    -- Mendapatkan AkunID dari transaksi yang akan diinsert
    SET @AkunId = (SELECT AkunId FROM inserted);

    -- Mendapatkan JumlahUser dan MaksUser dari InfoAkun
    SELECT @JumlahUser = JumlahUser, @MaksUser = MaksUser
    FROM InfoAkun
    WHERE AkunId = @AkunId;

    -- Cek apakah jumlah user sudah mencapai MaksUser
    IF @JumlahUser >= @MaksUser
    BEGIN
        -- Batalkan transaksi jika jumlah user mencapai batas maksimum
        RAISERROR ('Jumlah user pada akun ini sudah mencapai batas maksimum.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        -- Jika belum mencapai maksimum, insert transaksi
        INSERT INTO Transaksi (UserId, AkunId, PaketId, TanggalMulai, TanggalAkhir)
        SELECT UserId, AkunId, PaketId, TanggalMulai, TanggalAkhir FROM inserted;

        -- Update JumlahUser di InfoAkun
        UPDATE InfoAkun
        SET JumlahUser = JumlahUser + 1
        WHERE AkunId = @AkunId;

        -- Jika setelah insert JumlahUser mencapai MaksUser, update status akun menjadi 'Penuh'
        IF (@JumlahUser + 1) >= @MaksUser
        BEGIN
            UPDATE Akun
            SET Status = 'Penuh'
            WHERE AkunId = @AkunId;
        END
    END
END;