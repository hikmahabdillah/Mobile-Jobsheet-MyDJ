import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/data/data_provider.dart';
import 'package:mydj_aldrin3a/pages/login_page.dart';
import 'package:mydj_aldrin3a/pages/simple_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // <-- Tambahkan ini.
      create: (context) => DataProvider(),
      child:
          const MyApp(), // <-- Sekarang widget utama aplikasi kita menjadi child dari Provider.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyDJ-Aldrin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
