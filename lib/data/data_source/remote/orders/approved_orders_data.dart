import 'package:shop_savvy_admin/core/class/crud.dart';
import 'package:shop_savvy_admin/link_api.dart';

class ApprovedOrdersData {
  Crud crud;

  ApprovedOrdersData(this.crud);

  getData(String orderId, String userId, String deliveryId,) async {
    var response = await crud.postData(AppLink.approvedOrders, {
      "orderId": orderId,
      "userId":userId,
      "deliveryId":deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
