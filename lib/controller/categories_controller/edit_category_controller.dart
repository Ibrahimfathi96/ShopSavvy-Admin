import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/categories_controller/categories_view_controller.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/edit.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
import 'package:shop_savvy_admin/view/categories/category_view.dart';

class EditCategoryController extends GetxController {
  EditCategoryData editCategoryData = EditCategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController nameController;
  late TextEditingController arabicNameController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  late CategoriesMD categoriesMD;

  chooseImage() async {
    file = await uploadImageFromGallery(true);
    update();
  }

  editData() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await editCategoryData.editData(
        categoriesMD.categoriesId.toString(),
        nameController.text,
        arabicNameController.text,
        categoriesMD.categoriesImage!,
        file,
      );
      print(
          "=============================== EditCategoriesController $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(CategoriesView.routeName);
          ViewCategoriesController controller = Get.find();
          controller.viewData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    categoriesMD = Get.arguments['categoriesMD'];
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    nameController.text = categoriesMD.categoriesName!;
    arabicNameController.text = categoriesMD.categoriesNameAr!;
    super.onInit();
  }
}
