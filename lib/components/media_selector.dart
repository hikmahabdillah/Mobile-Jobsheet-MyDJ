import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydj_aldrin3a/components/video_preview.dart';

// Tipe data enum untuk menentukan pilihan apakah foto atau video.
enum MediaType { photo, video }

// Class yang nantinya dipanggil dari halaman lain yang membutuhkan komponen pilih media.
class MediaSelector extends StatefulWidget {
  final MediaType mediaType;
  const MediaSelector({super.key, this.mediaType = MediaType.photo});
  @override
  State<StatefulWidget> createState() {
    return _MediaSelectorState();
  }
}

// Class state seperti biasa..
class _MediaSelectorState extends State<MediaSelector> {
  Future<XFile?> _retrieveMedia(ImageSource source) async {
    final picker = ImagePicker();
    XFile? media;
    if (widget.mediaType == MediaType.photo) {
      media = await picker.pickImage(source: source);
    } else {
      media = await picker.pickVideo(source: source);
    }
    return media;
  }

  // Memilih media dari kamera.
  void _selectFromCamera() async {
    XFile? media = await _retrieveMedia(ImageSource.camera);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  // Memilih media dari galeri.
  void _selectFromGallery() async {
    XFile? media = await _retrieveMedia(ImageSource.gallery);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  // Menghilangkan tampilan media yang dipilih.
  void _deleteSelected() {
    setState(() {
      _mediaPath = '';
    });
  }

  Widget _mediaPlaceholder() {
    Icon icon;
    String caption = '';
    Widget placeholderWidget;
    if (widget.mediaType == MediaType.photo) {
      icon = Icon(Icons.image_not_supported, color: Colors.grey);
      caption = 'No photo';
      placeholderWidget = Image.file(
        File(_mediaPath),
        width: double.infinity, // <-- Isi penuh parent
        fit: BoxFit.fitWidth, // <-- Tinggi otomatis sesuai rasio
      );
    } else {
      icon = Icon(Icons.videocam_off, color: Colors.grey);
      caption = 'No video';
      placeholderWidget = VideoPreview(
        path: _mediaPath,
      ); // <-- Di sini, `Column()` Kita ganti dengan widget yang kita buat tadi.
    }
    // Jika path kosong, tampilkan "No Photo/Video".
    if (_mediaPath.isEmpty) {
      return SizedBox(
        height: 56, // <-- Tinggi default TextField
        child: Row(children: [icon, SizedBox(width: 8), Text(caption)]),
      );
    }
    // Jika path ada isinya, tampilkan medianya.
    else {
      return SizedBox(width: double.infinity, child: placeholderWidget);
    }
  }

  String _mediaPath =
      ''; // <-- Untuk menyimpan path ke media yang dipilih pengguna
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child:
                    _mediaPlaceholder(), // <-- Fungsi yang kita buat tadi dipanggil di sini.
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        child: Icon(Icons.photo_camera),
                        onPressed: () {
                          _selectFromCamera();
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        child: Icon(Icons.photo_library),
                        onPressed: () {
                          _selectFromGallery();
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        child: Icon(Icons.delete),
                        onPressed: () {
                          _deleteSelected();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
