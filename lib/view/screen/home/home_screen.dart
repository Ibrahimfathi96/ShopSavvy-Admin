import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy_admin/core/functions/exit_app_alert.dart';
import 'package:shop_savvy_admin/view/widget/home_widgets/home_bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-view';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomHomeBottomAppBar(),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: exitAppAlertDialog,
            child: controller.pagesList[controller.currentIndex],
          ),
        ),
      ),
    );
  }
}
