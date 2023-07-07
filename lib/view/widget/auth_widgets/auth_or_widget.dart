import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAuthORWidget extends StatelessWidget {
  const CustomAuthORWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 2,
            color: Colors.black,
          ),
          Text("22".tr),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
