import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/orders_details_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class OrdersDetailsShippingCard extends GetView<OrdersDetailsController> {
  const OrdersDetailsShippingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Shipping Address:",
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                "${controller.ordersMd.locationCity},${controller.ordersMd.locationStreet}"),
          ),
          Container(
            margin: EdgeInsets.all(4),
            height: 300,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: controller.markers.toSet(),
              initialCameraPosition: controller.cameraPosition!,
              onMapCreated: (GoogleMapController mapController) {
                controller.completerController.complete(mapController);
              },
            ),
          ),
        ],
      ),
    );
  }
}
