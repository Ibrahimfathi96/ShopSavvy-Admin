import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class DeleteCategoryData {
  Crud crud;

  DeleteCategoryData(this.crud);

  postData(num categoryId,String imageName,) async {
    var response = await crud.postData(AppLink.deleteCategories, {
      "categoryId":categoryId,
      "imageName":imageName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
