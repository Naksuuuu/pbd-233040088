SELECT nama_mata_kuliah, dosen_pengajar
FROM jadwal_mata_kuliah
WHERE dosen_pengajar LIKE 'Ang%'
ORDER BY dosen_pengajar ASC