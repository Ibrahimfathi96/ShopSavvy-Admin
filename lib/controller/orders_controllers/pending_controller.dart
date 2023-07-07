import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/data/data_source/remote/orders/approved_orders_data.dart';
import 'package:shop_savvy_admin/data/data_source/remote/orders/pending_data.dart';
import 'package:shop_savvy_admin/data/model/orders_model.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData ordersData = PendingOrdersData(Get.find());
  ApprovedOrdersData approvedOrdersData = ApprovedOrdersData(Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersMd> ordersList = [];
  bool isSelected = false;

  toggleBetweenOrderType() {
    isSelected = isSelected == false ? true : false;
    update();
  }

  approveOrder(String userId, String orderId) async {
    ordersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await approvedOrdersData.getData(
      orderId,
      userId,
      services.prefs.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPendingOrders();
        debugPrint("Approved Order Successfully!");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getPendingOrders() async {
    ordersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        ordersList.addAll(data.map((e) => OrdersMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrdersPage() {
    getPendingOrders();
  }

  String printPaymentMethod(num val) {
    if (val == 1) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderType(num val) {
    if (val == 0) {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  String printOrderStatus(num val) {
    if (val == 0) {
      return "Pending approval";
    } else if (val == 1) {
      return "Preparing";
    } else if (val == 2) {
      return "Ready";
    } else if (val == 3) {
      return "On The Way";
    } else {
      return "Archived";
    }
  }

  Color orderStatusColor(num val) {
    if (val == 0) {
      return Colors.red;
    } else if (val == 1) {
      return AppColors.primaryColor;
    } else if (val == 2) {
      return Colors.green;
    } else if (val == -1) {
      return Colors.green;
    } else {
      return AppColors.primaryDark;
    }
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
