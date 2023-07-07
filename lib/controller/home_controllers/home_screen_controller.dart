import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/view/screen/orders_view/myorders_view.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentIndex = 0;

  List<Widget> pagesList = [
    MyOrdersView(),
    Container(
      color: Colors.red,
      child: Text("Settings"),
    ),
  ];

  List bottomAppbar = [
    {"title": "Orders", "icon": Icons.shopping_cart},
    {"title": "Settings", "icon": Icons.settings}
  ];

  @override
  changePage(int currentPage) {
    currentIndex = currentPage;
    update();
  }
}
