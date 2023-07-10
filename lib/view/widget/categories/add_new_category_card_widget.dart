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
    return Card(
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
              width: 30,
            ),
            Text(
              "New Category",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed(AddCategoryView.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
