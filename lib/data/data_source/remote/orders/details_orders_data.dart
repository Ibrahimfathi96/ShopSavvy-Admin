import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String orderId) async {
    var response = await crud.postData(AppLink.detailsOrders, {
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
