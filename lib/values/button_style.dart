import 'package:final_exam_application/values/colors.dart';
import 'package:final_exam_application/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonStyle {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    fixedSize: Size(1.sw, 1.sh * 0.07),
  );

  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black,
    fixedSize: Size(1.sw, 1.sh * 0.07),
    textStyle: AppTextStyle.mediumText.copyWith(fontSize: 18.spMin),
  );
}
