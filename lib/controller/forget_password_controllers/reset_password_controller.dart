import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/forget_password/reset_password.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/reset_password_success.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();

  goToResetPasswordSuccessfully();

  showPassword1();

  showPassword2();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible1 = true;
  bool isVisible2 = true;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  showPassword1() {
    isVisible1 = isVisible1 == true ? false : true;
    update();
  }

  @override
  showPassword2() {
    isVisible2 = isVisible2 == true ? false : true;
    update();
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    var formData = formKey.currentState;
    if (newPassword.text != confirmPassword.text) {
      return Get.defaultDialog(
          title: "Warning!",
          middleText: "Password doesn't match.",
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Ok"),
            ),
          ]);
    }
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, newPassword.text);
      debugPrint(
          "============== ResetPasswordSuccessfullyController: $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToResetPasswordSuccessfully();
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("Something went wrong, try again later."),
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
  goToResetPasswordSuccessfully() {
    Get.offNamed(ResetPasswordSuccessfully.routeName);
  }
}
