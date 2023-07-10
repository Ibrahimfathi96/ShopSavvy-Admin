import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/generated/assets.dart';
import 'package:shop_savvy_admin/view/screen/categories/category_view.dart';
import 'package:shop_savvy_admin/view/screen/items/item_view.dart';
import 'package:shop_savvy_admin/view/widget/home_widgets/gridview_item.dart';

class HomePageController extends GetxController {
  List<Widget> gridViewList = [
    GridViewItem(
      onTap: () {},
      titleText: "Admin",
      imageUrl: Assets.imagesAdminIcon,
    ),
    GridViewItem(
      onTap: () {
        Get.toNamed(CategoriesView.routeName);
      },
      titleText: "Categories",
      imageUrl: Assets.imagesCategory,
    ),
    GridViewItem(
      onTap: () {
        Get.toNamed(ItemsView.routeName);
      },
      titleText: "Products",
      imageUrl: Assets.imagesItems,
    ),
    GridViewItem(
      onTap: () {},
      titleText: "Delivery",
      imageUrl: Assets.imagesDelivery,
    ),
    GridViewItem(
      onTap: () {},
      titleText: "Orders",
      imageUrl: Assets.imagesOrders,
    ),
    GridViewItem(
      onTap: () {},
      titleText: "Reports",
      imageUrl: Assets.imagesReports,
    ),
    GridViewItem(
      onTap: () {},
      titleText: "Alerts",
      imageUrl: Assets.imagesNotifications,
    ),
  ];
}
