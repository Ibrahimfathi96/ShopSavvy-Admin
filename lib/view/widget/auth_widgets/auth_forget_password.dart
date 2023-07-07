import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/auth_controllers/sign_in_controller.dart';

class AuthForgetPassword extends GetView<SignInControllerImp> {
  const AuthForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.goToForgetPassword();
      },
      child: Text(
        "19".tr,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
