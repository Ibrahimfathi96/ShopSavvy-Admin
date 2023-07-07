import 'package:flutter/material.dart';

class CustomLangButton extends StatelessWidget {
  final String text;
  final String name;
  final void Function() onTap;
  const CustomLangButton({
    super.key,
    required this.text,
    required this.name, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: Image.asset(
              name,fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.black),
          ),
        ],
      ),
    );
  }
}
