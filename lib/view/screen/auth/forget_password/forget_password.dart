import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/forget_password_controllers/forget_password_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_nav_button.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/custom_auth_text_form_field.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/cutom_auth_button.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/forget_password_icon.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/forget_password_texts.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = '/forget-password';

  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controllerImp =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("36".tr),
        leading: IconButton(
          onPressed: () {
            controllerImp.goBackToSignIn();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingRequests(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Form(
              key: controller.formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const ForgetPasswordLockIcon(),
                  ForgetPasswordTexts(
                    text1: "37".tr,
                    text2: "38".tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomAuthTextFormField(
                    validator: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "15".tr,
                    labelText: "16".tr,
                    iconData: Icons.email_outlined,
                    controller: controller.emailController,
                  ),
                  CustomAuthButton(
                    text: "39".tr,
                    onPressed: () {
                      controller.checkEmail();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthNavButton(
                    text1: "40".tr,
                    text2: "12".tr,
                    onTap: () {
                      controller.goBackToSignIn();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
