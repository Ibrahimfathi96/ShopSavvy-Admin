import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Get.offAllNamed(HomeScreen.routeName);
      },
      icon: Icon(
        Icons.home_outlined,
        size: 36,
        color: AppColors.primaryDark,
      ),
    );
  }
}
