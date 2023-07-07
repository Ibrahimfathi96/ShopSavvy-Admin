import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/orders_details_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/orders_details_shipping_card.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/orders_details_table.dart';

class OrdersDetails extends StatelessWidget {
  static const String routeName = '/orders-details';

  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryDark,
          ),
        ),
        title: Text(
          'Orders Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                OrderTable(),
                if(controller.ordersMd.ordersType != 1)
                OrdersDetailsShippingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
