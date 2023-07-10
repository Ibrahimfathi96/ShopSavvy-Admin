import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/delete.dart';
import 'package:shop_savvy_admin/data/data_source/remote/categories_data/view.dart';
import 'package:shop_savvy_admin/data/model/categories_model.dart';
import 'package:shop_savvy_admin/view/screen/home/home_screen.dart';

class ViewCategoriesController extends GetxController {
  ViewCategoryData viewCategoryData = ViewCategoryData(Get.find());
  DeleteCategoryData deleteCategoryData = DeleteCategoryData(Get.find());

  List<CategoriesMD> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
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

  deleteCategory(String categoryId, String imageName) {
    deleteCategoryData.postData(categoryId, imageName);
    data.removeWhere((element) => element.categoriesId.toString() == categoryId);
    update();
  }

  myBack() {
    Get.offAllNamed(HomeScreen.routeName);
    return Future.value(false);
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
