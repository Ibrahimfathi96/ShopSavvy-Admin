import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/categories_controller/add_category_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/core/shared/custom_text_form_field.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/cutom_auth_button.dart';

class AddCategoryView extends StatelessWidget {
  static const String routeName = '/add-Category-view';

  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: GetBuilder<AddCategoryController>(
        builder: (controller) => Container(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: [
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Enter Category Name",
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
                hintText: "Enter Category Name In Arabic",
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
                      : Icon(
                          Icons.image,
                          size: 60,
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
              CustomAuthButton(
                text: "Add",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
