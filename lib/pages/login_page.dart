import 'package:flutter/material.dart';
import 'package:mydj_aldrin3a/components/password_field.dart';
import 'package:mydj_aldrin3a/pages/simple_home_page.dart';

class LoginPage extends StatefulWidget {
  final String title = 'MyDJ - Welcome';
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = ''; // <-- Nantinya digunakan untuk menyimpan username
  String sandi = ''; // <-- Yang ini digunakan untuk menyimpan password

  void login(BuildContext context) {
    if (namaPengguna == 'guru' && sandi == 'guru') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SimpleHomePage(title: 'Beranda'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    width: 250,
                  ), // <-- Menampilkan gambar login
                  SizedBox(height: 20),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Username:"),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      // contentPadding: const EdgeInsets.only(
                      //   left: 10,
                      //   top: 20,
                      //   bottom: 20,
                      //   right: 10,
                      // ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        namaPengguna = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text("Password:"),
                  SizedBox(height: 10),
                  PasswordField(
                    onChanged: (value) => {
                      setState(() {
                        sandi = value;
                      }),
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      login(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
