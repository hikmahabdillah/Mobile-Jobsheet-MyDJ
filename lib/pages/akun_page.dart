import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;
  @override
  State<AkunPage> createState() {
    return _AkunPageState();
  }
}

class _AkunPageState extends State<AkunPage> {
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
            Text('Informasi akun pengguna akan ditampilkan di sini.'),
            SizedBox(height: 8),
            // Placeholder: nanti bisa ditambah profil / pengaturan
          ],
        ),
      ),
    );
  }
}
