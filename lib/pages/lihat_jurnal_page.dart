import 'package:flutter/material.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title});
  final String title;
  @override
  State<LihatJurnalPage> createState() {
    return _LihatJurnalPageState();
  }
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Informasi jurnal akan ditampilkan di sini.'),
            SizedBox(height: 8),
            // Placeholder: nanti bisa ditambah profil / pengaturan
          ],
        ),
      ),
    );
  }
}
