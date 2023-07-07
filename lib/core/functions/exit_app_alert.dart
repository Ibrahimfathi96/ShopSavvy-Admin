import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

Future<bool> exitAppAlert() {
  Get.defaultDialog(
    title: "50".tr,
    middleText: "51".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          "52".tr,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "53".tr,
        ),
      ),
    ],
  );
  return Future.value(true);
}

Future<bool> exitAppAlertDialog() {
  Get.defaultDialog(
    title: "Alert!",
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.secondaryColor,
    ),
    middleText: "Do you want to exit the application?",
    middleTextStyle: TextStyle(
      fontSize: 16,
      color: AppColors.primaryDark,
    ),
    onConfirm: () => exit(0),
    buttonColor: AppColors.secondaryColor,
    confirmTextColor: Colors.white,
    cancelTextColor: AppColors.primaryDark,
    onCancel: () {},
  );
  return Future.value(false);
}
