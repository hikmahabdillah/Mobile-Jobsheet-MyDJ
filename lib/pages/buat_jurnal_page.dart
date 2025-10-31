import 'package:flutter/material.dart';
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

  void _saveJurnal(BuildContext context) {
    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
    );
    DataProvider provider = context.read<DataProvider>();
    provider.addNew(jurnal);
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
