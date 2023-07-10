import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class ViewItemData {
  Crud crud;

  ViewItemData(this.crud);

  postData() async {
    var response = await crud.postData(AppLink.viewItems, {});
    return response.fold((l) => l, (r) => r);
  }
}
