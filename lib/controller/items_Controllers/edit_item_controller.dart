import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/edit.dart';
import 'package:shop_savvy_admin/data/model/items_model.dart';
import 'package:shop_savvy_admin/view/screen/items/item_view.dart';

class EditItemController extends GetxController {
  EditItemData editItemData = EditItemData(Get.find());
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
  late ItemsMd itemsMd;

  chooseImage() async {
    file = await uploadImageFromGallery(true);
    update();
  }

  editData() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await editItemData.editData(
        itemsMd.itemsId.toString(),
        nameController.text,
        arabicNameController.text,
        descriptionController.text,
        arabicDescriptionController.text,
        countController.text,
        activeController.text,
        priceController.text,
        discountController.text,
        itemsCategoryIdController.text,
        itemsMd.itemsImage!,
        file,
      );
      print(
          "=============================== EditCategoriesController $response ");
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
    itemsMd = Get.arguments['itemsMd'];
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    descriptionController = TextEditingController();
    arabicDescriptionController = TextEditingController();
    countController = TextEditingController();
    activeController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    itemsCategoryIdController = TextEditingController();
    nameController.text = itemsMd.categoriesName!;
    arabicNameController.text = itemsMd.categoriesNameAr!;
    descriptionController.text = itemsMd.itemsDesc!;
    arabicDescriptionController.text=itemsMd.itemsDescAr!;
    countController.text = itemsMd.itemsCount.toString();
    activeController.text =itemsMd.itemsActive.toString();
    priceController.text  =itemsMd.itemsPrice.toString();
    discountController.text = itemsMd.itemsDiscount.toString();
    itemsCategoryIdController.text =itemsMd.itemsCategories.toString();
    super.onInit();
  }
}
