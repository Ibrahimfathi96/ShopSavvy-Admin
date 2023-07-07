import 'package:flutter/material.dart';

class CustomAuthBodyText extends StatelessWidget {
  final String text;
  const CustomAuthBodyText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 16)),
    );
  }
}
