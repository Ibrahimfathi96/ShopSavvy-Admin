import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/items_Controllers/add_item_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/core/shared/custom_drop_down_search.dart';
import 'package:shop_savvy_admin/core/shared/custom_text_form_field.dart';
import 'package:shop_savvy_admin/view/widget/categories/custom_button.dart';

class AddItems extends StatelessWidget {
  static const String routeName = '/add-item';

  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: GetBuilder<AddItemController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(12),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomDropDownSearch(
                    dataList: controller.dropDownListItems,
                    title: "Choose From Categories",
                    label: "Categories",
                    dropDownSelectedName: controller.itemsCategoryName,
                    dropDownSelectedId: controller.itemsCategoryId,
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomTextFormField(
                          controller: controller.nameController,
                          hintText: "Item Name",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          labelText: "Name",
                          validator: (val) {
                            return validInput(val!, 5, 100, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.arabicNameController,
                          hintText: "Item Arabic Name",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          labelText: "Arabic Name",
                          validator: (val) {
                            return validInput(val!, 5, 100, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.descriptionController,
                          hintText: "Item Description",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          labelText: "Description",
                          validator: (val) {
                            return validInput(val!, 5, 150, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.arabicDescriptionController,
                          hintText: "Item Arabic Description",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          labelText: "Arabic Description",
                          validator: (val) {
                            return validInput(val!, 5, 150, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.countController,
                          hintText: "Item Count",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          labelText: "Count",
                          validator: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.priceController,
                          hintText: "Item Price",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          labelText: "Price",
                          validator: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        CustomTextFormField(
                          controller: controller.discountController,
                          hintText: "Item Discount",
                          iconData: Icons.shopping_cart,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          labelText: "Discount",
                          validator: (val) {
                            return validInput(val!, 1, 50, "");
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.file == null
                                ? Icon(
                                    Icons.image,
                                    size: 60,
                                  )
                                : Image.file(
                                    controller.file!,
                                    width: 100,
                                    height: 100,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Choose Item Image",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDark,
                                    fontSize: 16,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.showImageOptions();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.file == null
                                            ? "Upload"
                                            : "Edit",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Icon(Icons.file_upload_outlined)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.AddData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
