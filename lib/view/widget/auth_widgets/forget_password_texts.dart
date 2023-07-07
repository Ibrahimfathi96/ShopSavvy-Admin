import 'package:flutter/material.dart';

class ForgetPasswordTexts extends StatelessWidget {
  final String text1;
  final String text2;
  const ForgetPasswordTexts({
    super.key, required this.text1, required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
