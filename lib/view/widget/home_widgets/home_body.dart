import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/home_controllers/home_controller.dart';

class HomeBody extends GetView<HomePageController> {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: controller.gridViewList,
      ),
    );
  }
}
