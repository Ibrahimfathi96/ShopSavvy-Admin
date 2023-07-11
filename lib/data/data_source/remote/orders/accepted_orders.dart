import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class AcceptedOrdersData {
  Crud crud;

  AcceptedOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.acceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
