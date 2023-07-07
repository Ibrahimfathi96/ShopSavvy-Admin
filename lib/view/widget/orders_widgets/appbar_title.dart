import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Orders",
      style: TextStyle(
        fontSize: 24,
        color: AppColors.primaryDark,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
