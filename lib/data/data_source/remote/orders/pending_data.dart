import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class PendingOrdersData {
  Crud crud;

  PendingOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.pendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
