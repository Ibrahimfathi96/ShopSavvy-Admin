import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shop_savvy_admin/controller/orders_controllers/archive_orders_controller.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';
import 'package:shop_savvy_admin/generated/assets.dart';

void showRatingDialog(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: Text(
        'Rate Our Service',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(
        Assets.imagesLogo,
        width: 200,
        height: 200,
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'put your comment here',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersController controller = Get.find();
        // controller.submitRating(orderId, response.rating.toString(), response.comment);
      },
    ),
  );
}
