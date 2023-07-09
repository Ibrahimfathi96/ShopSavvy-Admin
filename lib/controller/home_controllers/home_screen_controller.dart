import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/view/widget/home_widgets/home_body.dart';
import 'package:shop_savvy_admin/view/screen/orders_view/myorders_view.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentIndex = 0;

  List<Widget> pagesList = [
    HomeBody(),
    MyOrdersView(),
  ];

  List bottomAppbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Orders", "icon": Icons.shopping_cart},
  ];

  @override
  changePage(int currentPage) {
    currentIndex = currentPage;
    update();
  }
}
