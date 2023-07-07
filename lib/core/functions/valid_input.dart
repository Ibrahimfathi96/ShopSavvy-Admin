import 'package:get/get.dart';

validInput(String val, int min, int max, String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "54".tr;
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "55".tr;
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "56".tr;
    }
  }

  if(val.isEmpty){
    return "57".tr;
  }

  if(val.length < min){
    return "${"58".tr} $min";
  }

  if(val.length > max){
    return "${"59".tr} $max";
  }

}