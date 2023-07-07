import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/data/data_source/remote/auth/sign_in_remote.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';


abstract class SignInController extends GetxController {
  singIn();

  goToForgetPassword();

  showPassword();

}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isVisible = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignInData signInData = SignInData(Get.find());
  MyServices services = Get.find();

  @override
  showPassword() {
    isVisible = isVisible == true ? false : true;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  singIn() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(
        emailController.text,
        passwordController.text,
      );
      debugPrint("============= SignInController $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          if (response['data']['admin_approve'] == 1) {
            services.prefs
                .setString("id", response['data']['admin_id'].toString());
            services.prefs.setString("email", response['data']['admin_email']);
            services.prefs.setString("phone", response['data']['admin_phone'].toString());
            services.prefs
                .setString("userName", response['data']['admin_name']);
            services.prefs.setString("step", "2");
            String adminId = services.prefs.getString("id")!;
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("admin${adminId}");
            print("login-success=================");
            Get.offAllNamed(HomeScreen.routeName);
          }else{

          }
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("Something went wrong with your email or password."),
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
  goToForgetPassword() {
    Get.toNamed(ForgetPassword.routeName);
  }
}
