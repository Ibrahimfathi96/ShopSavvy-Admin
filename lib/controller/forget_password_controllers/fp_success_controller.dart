import 'package:get/get.dart';
import 'package:shop_savvy_admin/view/screen/auth/sign_in.dart';

abstract class ForgetPasswordSuccessController extends GetxController{
  goToSignIn();
}

class ForgetPasswordSuccessControllerImp extends ForgetPasswordSuccessController{
  @override
  goToSignIn() {
    Get.offAllNamed(SignIn.routeName);
  }

}