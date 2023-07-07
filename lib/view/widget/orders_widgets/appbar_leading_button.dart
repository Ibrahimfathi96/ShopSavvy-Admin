import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.offAllNamed(HomeScreen.routeName);
      },
      icon: Icon(
        Icons.home_outlined,
        size: 36,
        color: AppColors.primaryDark,
      ),
    );
  }
}
