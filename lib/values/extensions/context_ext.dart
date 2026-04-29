// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  /// Navigation extensions
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page), (route) => false);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  /// Theme extensions
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Media Query extensions
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}
