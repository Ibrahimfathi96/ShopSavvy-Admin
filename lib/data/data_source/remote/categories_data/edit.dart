import 'dart:io';

import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class EditCategoryData {
  Crud crud;

  EditCategoryData(this.crud);

  editData(String categoryId, String categoryName, String categoryArName,
      String oldImage,
      [File? files]) async {
    var response;

    if (files == null) {
      response = await crud.postData(AppLink.editCategories, {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "categoryArName": categoryArName,
        "oldImage": oldImage,
      });
    } else {
      response = await crud.addRequestWithImageOne(
        AppLink.editCategories,
        {
          "categoryId": categoryId,
          "categoryName": categoryName,
          "categoryArName": categoryArName,
          "oldImage": oldImage,
        },
        files,
      );
    }

    return response.fold((l) => l, (r) => r);
  }
}
