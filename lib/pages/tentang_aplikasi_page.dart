import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatefulWidget {
  const TentangAplikasiPage({super.key, required this.title});
  final String title;
  @override
  State<TentangAplikasiPage> createState() {
    return _TentangAplikasiPageState();
  }
}

class _TentangAplikasiPageState extends State<TentangAplikasiPage> {
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
                'Tentang Aplikasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Deskripsi singkat aplikasi dapat ditampilkan di sini.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
