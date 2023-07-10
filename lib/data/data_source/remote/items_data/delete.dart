import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class DeleteItemData {
  Crud crud;

  DeleteItemData(this.crud);

  postData(String itemId,String imageName,) async {
    var response = await crud.postData(AppLink.deleteItems, {
      "itemId":itemId,
      "imageName":imageName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
