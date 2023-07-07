import 'package:flutter/material.dart';

class ForgetPasswordLockIcon extends StatelessWidget {
  const ForgetPasswordLockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      alignment: Alignment.center,
      child: const Icon(
        Icons.lock,
        color: Colors.deepOrangeAccent,
        size: 200,
      ),
    );
  }
}
