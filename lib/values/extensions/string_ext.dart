extension StringExt on String {
  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  /// Check if string is a valid phone number
  bool get isValidPhone {
    return RegExp(r"^[0-9]{10}$").hasMatch(this);
  }
}
