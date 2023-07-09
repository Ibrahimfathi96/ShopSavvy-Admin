import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy_admin/view/widget/home_widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-view';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShopSavvy Admin',
        ),
      ),
      body: HomeBody(),
    );
  }
}
