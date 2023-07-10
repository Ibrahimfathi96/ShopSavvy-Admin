import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/delete.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/view.dart';
import 'package:shop_savvy_admin/data/model/items_model.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';
import 'package:shop_savvy_admin/view/screen/items/edit_item.dart';

class ViewItemsController extends GetxController {
  ViewItemData viewItemData = ViewItemData(Get.find());
  DeleteItemData deleteItemData = DeleteItemData(Get.find());

  List<ItemsMd> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewItemData.postData();
    print(
        "=============================== ViewItemController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String itemsId, String imageName) {
    Get.defaultDialog(
      title: "Warning",
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColors.secondaryColor,
      ),
      middleText:
      "Are you sure, you want to delete this product?",
      middleTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.primaryDark,
      ),
      onCancel: () {},
      onConfirm: () {
        deleteItemData.postData(itemsId, imageName);
        data.removeWhere((element) =>
        element.itemsId.toString() == itemsId);
        update();
        Get.back();
      },
      buttonColor: AppColors.secondaryColor,
      confirmTextColor: Colors.white,
      cancelTextColor: AppColors.primaryDark,
    );
  }

  goToEditPage(ItemsMd itemsMd) {
    Get.toNamed(EditItems.routeName, arguments: {
      "itemsMd": itemsMd,
    });
  }

  myBack()  {
    Get.offAllNamed(HomeScreen.routeName);
    return Future.value(false);
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
