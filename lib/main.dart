import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/pages/simple_home_page.dart';

void main() {
  runApp(const MyApp());
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
      home: const SimpleHomePage(title: 'Jurnal Harian Guru'),
    );
  }
}
