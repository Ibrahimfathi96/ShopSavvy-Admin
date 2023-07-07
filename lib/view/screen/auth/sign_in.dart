import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/auth_controllers/sign_in_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/functions/exit_app_alert.dart';
import 'package:shop_savvy_admin/core/functions/valid_input.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_body_text.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_forget_password.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_logo.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/auth_title_text.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/custom_text_form_field.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/cutom_auth_button.dart';

class SignIn extends StatelessWidget {
  static const String routeName = "/sign-in";

  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "12".tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: WillPopScope(
        onWillPop: exitAppAlert,
        child: GetBuilder<SignInControllerImp>(
          builder: (controller) => HandlingRequests(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const AuthLogo(),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomAuthTitleText(
                      text: "13".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomAuthBodyText(
                      text: "14".tr,
                    ),
                    SizedBox(height: Get.height / 20,),
                    CustomAuthTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 30, "email");
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      hintText: "15".tr,
                      labelText: "16".tr,
                      iconData: Icons.email_outlined,
                    ),
                    GetBuilder<SignInControllerImp>(
                      builder: (controller) => CustomAuthTextFormField(
                        validator: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        onPressed: () {
                          controller.showPassword();
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordController,
                        obscureText: controller.isVisible,
                        hintText: "17".tr,
                        labelText: "18".tr,
                        iconData: controller.isVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    const AuthForgetPassword(),
                    SizedBox(height: Get.height / 20,),
                    CustomAuthButton(
                      onPressed: () {
                        controller.singIn();
                      },
                      text: "12".tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
