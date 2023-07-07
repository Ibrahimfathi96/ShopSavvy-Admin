import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/services/services.dart';

translateDB(enColumn,arColumn){
  MyServices services= Get.find();
  if(services.prefs.getString('lang')=="ar"){
    return arColumn;
  }else{
    return enColumn;
  }
}