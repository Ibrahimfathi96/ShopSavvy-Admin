import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/middleware/middleware.dart';
import 'package:shop_savvy_admin/view/categories/add_category_view.dart';
import 'package:shop_savvy_admin/view/categories/category_view.dart';
import 'package:shop_savvy_admin/view/categories/edit_category_view.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/reset_password.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/reset_password_success.dart';
import 'package:shop_savvy_admin/view/screen/auth/forget_password/verify_code_forget_pass.dart';
import 'package:shop_savvy_admin/view/screen/auth/sign_in.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';
import 'package:shop_savvy_admin/view/screen/items/item_view.dart';
import 'package:shop_savvy_admin/view/screen/languages_view.dart';
import 'package:shop_savvy_admin/view/screen/onboarding_view.dart';
import 'package:shop_savvy_admin/view/screen/orders_view/myorders_view.dart';
import 'package:shop_savvy_admin/view/screen/orders_view/orders_details.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: Language.routeName, page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: OnBoarding.routeName, page: () => const OnBoarding()),
  GetPage(name: SignIn.routeName, page: () => const SignIn()),
  GetPage(name: ForgetPassword.routeName, page: () => const ForgetPassword()),
  GetPage(
      name: ForgetPasswordVerifyCode.routeName,
      page: () => const ForgetPasswordVerifyCode()),
  GetPage(name: ResetPassword.routeName, page: () => const ResetPassword()),
  GetPage(
      name: ResetPasswordSuccessfully.routeName,
      page: () => const ResetPasswordSuccessfully()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: MyOrdersView.routeName, page: () => const MyOrdersView()),
  GetPage(name: OrdersDetails.routeName, page: () => const OrdersDetails()),
  //Categories
  GetPage(name: CategoriesView.routeName, page: () => const CategoriesView()),
  GetPage(name: AddCategoryView.routeName, page: () => const AddCategoryView()),
  GetPage(name: EditCategoryView.routeName, page: () => const EditCategoryView()),
  // GetPage(name: EditCategoriesView.routeName, page: () => const CategoriesView()),
  //Items
  GetPage(name: ItemsView.routeName, page: () => const ItemsView()),
  // GetPage(name: AddCategoriesView.routeName, page: () => const CategoriesView()),
  // GetPage(name: EditCategoriesView.routeName, page: () => const CategoriesView()),
];
