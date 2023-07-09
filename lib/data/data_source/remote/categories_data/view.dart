import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class ViewCategoryData {
  Crud crud;

  ViewCategoryData(this.crud);

  postData() async {
    var response = await crud.postData(AppLink.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }
}
