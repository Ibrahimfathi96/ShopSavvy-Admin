import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/categories_controller/edit_category_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/core/shared/custom_text_form_field.dart';
import 'package:shop_savvy_admin/link_api.dart';
import 'package:shop_savvy_admin/view/widget/categories/custom_button.dart';

class EditCategoryView extends StatelessWidget {
  static const String routeName = '/edit-Category-view';

  const EditCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Category'),
      ),
      body: GetBuilder<EditCategoryController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(12),
            child: Form(
              key: controller.formKey,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  CustomTextFormField(
                    controller: controller.nameController,
                    hintText: "Edit Category Name",
                    iconData: Icons.category,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    labelText: "Category Name",
                    validator: (val) {
                      return validInput(val!, 5, 50, "");
                    },
                  ),
                  CustomTextFormField(
                    controller: controller.arabicNameController,
                    hintText: "Edit Category Name In Arabic",
                    iconData: Icons.category,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    labelText: "Category Name In Arabic",
                    validator: (val) {
                      return validInput(val!, 5, 50, "");
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.file != null
                          ? SvgPicture.file(
                              controller.file!,
                              width: 60,
                              height: 60,
                            )
                          : SvgPicture.network(
                              "${AppLink.imagesCategories}/${controller.categoriesMD.categoriesImage}",
                              width: 60,
                              height: 60,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Choose Category Image",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDark,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.chooseImage();
                            },
                            child: Row(
                              children: [
                                Text(
                                  controller.file != null ? "Edit" : "Upload",
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
                  CustomButton(
                    text: "Save Changes",
                    onPressed: () {
                      controller.editData();
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
