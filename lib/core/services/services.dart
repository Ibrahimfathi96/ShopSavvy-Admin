import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_savvy_admin/firebase_options.dart';


class MyServices extends GetxService{
  late SharedPreferences prefs;
  Future<MyServices> init()async{
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return this;
  }
}

initServices()async{
  await Get.putAsync(() => MyServices().init());
}