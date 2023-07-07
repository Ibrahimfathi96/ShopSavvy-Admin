import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_savvy_admin/core/class/status_request.dart';
import 'package:shop_savvy_admin/core/constants/image_assets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LottieBuilder.asset(
              AppImageFromAssets.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.internetFailure
            ? Center(
                child: LottieBuilder.asset(
                  AppImageFromAssets.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: LottieBuilder.asset(
                      AppImageFromAssets.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: LottieBuilder.asset(
                          AppImageFromAssets.noData,
                          width: 250,
                          height: 250,
                        ),
                      )
                    : widget;
  }
}

class HandlingRequests extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingRequests(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: LottieBuilder.asset(
              AppImageFromAssets.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.internetFailure
            ? Center(
                child: LottieBuilder.asset(
                  AppImageFromAssets.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: LottieBuilder.asset(
                      AppImageFromAssets.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : widget;
  }
}
