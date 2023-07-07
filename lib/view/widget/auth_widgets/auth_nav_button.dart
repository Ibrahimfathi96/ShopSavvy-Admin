import 'package:flutter/material.dart';

class AuthNavButton extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;

  const AuthNavButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black87,fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
