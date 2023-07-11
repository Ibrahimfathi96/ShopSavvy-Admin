import 'dart:io';

import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class AddItemData {
  Crud crud;

  AddItemData(this.crud);

  postData(
      String itemName,
      String itemNameInArabic,
      String itemsDescription,
      String itemsDescriptionInArabic,
      String itemsCount,
      String itemsPrice,
      String itemsDiscount,
      String itemsCategoryId,
      File files,
      ) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.addItems,
      {
        "itemName": itemName,
        "itemNameInArabic": itemNameInArabic,
        "itemsDescription": itemsDescription,
        "itemsDescriptionInArabic": itemsDescriptionInArabic,
        "itemsCount": itemsCount,
        "itemsPrice": itemsPrice,
        "itemsDiscount": itemsDiscount,
        "itemsDate": DateTime.now().toString(),
        "itemsCategoryId": itemsCategoryId,
      },
      files,
    );
    return response.fold((l) => l, (r) => r);
  }
}
