import 'package:final_exam_application/values/button_style.dart';
import 'package:flutter/material.dart';

class CustomButton {
  static Widget elevatedButton({Widget? buttonText, void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.elevatedButtonStyle,
      child: buttonText,
    );
  }

  static Widget textButton({String? buttonText, void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      style: AppButtonStyle.textButtonStyle,
      child: Text(buttonText!),
    );
  }
}
