import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class OrderName extends StatelessWidget {
  final String orderName;

  const OrderName({super.key, required this.orderName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          orderName,
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
