import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthSocialsWidget extends StatelessWidget {
  final void Function() facebookOnPressed;
  final void Function() googleOnPressed;
  final void Function() twitterOnPressed;
  final void Function() githubOnPressed;

  const AuthSocialsWidget({
    Key? key,
    required this.facebookOnPressed,
    required this.googleOnPressed,
    required this.twitterOnPressed,
    required this.githubOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: facebookOnPressed,
          icon: const Icon(
            FontAwesomeIcons.google,
            size: 40,
            color: Colors.deepOrangeAccent,
          ),
        ),
        IconButton(
          onPressed: facebookOnPressed,
          icon: const Icon(
            FontAwesomeIcons.facebook,
            size: 40,
            color: Colors.deepOrangeAccent,
          ),
        ),
        IconButton(
          onPressed: googleOnPressed,
          icon: const Icon(
            FontAwesomeIcons.github,
            size: 40,
            color: Colors.deepOrangeAccent,
          ),
        ),
        IconButton(
          onPressed: twitterOnPressed,
          icon: const Icon(
            FontAwesomeIcons.twitter,
            size: 40,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ],
    );
  }
}
