import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/categories_controller/categories_view_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/link_api.dart';
import 'package:shop_savvy_admin/view/widget/categories/add_new_category_card_widget.dart';
import 'package:shop_savvy_admin/view/widget/categories/custom_category_card.dart';

class CategoriesView extends StatelessWidget {
  static const String routeName = '/category-view';

  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddNewCategoryCustomCard(),
            Expanded(
              child: GetBuilder<ViewCategoriesController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CustomCategoryCard(
                        onTap: () {},
                        text: controller.data[index].categoriesName!,
                        imageUrl:
                            "${AppLink.imagesCategories}/${controller.data[index].categoriesImage}",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
