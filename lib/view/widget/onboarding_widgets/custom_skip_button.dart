import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/onboarding_controller.dart';

class OnBoardingSkipButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.skipOnBoarding();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "5".tr,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
