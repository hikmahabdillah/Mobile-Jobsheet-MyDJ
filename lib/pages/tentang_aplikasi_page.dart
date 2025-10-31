import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TentangAplikasiPage extends StatefulWidget {
  const TentangAplikasiPage({super.key, required this.title});
  final String title;
  @override
  State<TentangAplikasiPage> createState() {
    return _TentangAplikasiPageState();
  }
}

class _TentangAplikasiPageState extends State<TentangAplikasiPage> {
  // ubah URL menjadi dengan slash akhir sesuai permintaan
  final Uri _url = Uri.parse('https://hikmahald.netlify.app/');

  // tambahkan method untuk membuka URL
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat membuka tautan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'MyDJ',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Text(
                'Aplikasi Jurnal Harian Guru',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 5),
              Text(
                'Version: 0.1 (Beta)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 1),
              Text(
                'Dibuat oleh:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 1),
              Text(
                'Hikmah Aldrin Abdillah',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1),
              Text(
                'hikmahaldrin44@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              // Ganti Text biasa dengan InkWell agar dapat diklik
              InkWell(
                onTap: _launchUrl,
                child: Text(
                  'https://hikmahald.netlify.app',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
