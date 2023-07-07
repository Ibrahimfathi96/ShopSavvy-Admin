import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/functions/handling_data.dart';
import 'package:shop_savvy_admin/core/services/services.dart';
import 'package:shop_savvy_admin/data/data_source/remote/orders/details_orders_data.dart';
import 'package:shop_savvy_admin/data/model/orders_details_model.dart';
import 'package:shop_savvy_admin/data/model/orders_model.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  // List<CartMd> data = [];
  List<OrdersDetailsMd> data = [];
  late OrdersMd ordersMd;
  List<Marker> markers = [];
  String? lat;
  String? lng;
  CameraPosition? cameraPosition ;
  final Completer<GoogleMapController> completerController =
  Completer<GoogleMapController>();

  initData() {
    if(ordersMd.ordersType == 0){
      cameraPosition = CameraPosition(
        target: LatLng(ordersMd.locationLat, ordersMd.locationLong),
        zoom: 15,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(
            ordersMd.locationLat,
            ordersMd.locationLong,
          ),
        ),
      );
    }
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersMd.ordersId.toString());
    debugPrint("ordersDetails==================> $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersDetailsMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    ordersMd = Get.arguments['ordersMd'];
    initData();
    getOrdersDetailsData();
    super.onInit();
  }
}
