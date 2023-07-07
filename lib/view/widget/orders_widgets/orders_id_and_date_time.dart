import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class OrdersTimeAndId extends StatelessWidget {
  final num orderId;
  final String orderDateTime;

  const OrdersTimeAndId({
    super.key,
    required this.orderId,
    required this.orderDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order No.$orderId",
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          orderDateTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
