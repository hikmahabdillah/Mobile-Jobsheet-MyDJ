class Jurnal {
  final DateTime _createdAt; // Untuk menyimpan waktu pembuatan jurnal
  String kelas;
  String mapel;
  int jam;
  String tujuanPembelajaran;
  String materiTopikPembelajaran;
  String kegiatanPembelajaran;
  String dimensiProfilPelajarPancasila;
  String fotoKegiatanPath =
      ''; // <-- Untuk menyimpan path ke foto kegiatan (opsional)
  String videoKegiatanPath =
      ''; // <-- Untuk menyimpan path ke video kegiatan (opsional)
  // Konstuktor dengan 'named parameters' dan default values.
  Jurnal({
    this.kelas = '',
    this.mapel = '',
    this.jam = 0,
    this.tujuanPembelajaran = '',
    this.materiTopikPembelajaran = '',
    this.kegiatanPembelajaran = '',
    this.dimensiProfilPelajarPancasila = '',
    this.fotoKegiatanPath = '',
    this.videoKegiatanPath = '',
  }) : _createdAt = DateTime.now(); // <-- Memberikan nilai terlebih dahulu
  // ke property _createdAt, sebelum konstruktor dijalankan.
  DateTime get createdAt => _createdAt;
}
