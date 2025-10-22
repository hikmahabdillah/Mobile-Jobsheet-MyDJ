import 'package:flutter/material.dart';

class BuatJurnalPage extends StatefulWidget {
  const BuatJurnalPage({super.key, required this.title});
  final String title;
  @override
  State<BuatJurnalPage> createState() {
    return _BuatJurnalPageState();
  }
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
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
            Text('Form pembuatan jurnal akan ditampilkan di sini.'),
            SizedBox(height: 8),
            // Placeholder: nanti bisa ditambah TextField / Form
          ],
        ),
      ),
    );
  }
}
