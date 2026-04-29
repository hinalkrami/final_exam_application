import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String fontFamily = 'Rubik';
  static TextStyle boldText = TextStyle(
    fontSize: 20.sp,
    fontWeight: .w700,
    fontFamily: 'Rubik',
    color: Colors.black,
  );
  static TextStyle lightText = TextStyle(fontWeight: .w300, fontFamily: fontFamily);
  static TextStyle mediumText = TextStyle(fontWeight: .w500, fontFamily: fontFamily);
  static TextStyle regularText = TextStyle(fontWeight: .w400, fontFamily: fontFamily);
}
