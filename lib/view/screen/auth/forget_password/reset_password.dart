import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/forget_password_controllers/reset_password_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_body_text.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_title_text.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/custom_auth_text_form_field.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/cutom_auth_button.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = '/reset-password';

  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0,
        title: Text("41".tr),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingRequests(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Form(
              key: controller.formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  CustomAuthTitleText(
                    text: "42".tr,
                  ),
                  CustomAuthBodyText(
                    text: "43".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextFormField(
                    validator: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    textInputAction: TextInputAction.next,
                    onPressed: () {
                      controller.showPassword1();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "44".tr,
                    labelText: "45".tr,
                    iconData: controller.isVisible1
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: controller.isVisible1,
                    controller: controller.newPassword,
                  ),
                  CustomAuthTextFormField(
                    validator: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "46".tr,
                    labelText: "47".tr,
                    iconData: controller.isVisible2
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: controller.isVisible2,
                    controller: controller.confirmPassword,
                    onPressed: () {
                      controller.showPassword2();
                    },
                  ),
                  CustomAuthButton(
                    text: "48".tr,
                    onPressed: () {
                      controller.resetPassword();
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
