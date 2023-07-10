import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/generated/assets.dart';
import 'package:shop_savvy_admin/view/categories/add_category_view.dart';

class AddNewCategoryCustomCard extends StatelessWidget {
  const AddNewCategoryCustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AddCategoryView.routeName);
      },
      child: Card(
        margin: EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(
                Assets.imagesCategory,
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                "Add Category",
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
