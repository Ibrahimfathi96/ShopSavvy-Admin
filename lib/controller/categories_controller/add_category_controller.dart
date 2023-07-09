import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/add.dart';
import 'package:shop_savvy_admin/view/categories/category_view.dart';

class AddCategoryController extends GetxController {
  AddCategoryData addCategoryData = AddCategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController nameController;
  late TextEditingController arabicNameController;
  File? file;

  chooseImage()async{
    file = await uploadImageFromGallery(true);
    update();
  }
  AddData() async {
    statusRequest = StatusRequest.loading;

    var response = await addCategoryData.postData(
        nameController.text, arabicNameController.text, file!);
    print("=============================== AddCategoriesController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(CategoriesView.routeName);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    super.onInit();
  }
}
