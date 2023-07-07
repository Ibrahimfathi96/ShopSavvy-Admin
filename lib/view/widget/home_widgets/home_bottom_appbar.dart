import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/view/widget/home_widgets/home_bottom_nav_bar.dart';

class CustomHomeBottomAppBar extends StatelessWidget {
  const CustomHomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: AppColors.primaryDark,
            child: BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    controller.pagesList.length,
                    (index) {
                      return CustomHomeBottomNavBar(
                        onPressed: () {
                          controller.changePage(index);
                        },
                        isActive:
                            controller.currentIndex == index ? true : false,
                        buttonText: controller.bottomAppbar[index]['title'],
                        icon: controller.bottomAppbar[index]['icon'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
