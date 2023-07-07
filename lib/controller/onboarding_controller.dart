import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/data/data_source/static/static.dart';
import 'package:shop_savvy_admin/view/screen/auth/sign_in.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();

  onPageChanged(int index);

  skipOnBoarding();
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.prefs.setString("step", "1");
      Get.offAllNamed(SignIn.routeName);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }
  @override
  skipOnBoarding(){
    Get.offAllNamed(SignIn.routeName);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
