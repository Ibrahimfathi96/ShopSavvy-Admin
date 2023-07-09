import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

class CustomAuthTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  const CustomAuthTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.controller,
    this.obscureText = false,
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        validator: validator,
        textInputAction: textInputAction,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrangeAccent),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrangeAccent),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrangeAccent),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              labelText,
            ),
          ),
          labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.deepOrangeAccent),
          suffixIcon: IconButton(
            padding: EdgeInsets.only(right: 20),
            onPressed: onPressed,
            icon: Icon(iconData),
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
