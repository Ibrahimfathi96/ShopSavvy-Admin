import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/generated/assets.dart';
import 'package:shop_savvy_admin/view/screen/items/add_item.dart';
import 'package:shop_savvy_admin/view/widget/categories/add_new_category_card_widget.dart';
import 'package:shop_savvy_admin/view/widget/items_widgets/custom_item_card.dart';

class ItemsView extends StatelessWidget {
  static const String routeName = '/item-view';

  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddNewCategoryCustomCard(
              imageUrl: Assets.imagesItems,
              title: "New Item",
              onTap: () {
                Get.toNamed(AddItems.routeName);
              },
            ),
            Expanded(
              child: GetBuilder<ViewItemsController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                    onWillPop: () => controller.myBack(),
                    child: Container(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CustomItemCard(
                          onTap: () {},
                          itemsMd: controller.data[index],
                        ),
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
