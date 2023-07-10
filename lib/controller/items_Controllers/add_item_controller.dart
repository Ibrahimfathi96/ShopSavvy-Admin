import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/add.dart';
import 'package:shop_savvy_admin/view/screen/items/item_view.dart';

class AddItemController extends GetxController {
  AddItemData addItemData = AddItemData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController arabicNameController;
  late TextEditingController arabicDescriptionController;
  late TextEditingController countController;
  late TextEditingController activeController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController itemsCategoryIdController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;

  chooseImage() async {
    file = await uploadImageFromGallery(true);
    update();
  }

  AddData() async {
    if (formKey.currentState!.validate()) {
      if (file == null) {
        return Get.snackbar("Alert", "Please Choose Item Image");
      }
      statusRequest = StatusRequest.loading;
      update();

      var response = await addItemData.postData(
        nameController.text,
        arabicNameController.text,
        descriptionController.text,
        arabicDescriptionController.text,
        countController.text,
        activeController.text,
        priceController.text,
        discountController.text,
        DateTime.now().toString(),
        itemsCategoryIdController.text,
        file!,
      );
      print("=============================== AddItemsController $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(ItemsView.routeName);
          ViewItemsController controller = Get.find();
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
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    descriptionController = TextEditingController();
    arabicDescriptionController = TextEditingController();
    countController = TextEditingController();
    activeController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    itemsCategoryIdController = TextEditingController();
    super.onInit();
  }
}
