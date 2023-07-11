import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/accepted_controller.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/archive_orders_controller.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/pending_controller.dart';
import 'package:shop_savvy_admin/core/class/handling_data_view.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/accepted_orders_card_item.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/archived_orders_card.dart';
import 'package:shop_savvy_admin/view/widget/orders_widgets/pending_orders_card_item.dart';

class MyOrdersView extends StatelessWidget {
  static const String routeName = '/my-orders-view';

  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    PendingOrdersController pendingOrdersController =
        Get.put(PendingOrdersController());
    AcceptedOrdersController acceptedOrdersController =
        Get.put(AcceptedOrdersController());
    ArchiveOrdersController archiveOrdersController =
        Get.put(ArchiveOrdersController());
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.primaryDark,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'ShopSavvy Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryDark,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                pendingOrdersController.refreshOrdersPage();
                acceptedOrdersController.refreshOrdersPage();
                archiveOrdersController.getArchivedOrders();
              },
              icon: Icon(
                Icons.refresh_outlined,
                size: 30,
                color: AppColors.primaryDark,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.primaryDark,
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
              Tab(
                text: "Archived",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
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
            Container(
              padding: EdgeInsets.all(16),
              child: GetBuilder<ArchiveOrdersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) => ArchivedOrdersItemCard(
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
