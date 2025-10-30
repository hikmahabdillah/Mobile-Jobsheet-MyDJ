class Jurnal {
  final DateTime _createdAt; // Untuk menyimpan waktu pembuatan jurnal
  String kelas;
  String mapel;
  int jam;
  String tujuanPembelajaran;
  String materiTopikPembelajaran;
  String kegiatanPembelajaran;
  String dimensiProfilPelajarPancasila;
  // Konstuktor dengan 'named parameters' dan default values.
  Jurnal({
    this.kelas = '',
    this.mapel = '',
    this.jam = 0,
    this.tujuanPembelajaran = '',
    this.materiTopikPembelajaran = '',
    this.kegiatanPembelajaran = '',
    this.dimensiProfilPelajarPancasila = '',
  }) : _createdAt = DateTime.now(); // <-- Memberikan nilai terlebih dahulu
  // ke property _createdAt, sebelum konstruktor dijalankan.
  DateTime get createdAt => _createdAt;
}
