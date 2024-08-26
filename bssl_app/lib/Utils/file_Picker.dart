// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadFiles {
  bool isLoading = false;
  Future<void> addPdf() async {
    FilePickerResult? pdf = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (pdf != null) {
      PlatformFile file = pdf.files.first;
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
        content: Text('File uploaded successfully!'),
      ));
    }
  }
}
