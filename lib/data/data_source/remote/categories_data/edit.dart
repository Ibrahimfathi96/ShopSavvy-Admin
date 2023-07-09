import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class EditCategoryData {
  Crud crud;

  EditCategoryData(this.crud);

  postData(
    num categoryId,
    String categoryName,
    String categoryArName,
    String files,
    String oldImage,
  ) async {
    var response = await crud.postData(AppLink.editCategories, {
      "categoryId": categoryId,
      "categoryName": categoryName,
      "categoryArName": categoryArName,
      "files": files,
      "oldImage": oldImage,
    });
    return response.fold((l) => l, (r) => r);
  }
}
