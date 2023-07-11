import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/items_view_controller.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/functions/upload_file.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/view.dart';
import 'package:shop_savvy_admin/data/data_source/remote/items_data/add.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
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
  late TextEditingController dropDownNameController;
  late TextEditingController dropDownIdController;
  late TextEditingController itemsCategoryId;
  late TextEditingController itemsCategoryName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  List<SelectedListItem> dropDownListItems = [];

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

  showDropDownList(BuildContext context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [
          SelectedListItem(name: "A"),
          SelectedListItem(name: "B"),
        ],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropDownNameController.text = selectedListItem.name;
        },
      ),
    ).showModal(context);
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
        itemsCategoryId.text,
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
    nameController = TextEditingController();
    arabicNameController = TextEditingController();
    descriptionController = TextEditingController();
    arabicDescriptionController = TextEditingController();
    countController = TextEditingController();
    activeController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    itemsCategoryId = TextEditingController();
    itemsCategoryName = TextEditingController();
    dropDownIdController = TextEditingController();
    dropDownNameController = TextEditingController();
    getCategories();
    super.onInit();
  }
}
