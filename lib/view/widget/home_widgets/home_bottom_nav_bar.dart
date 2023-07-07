import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class CustomHomeBottomNavBar extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final IconData? icon;
  final bool? isActive;

  const CustomHomeBottomNavBar({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.icon,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      enableFeedback: false,
      minWidth: 70,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive == true ? AppColors.brightYellow : Colors.white,
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: isActive == true ? AppColors.brightYellow:Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
