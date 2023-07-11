import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

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

showBottomMenu(uploadImageFromCamera(), uploadImageFromGallery()) {
  Get.bottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    Container(
      padding: EdgeInsets.all(10),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              "Choose Item Image",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 20,),
                InkWell(
                  onTap: () {
                    uploadImageFromCamera();
                    Get.back();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryDark,
                        size: 40,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryDark,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    uploadImageFromGallery();
                    Get.back();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        color: AppColors.primaryDark,
                        size: 40,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryDark,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
  );
}
