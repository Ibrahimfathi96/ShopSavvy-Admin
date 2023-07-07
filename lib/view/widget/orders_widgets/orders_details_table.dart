import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/orders_details_controller.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/order_details_table_row.dart';

class OrderTable extends GetView<OrdersDetailsController> {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3,
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            OrdersTableRow(
              leftText: "Specs",
              middleText: "QTY",
              rightText: "Price",
              isTitleText: true,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.data.length,
                itemBuilder: (context, index) => OrdersTableRow(
                  leftText: "${controller.data[index].itemsName}",
                  middleText: "${controller.data[index].itemCount}",
                  rightText: "${controller.data[index].itemsPrice} EGP",
                ),
              ),
            ),
            OrdersTableRow(
              leftText: "",
              middleText: "Total Price",
              rightText:
              "${controller.ordersMd.ordersTotalPrice!.round()} EGP",
              isTitleText: true,
            ),
          ],
        ),
      ),
    );
  }
}
