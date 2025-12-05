import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/components/media_selector.dart';
import 'package:mydj_aldrin3a/data/api_service.dart';
import 'package:mydj_aldrin3a/data/data_provider.dart';
import 'package:mydj_aldrin3a/data/jurnal.dart';
import 'package:provider/provider.dart';

class BuatJurnalPage extends StatefulWidget {
  final String title = 'Buat Jurnal';
  const BuatJurnalPage({super.key, required String title});
  @override
  State<StatefulWidget> createState() {
    return _BuatJurnalPageState();
  }
}

Widget _textArea(
  String label,
  String hint,
  void Function(String text) onChanged,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hint,
        ),
        maxLines: 4,
        onChanged: onChanged,
      ),
    ],
  );
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';
  String fotoKegiatanPath = '';
  String videoKegiatanPath = '';

  void _saveJurnal(BuildContext context) {
    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
      // Tambahkan 2 baris berikut:
      fotoKegiatanPath: fotoKegiatanPath,
      videoKegiatanPath: videoKegiatanPath,
    );
    DataProvider provider = context.read<DataProvider>();
    provider.addNew(jurnal);
    _uploadJurnal(context, jurnal); // <-- Dan tambahkan ini juga.
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Berhasil"),
          content: const Text("Data jurnal berhasil disubmit!"),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // tutup dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _uploadJurnal(BuildContext context, Jurnal jurnal) async {
    // Upload
    try {
      await ApiService().uploadJurnal(jurnal);
      if (context.mounted) {
        await _showSuccessDialog(context);
      }
    } catch (e) {
      print("Error upload: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kelas:'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Kelas',
                ),
                onChanged: (value) {
                  setState(() {
                    kelas = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Nama Mapel'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama Mapel',
                ),
                onChanged: (value) {
                  setState(() {
                    mapel = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Jam Ke-'),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pilih Jam',
                ),
                items: [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                  DropdownMenuItem(value: '6', child: Text('6')),
                  DropdownMenuItem(value: '7', child: Text('7')),
                  DropdownMenuItem(value: '8', child: Text('8')),
                ],
                onChanged: (value) {
                  setState(() {
                    jamKe = value != null ? int.parse(value) : 0;
                  });
                },
              ),
              SizedBox(height: 10),
              _textArea('Tujuan Pembelajaran', 'Masukkan Tujuan Pembelajaran', (
                text,
              ) {
                setState(() {
                  tujuanPembelajaran = text;
                });
              }),
              SizedBox(height: 10),
              _textArea(
                'Materi/Topik Pembelajaran',
                'Masukkan Materi/Topik Pembelajaran',
                (text) {
                  setState(() {
                    materiTopikPembelajaran = text;
                  });
                },
              ),
              SizedBox(height: 10),
              _textArea(
                'Kegiatan Pembelajaran',
                'Masukkan Kegiatan Pembelajaran',
                (text) {
                  setState(() {
                    kegiatanPembelajaran = text;
                  });
                },
              ),
              SizedBox(height: 10),
              _textArea(
                'Dimensi Profil Pelajar Pancasila',
                'Tuliskan Dimensi Profil Pelajar Pancasila',
                (text) {
                  setState(() {
                    dimensiProfilPelajarPancasila = text;
                  });
                },
              ),
              SizedBox(height: 10),
              _textArea(
                'Dimensi Profil Pelajar Pancasila',
                'Tuliskan Dimensi Profil Pelajar Pancasila',
                (text) {
                  dimensiProfilPelajarPancasila = text;
                },
              ),
              SizedBox(height: 10),
              Text('Foto Kegiatan'),
              SizedBox(height: 10),
              MediaSelector(
                onMediaChanged: (mediaPath) {
                  // <-- Kita tambahkan ini.
                  setState(() {
                    fotoKegiatanPath = mediaPath;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Video Kegiatan'),
              SizedBox(height: 10),
              MediaSelector(
                mediaType: MediaType.video,
                onMediaChanged: (mediaPath) {
                  // <-- Dan ini juga.
                  setState(() {
                    videoKegiatanPath = mediaPath;
                  });
                },
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () => {_saveJurnal(context)},
              //     child: Text('Simpan'),
              //   ),
              // ),
              SizedBox(height: 10),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => {
                        _saveJurnal(context),
                      }, // <-- Panggil fungsi yang kitabuat tadi.
                      child: Text('Simpan'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        ); // Cancel: kembali tanpa menyimpan
                      }, // <-- Panggil fungsi yang kitabuat tadi.
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
