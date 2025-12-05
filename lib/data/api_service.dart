import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'jurnal.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000";

  Future<void> uploadJurnal(Jurnal jurnal) async {
    final url = Uri.parse("$baseUrl/upload-jurnal");
    var request = http.MultipartRequest("POST", url);
    // -----------------------------
    // 1) Kirim field Teks
    // -----------------------------
    request.fields['kelas'] = jurnal.kelas;
    request.fields['mapel'] = jurnal.mapel;
    request.fields['jam'] = jurnal.jam.toString();
    request.fields['tujuanPembelajaran'] = jurnal.tujuanPembelajaran;
    request.fields['materiTopikPembelajaran'] = jurnal.materiTopikPembelajaran;
    request.fields['kegiatanPembelajaran'] = jurnal.kegiatanPembelajaran;
    request.fields['dimensiProfilPelajarPancasila'] =
        jurnal.dimensiProfilPelajarPancasila;
    // CreatedAt → ISO 8601 string
    request.fields['createdAt'] = jurnal.createdAt.toIso8601String();

    // -----------------------------
    // 2) Kirim file Foto (opsional)
    // -----------------------------
    if (jurnal.fotoKegiatanPath.isNotEmpty) {
      // Ubah file foto jadi multipart
      http.MultipartFile imageData = await http.MultipartFile.fromPath(
        'image',
        jurnal.fotoKegiatanPath,
        filename: File(jurnal.fotoKegiatanPath).uri.pathSegments.last,
      );
      // Tambahkan ke request
      request.files.add(imageData);
    }
    // -----------------------------

    // 3) Kirim file Video (opsional)
    // -----------------------------
    if (jurnal.videoKegiatanPath.isNotEmpty) {
      // Ubah file video jadi multipart
      http.MultipartFile videoData = await http.MultipartFile.fromPath(
        'video',
        jurnal.videoKegiatanPath,
        filename: File(jurnal.videoKegiatanPath).uri.pathSegments.last,
      );
      // Tambahkan ke request
      request.files.add(videoData);
    }

    // -----------------------------
    // 4) Kirim request
    // -----------------------------
    // Kirim!
    http.StreamedResponse response = await request.send();
    // Baca respon -> String JSON

    String responseBody = await response.stream.bytesToString();
    // Gunakan kode di bawah ini untuk parse String JSON (jika dibutuhkan)
    // Map<String, dynamic> responseData = jsonDecode(responseBody);
    if (response.statusCode != 200) {
      throw Exception(
        "Gagal upload jurnal: ${response.statusCode}\n$responseBody",
      );
    } else {
      print("Upload sukses: $responseBody");
    }
  }
}
