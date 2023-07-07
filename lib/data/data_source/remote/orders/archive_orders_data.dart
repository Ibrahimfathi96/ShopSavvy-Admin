import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class ArchivedOrdersData {
  Crud crud;

  ArchivedOrdersData(this.crud);

  getData(String deliveryId,) async {
    var response = await crud.postData(AppLink.archivedOrders, {
      "deliveryId":deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
