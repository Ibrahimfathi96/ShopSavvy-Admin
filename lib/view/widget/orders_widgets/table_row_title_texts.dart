import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class TableTitleTexts extends StatelessWidget {
  final String text;
  final bool titleText;

  const TableTitleTexts({
    super.key,
    required this.text,
    this.titleText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: titleText ? FontWeight.bold : FontWeight.w600,
          fontSize: 16,
          color: titleText ? AppColors.secondaryColor : AppColors.primaryDark,
        ),
      ),
    );
  }
}
