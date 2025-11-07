import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/components/password_field.dart';

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
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ganti Sandi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2),
            SizedBox(height: 10),
            Text('Sandi Saat Ini'),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 10),
            Text('Sandi Baru'),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 10),
            Text('Konfirmasi Sandi Baru'),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  //
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Simpan", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Keluar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 3),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  //
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Keluar dari Aplikasi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
