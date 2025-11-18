import 'package:flutter/cupertino.dart';
import 'package:mydj_aldrin3a/data/jurnal.dart';
import 'package:mydj_aldrin3a/data/login_info.dart';

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];
  void addNew(Jurnal jurnal) // <-- Method untuk menambahkan entri jurnal
  {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan {
    return List.unmodifiable(
      _jurnalTersimpan,
    ); // <-- Getter untuk membaca daftar jurnal
  }

  // Cek sudah login atau belum
  Future<bool> isLoggedIn() async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    return loginInfo.isLoggedIn;
  }

  // Simpan informasi sesi ketika login
  Future<void> saveLoginInfo(String username, String password) async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    // Isi
    loginInfo.username = username;
    loginInfo.password = password;
    loginInfo.isLoggedIn = true;
    // Simpan
    loginInfo.saveToSharedPreferences();
  }
}
