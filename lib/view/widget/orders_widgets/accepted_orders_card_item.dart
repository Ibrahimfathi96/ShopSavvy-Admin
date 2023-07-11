import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/accepted_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/data/model/orders_model.dart';
import 'package:shop_savvy_admin/view/screen/orders_view/orders_details.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/orders_id_and_date_time.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/orders_texts.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/orders_total_price.dart';

class AcceptedOrdersItemCard extends GetView<AcceptedOrdersController> {
  final OrdersMd ordersMd;

  const AcceptedOrdersItemCard({
    super.key,
    required this.ordersMd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrdersTimeAndId(
              orderId: ordersMd.ordersId!,
              orderDateTime:
                  "${Jiffy.parse(ordersMd.ordersDatetime!).fromNow()}",
            ),
            Divider(
              thickness: 2,
            ),
            OrdersRowOfText(
              text1: "Tracking Number: ",
              text2: "${controller.services.prefs.getString("phone")}",
            ),
            OrdersRowOfText(
              text1: "Order Type     : ",
              text2: controller.printOrderType(ordersMd.ordersType!),
            ),
            OrdersRowOfText(
              text1: "Delivery Taxes : ",
              text2: "${ordersMd.ordersPriceDelivery} EGP",
            ),
            OrdersRowOfText(
              text1: "Payment Method : ",
              text2:
                  controller.printPaymentMethod(ordersMd.ordersPaymentMethod!),
            ),
            OrdersRowOfText(
              text1: "Order Status   : ",
              text2: controller.printOrderStatus(ordersMd.ordersStatus!),
            ),
            Divider(thickness: 2),
            OrdersTotalPrice(
              ordersMd: ordersMd,
              isDelivered: ordersMd.ordersStatus == 0,
              onDetailsPress: () {
                Get.toNamed(
                  OrdersDetails.routeName,
                  arguments: {
                    "ordersMd": ordersMd,
                  },
                );
              },
              text1: "Total Price: ",
              color: controller.orderStatusColor(ordersMd.ordersStatus!),
              text2: "${ordersMd.ordersTotalPrice!.round()} EGP",
            ),
            if (ordersMd.ordersStatus == 1)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: AppColors.primaryDark,
                    minimumSize: Size(MediaQuery.sizeOf(context).width / 6, 40),
                  ),
                  onPressed: () {
                    controller.donePreparing(
                      ordersMd.ordersId.toString(),
                      ordersMd.ordersUserId.toString(),
                      ordersMd.ordersType.toString(),
                    );
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
