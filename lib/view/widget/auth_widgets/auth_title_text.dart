import 'package:flutter/material.dart';

class CustomAuthTitleText extends StatelessWidget {
  final String text;
  const CustomAuthTitleText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
