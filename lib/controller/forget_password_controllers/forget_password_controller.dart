import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/forget_password/check_email.dart';
import 'package:shop_savvy_admin/data/data_source/remote/forget_password/check_phone.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/reset_password.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/verify_code_forget_pass.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  goBackToSignIn();

  goToVerifyCode();

  goToResetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController phoneController;
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CheckPhoneForgetPasswordData checkPhoneData =
  CheckPhoneForgetPasswordData(Get.find());
  CheckEmailForgetPasswordData checkEmailData =
  CheckEmailForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String verificationID = '';
  var authState = ''.obs;


  @override
  void onInit() {
    phoneController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  goBackToSignIn() {
    Get.back();
  }

  @override
  goToVerifyCode() {
    Get.offAllNamed(ForgetPasswordVerifyCode.routeName,
        arguments: {
          "phone": phoneController.text,
          "email": emailController.text,
        });
  }

  @override
  checkEmail() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        emailController.text,
      );
      // await checkFirebaseEmail();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToVerifyCode();
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("E-mail Address not found."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Ok"),
                ),
              ]);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      debugPrint("Valid");
    } else {
      debugPrint("Not Valid");
    }
  }


  @override
  goToResetPassword() {
    Get.offAllNamed(ResetPassword.routeName,arguments: {
      "email":emailController.text
    });
  }
}
