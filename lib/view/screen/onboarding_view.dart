import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/onboarding_controller.dart';
import 'package:shop_savvy_admin/core/functions/exit_app_alert.dart';
import 'package:shop_savvy_admin/view/widget/onboarding_widgets/custom_button.dart';
import 'package:shop_savvy_admin/view/widget/onboarding_widgets/custom_dots.dart';
import 'package:shop_savvy_admin/view/widget/onboarding_widgets/custom_skip_button.dart';
import 'package:shop_savvy_admin/view/widget/onboarding_widgets/custom_slider.dart';

class OnBoarding extends StatelessWidget {
  static const String routeName = "/onBoarding";

  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: exitAppAlert,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: OnBoardingCustomSlider(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    OnBoardingCustomDotsController(),
                    Spacer(
                      flex: 2,
                    ),
                    OnBoardingCustomButton(),
                    OnBoardingSkipButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
