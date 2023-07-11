import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class PreparingOrdersData {
  Crud crud;

  PreparingOrdersData(this.crud);

  getData(String orderId, String userId,String orderType,) async {
    var response = await crud.postData(AppLink.preparingOrders, {
      "userId": userId,
      "orderId": orderId,
      "orderType": orderType,
    });
    return response.fold((l) => l, (r) => r);
  }
}
