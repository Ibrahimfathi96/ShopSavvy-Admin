import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}