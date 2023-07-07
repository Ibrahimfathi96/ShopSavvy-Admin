import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/forget_password/verify_code.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/reset_password.dart';

abstract class ForgetPasswordVerifyCodeController extends GetxController {
  verifyOtp(String otp);

  goToResetPassword(String verifyCode);

  resendVerifyCode();
}

class ForgetPasswordVerifyCodeControllerImp
    extends ForgetPasswordVerifyCodeController {
  String? phone;
  String? email;
  var auth = FirebaseAuth.instance;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  String verificationID = '';
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    phone = Get.arguments["phone"];
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  verifyOtp(String otp) async {
    var credential = await auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp,
      ),
    );
    if (credential.user?.uid != null) {
      // goToResetPassword();
    }
  }

  @override
  goToResetPassword(verifyCode) async{
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeForgetPasswordData.postData(
        email!,verifyCode,
      );
      // await checkFirebaseEmail();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(ResetPassword.routeName,arguments: {
            "email":email
          });
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("Verify Code isn't correct."),
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
  }

  @override
  resendVerifyCode() {
    verifyCodeForgetPasswordData.resend(
      email!,
    );
  }
}
