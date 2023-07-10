import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(20),
                onPressed: (context) {
                  controller.deleteCategory(categoriesMD.categoriesId.toString(),
                      categoriesMD.categoriesImage!);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: "Delete",
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
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
                  Icon(
                    Icons.arrow_right,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
