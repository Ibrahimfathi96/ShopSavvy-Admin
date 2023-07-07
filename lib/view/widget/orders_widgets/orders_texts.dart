import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class OrdersRowOfText extends StatelessWidget {
  final String text1;
  final String text2;

  const OrdersRowOfText({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
