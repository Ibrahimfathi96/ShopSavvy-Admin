import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/view/screen/auth/sign_in.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.prefs.getString("step") == "2"){
      return const RouteSettings(name: HomeScreen.routeName);
    }
    if(myServices.prefs.getString("step") == "1"){
      return const RouteSettings(name: SignIn.routeName);
    }
    return null;
  }
}
