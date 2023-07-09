import 'dart:io';

import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class AddCategoryData {
  Crud crud;

  AddCategoryData(this.crud);

  postData(
    String categoryName,
    String categoryArName,
    File files,
  ) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.addCategories,
      {
        "categoryName": categoryName,
        "categoryArName": categoryArName,
      },
      files,
    );
    return response.fold((l) => l, (r) => r);
  }
}
