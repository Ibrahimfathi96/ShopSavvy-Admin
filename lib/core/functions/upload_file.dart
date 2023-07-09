import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

uploadImageFromCamera() async {
  XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 100,
  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

uploadImageFromGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? [
            "svg",
            "SVG",
          ]
        : [
            "png",
            "PNG",
            "jpg",
            "JPG",
            "gif",
            "GIF",
            "jpeg",
            "JPEG",
            "pdf",
            "PDF",
          ],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
