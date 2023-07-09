import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class GridViewItem extends StatelessWidget {
  final String titleText;
  final String imageUrl;
  final void Function() onTap;

  const GridViewItem({
    super.key,
    required this.titleText,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: 90,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                titleText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
