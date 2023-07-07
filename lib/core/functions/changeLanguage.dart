import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/localization/change_locale.dart';

changeLanguage(BuildContext context) {
  LocaleController controller = Get.put(LocaleController());

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        "1".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.darkColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: Alignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.changeLanguage("ar");
                  Get.back();
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      child: Image.asset(
                        "assets/flags/sa.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "العربية",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changeLanguage("en");
                  Get.back();
                },
                child: Row(
                  children: [
                    const Text(
                      "English",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 10,
                      child: Image.asset(
                        "assets/flags/en.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
