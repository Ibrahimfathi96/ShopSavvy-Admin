import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class CustomCategoryCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final void Function() onTap;

  const CustomCategoryCard({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: SvgPicture.network(
                  imageUrl,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_right,
                size: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
