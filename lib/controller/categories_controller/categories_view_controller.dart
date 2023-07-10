import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/delete.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/view.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';

class ViewCategoriesController extends GetxController {
  ViewCategoryData viewCategoryData = ViewCategoryData(Get.find());
  DeleteCategoryData deleteCategoryData = DeleteCategoryData(Get.find());

  List<CategoriesMD> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCategoryData.postData();
    print(
        "=============================== ViewCategoriesController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesMD.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String categoryId, String imageName) {
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
        deleteCategoryData.postData(categoryId, imageName);
        data.removeWhere((element) => element.categoriesId.toString() == categoryId);
        update();
        Get.back();
      },
      buttonColor: AppColors.secondaryColor,
      confirmTextColor: Colors.white,
      cancelTextColor: AppColors.primaryDark,
    );

  }

  myBack() {
    Get.offAllNamed(HomeScreen.routeName);
    return Future.value(false);
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
