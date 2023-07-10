import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/categories_controller/categories_view_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
import 'package:shop_savvy_admin/link_api.dart';

class CustomCategoryCard extends GetView<ViewCategoriesController> {
  final void Function() onTap;
  final CategoriesMD categoriesMD;

  const CustomCategoryCard({
    super.key,
    required this.categoriesMD,
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
                  "${AppLink.imagesCategories}/${categoriesMD.categoriesImage}",
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                categoriesMD.categoriesName!,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Warning",
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.secondaryColor,
                    ),
                    middleText:
                        "Are you sure, you want to delete this category?",
                    middleTextStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryDark,
                    ),
                    onCancel: () {},
                    onConfirm: () {
                      controller.deleteCategory(categoriesMD.categoriesId.toString(),
                          categoriesMD.categoriesImage!);
                      Get.back();
                    },
                    buttonColor: AppColors.secondaryColor,
                    confirmTextColor: Colors.white,
                    cancelTextColor: AppColors.primaryDark,
                  );
                },
                icon: Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                  size: 36,
                ),
              ),
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
