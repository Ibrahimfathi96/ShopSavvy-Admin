import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/view.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';

class ViewCategoriesController extends GetxController {
  ViewCategoryData viewCategoryData = ViewCategoryData(Get.find());

  List<CategoriesMD> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  viewData() async {
    statusRequest = StatusRequest.loading;

    var response = await viewCategoryData.postData();
    print(
        "=============================== ViewCategoriesController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesMD.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
