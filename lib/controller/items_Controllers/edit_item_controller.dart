import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/view.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/edit.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
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
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController dropDownNameController;
  late TextEditingController dropDownIdController;
  late TextEditingController itemsCategoryId;
  late TextEditingController itemsCategoryName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  late ItemsMd itemsMd;
  List<SelectedListItem> dropDownListItems = [];
  late num active;

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
        active.toString(),
        priceController.text,
        discountController.text,
        itemsCategoryId.text,
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
  chooseImageFromGallery() async {
    file = await uploadImageFromGallery(false);
    update();
  }

  takeImageFromCamera() async {
    file = await uploadImageFromCamera();
    update();
  }

  showImageOptions() {
    showBottomMenu(takeImageFromCamera, chooseImageFromGallery);
  }
  changeActiveStatus(val){
    active = val;
    update();
  }
  getCategories() async {
    ViewCategoryData viewCategoryData = ViewCategoryData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCategoryData.postData();
    print(
        "=============================== ViewCategoriesController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesMD> data = [];
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesMD.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownListItems.add(
            SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    itemsMd = Get.arguments['itemsMd'];
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    descriptionController = TextEditingController();
    arabicDescriptionController = TextEditingController();
    countController = TextEditingController();
    active =itemsMd.itemsActive!;
    priceController = TextEditingController();
    discountController = TextEditingController();
    itemsCategoryId = TextEditingController();
    itemsCategoryName = TextEditingController();
    dropDownNameController = TextEditingController();
    dropDownIdController = TextEditingController();
    nameController.text = itemsMd.itemsName!;
    arabicNameController.text = itemsMd.itemsNameAr!;
    descriptionController.text = itemsMd.itemsDesc!;
    arabicDescriptionController.text=itemsMd.itemsDescAr!;
    countController.text = itemsMd.itemsCount.toString();
    priceController.text  =itemsMd.itemsPrice.toString();
    discountController.text = itemsMd.itemsDiscount.toString();
    itemsCategoryId.text =itemsMd.categoriesId.toString();
    itemsCategoryName.text =itemsMd.categoriesName.toString();
    getCategories();
    super.onInit();
  }
}
