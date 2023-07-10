import 'dart:io';

import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class EditItemData {
  Crud crud;

  EditItemData(this.crud);

  editData(
      String itemsId,
      String itemName,
      String itemNameInArabic,
      String itemsDescription,
      String itemsDescriptionInArabic,
      String itemsCount,
      String itemsActive,
      String itemsPrice,
      String itemsDiscount,
      String itemsCategoryId,
      String oldImage,
      [File? files]) async {
    var response;

    if (files == null) {
      response = await crud.postData(AppLink.editItems, {
        "itemsId": itemsId,
        "itemName": itemName,
        "itemNameInArabic": itemNameInArabic,
        "itemsDescription": itemsDescription,
        "itemsDescriptionInArabic": itemsDescriptionInArabic,
        "itemsCount": itemsCount,
        "itemsActive": itemsActive,
        "itemsPrice": itemsPrice,
        "itemsDiscount": itemsDiscount,
        "itemsCategoryId": itemsCategoryId,
        "oldImage": oldImage,
      });
    } else {
      response = await crud.addRequestWithImageOne(
        AppLink.editItems,
        {
          "itemsId": itemsId,
          "itemName": itemName,
          "itemNameInArabic": itemNameInArabic,
          "itemsDescription": itemsDescription,
          "itemsDescriptionInArabic": itemsDescriptionInArabic,
          "itemsCount": itemsCount,
          "itemsActive": itemsActive,
          "itemsPrice": itemsPrice,
          "itemsDiscount": itemsDiscount,
          "itemsCategoryId": itemsCategoryId,
          "oldImage": oldImage,
        },
        files,
      );
    }

    return response.fold((l) => l, (r) => r);
  }
}
