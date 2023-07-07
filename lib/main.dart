import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/localization/change_locale.dart';
import 'package:shop_savvy_admin/core/localization/translations.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/initial_binding.dart';
import 'package:shop_savvy_admin/routes.dart';


void main() async {
  await initServices();
  runApp(const ShopSavvyAdmin());
}

class ShopSavvyAdmin extends StatelessWidget {
  const ShopSavvyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: localeController.startingLanguage,
      title: 'ShopSavvy Admin',
      theme: localeController.appTheme,
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
