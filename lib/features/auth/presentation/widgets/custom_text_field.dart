import 'dart:ui';

import 'package:final_exam_application/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../values/validators.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isValidate,
    this.inputFormatter,
    this.onTap,
    this.readOnly = false,
    this.initValue,
  });
  TextEditingController? controller;
  String? hintText;
  String? suffixIcon;
  List<TextInputFormatter>? inputFormatter;
  TextInputType? keyboardType;
  late Validators customValidator = Validators(hint: hintText);
  bool obscureText;
  String? Function(String?)? validator;
  bool? isValidate;
  void Function()? onTap;
  bool readOnly;
  String? initValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      cursorColor: Colors.black,
      style: AppTextStyle.regularText,
      inputFormatters: inputFormatter,
      initialValue: initValue,
      textCapitalization: .words,
      onTap: onTap,
      autovalidateMode: isValidate ?? false ? .onUserInteraction : null,
      validator: validator ?? customValidator.basicValidation,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.w, 10.h, 0, 0),
        hintText: hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(5),
        ),
        suffixIcon: SvgPicture.asset(suffixIcon!, fit: .scaleDown),
      ),
    );
  }
}
