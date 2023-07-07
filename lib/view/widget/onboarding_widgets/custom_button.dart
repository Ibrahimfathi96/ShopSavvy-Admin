import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/onboarding_controller.dart';

class OnBoardingCustomButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          controller.nextPage();
        },
        color: Colors.deepOrangeAccent,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          "4".tr,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
