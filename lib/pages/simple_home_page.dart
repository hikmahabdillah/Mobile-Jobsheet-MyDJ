import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/data/login_info.dart';
import 'package:mydj_aldrin3a/pages/lihat_jurnal_page.dart';
import 'package:mydj_aldrin3a/pages/buat_jurnal_page.dart';
import 'package:mydj_aldrin3a/pages/akun_page.dart';
import 'package:mydj_aldrin3a/pages/tentang_aplikasi_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SimpleHomePageState();
  }
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  // @override
  // void initState() async {
  //   super.initState();
  //   LoginInfo dariSP = await LoginInfo.loadFromSharedPreferences();
  //   print("Isi login info dari shared preferences:");
  //   print(dariSP);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/KemendikbudLogo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {_openLihatJurnalPage(context)},
                  child: Text('Lihat Jurnal'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => {_openBuatJurnalPage(context)},
                  child: Text('Buat Jurnal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {_openAkunPage(context)},
                  child: Text('Akun'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => {_openTentangAplikasiPage(context)},
                  child: Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _openLihatJurnalPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LihatJurnalPage(title: 'Lihat Jurnal'),
    ),
  );
}

void _openBuatJurnalPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BuatJurnalPage(title: 'Buat Jurnal'),
    ),
  );
}

void _openAkunPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AkunPage(title: 'Akun')),
  );
}

void _openTentangAplikasiPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TentangAplikasiPage(title: 'Tentang Aplikasi'),
    ),
  );
}
