import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/data/model/items_model.dart';
import 'package:shop_savvy_admin/link_api.dart';

class CustomItemCard extends GetView<ViewItemsController> {
  final void Function() onTap;
  final ItemsMd itemsMd;

  const CustomItemCard({
    super.key,
    required this.itemsMd,
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
                  controller.deleteCategory(
                      itemsMd.itemsId.toString(), itemsMd.itemsImage!);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: "Delete",
              ),
            ],
          ),
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
                  width: 10,
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/${itemsMd.itemsImage}",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: Marquee(
                        text: itemsMd.itemsName!,
                        velocity: 30,
                        blankSpace: 50,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      itemsMd.categoriesName!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryDark.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    controller.goToEditPage(itemsMd);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Edit",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
