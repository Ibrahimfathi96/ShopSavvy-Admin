import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';



class OTPTextFields extends StatelessWidget {
  final void Function(String)?  onSubmitted;

  const OTPTextFields({
    super.key, required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 50.0,
      borderRadius: BorderRadius.circular(20),
      numberOfFields: 5,
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      onSubmit: onSubmitted, // end onSubmit
    );
    //   PinCodeTextField(
    //   appContext: context,
    //   length: 6,
    //   cursorColor: Colors.black,
    //   keyboardType: TextInputType.number,
    //   autoFocus: true,
    //   obscureText: false,
    //   animationType: AnimationType.scale,
    //   pinTheme: PinTheme(
    //     shape: PinCodeFieldShape.box,
    //     borderRadius: BorderRadius.circular(5),
    //     fieldHeight: 50,
    //     fieldWidth: 40,
    //     activeFillColor: Colors.black12,
    //     inactiveFillColor: Colors.white,
    //     selectedColor: AppColors.primaryColor,
    //     selectedFillColor: Colors.white,
    //     borderWidth: 1,
    //     activeColor: AppColors.primaryColor,
    //     inactiveColor: Colors.black12,
    //   ),
    //   animationDuration: const Duration(milliseconds: 300),
    //   backgroundColor: Colors.white,
    //   enableActiveFill: true,
    //   // onCompleted: onCompleted,
    //   onSubmitted:onSubmitted ,
    //   onChanged: (value) {
    //   },
    // );
  }
}
