import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomWidgets {
  static Widget circularIndicator() {
    return SizedBox(
      height: 1.sh * 0.035,
      width: 1.sw * 0.08,
      child: CircularProgressIndicator(color: Colors.white, strokeCap: .round, strokeWidth: 5),
    );
  }

  static void showSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  static void internetConnectivityMsg() {
    Fluttertoast.showToast(msg: 'Internet is not connected');
  }
}
