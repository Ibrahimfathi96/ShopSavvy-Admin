import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/accepted_controller.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/pending_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/archived_orders_card_item.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/pending_orders_card_item.dart';

class MyOrdersView extends StatelessWidget {
  static const String routeName = '/my-orders-view';

  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    PendingOrdersController pendingOrdersController = Get.put(PendingOrdersController());
    AcceptedOrdersController acceptedOrdersController = Get.put(AcceptedOrdersController());
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                pendingOrdersController.refreshOrdersPage();
                acceptedOrdersController.refreshOrdersPage();
              },
              icon: Icon(
                Icons.refresh_outlined,
                size: 30,
                color: AppColors.primaryDark,
              ),
            ),
          ],
          title: Text(
            'ShopSavvy Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
              fontSize: 20,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.secondaryColor,
            labelColor: AppColors.primaryDark,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Accepted",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: GetBuilder<PendingOrdersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) => PendingOrdersItemCard(
                      ordersMd: controller.ordersList[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: GetBuilder<AcceptedOrdersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) => AcceptedOrdersItemCard(
                      ordersMd: controller.ordersList[index],
                    ),
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
