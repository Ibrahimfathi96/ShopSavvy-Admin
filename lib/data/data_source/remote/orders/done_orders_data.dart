import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class DoneOrdersData {
  Crud crud;

  DoneOrdersData(this.crud);

  getData(String orderId, String userId,) async {
    var response = await crud.postData(AppLink.doneOrders, {
      "userId": userId,
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
