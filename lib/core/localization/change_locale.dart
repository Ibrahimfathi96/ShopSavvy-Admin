import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/constants/theme.dart';
import 'package:shop_savvy_admin/core/functions/fcm_config.dart';
import 'package:shop_savvy_admin/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? startingLanguage;

  MyServices myServices = Get.find();

  ThemeData appTheme = englishTheme;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.prefs.setString("lang", langCode);
    appTheme = langCode == 'ar' ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestLocationPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Alert", "Please Enable your location Services.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Alert", "Please Give us your location Permissions.");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning", "You can't use the application without location permissions.");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestLocationPermissions();
    String? langPrefs = myServices.prefs.getString("lang");
    if (langPrefs == "ar") {
      startingLanguage = const Locale("ar");
      appTheme = arabicTheme;
    } else if (langPrefs == "en") {
      startingLanguage = const Locale("en");
      appTheme = englishTheme;
    } else {
      startingLanguage = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
