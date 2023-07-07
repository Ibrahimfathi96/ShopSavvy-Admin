import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/forget_password_controllers/fp_verify_code_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/constants/image_assets.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/forget_password_texts.dart';
import 'package:shop_savvy_admin/view/widget/auth_widgets/otp_text_field.dart';

class ForgetPasswordVerifyCode extends StatelessWidget {
  static const String routeName = '/verify-code-fp';

  const ForgetPasswordVerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordVerifyCodeControllerImp());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("29".tr),
      ),
      body: GetBuilder<ForgetPasswordVerifyCodeControllerImp>(
        builder: (controller) => HandlingRequests(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  AppImageFromAssets.verifyCodeLogo,
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                ForgetPasswordTexts(
                  text1: "30".tr,
                  text2: "31".tr,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  controller.phone!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                OTPTextFields(
                  onSubmitted: (String code) {
                    controller.goToResetPassword(code);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(110, 50),
                    ),
                    onPressed: () {
                      controller.resendVerifyCode();
                    },
                    child: const Text("Re-send Code"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
