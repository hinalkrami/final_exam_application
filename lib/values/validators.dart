import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Validators {
  Validators({this.hint, this.password});
  String? hint;
  String? password;
  RegExp capital = RegExp(r'[A-Z]+');
  RegExp small = RegExp(r'[a-z]+');
  RegExp digit = RegExp(r'[0-9]+');
  RegExp symbols = RegExp(r'[!@#$%^&*()_-{}|:";<>?.,~`]');
  RegExp phoneNumber = RegExp(r'^[6,7,8,9][0-9]*');
  RegExp name = RegExp(r'^[a-zA-z ]+');
  RegExp email = RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]+$');
  late List<TextInputFormatter>? nameFormatter = [FilteringTextInputFormatter.allow(name)];
  late List<TextInputFormatter>? numberFormatter = [
    FilteringTextInputFormatter.deny(symbols),
    LengthLimitingTextInputFormatter(13),
  ];
  late List<TextInputFormatter>? ageFormatter = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(2),
  ];
  late String? Function(String?)? basicValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    }
    return null;
  };
  late String? Function(String?)? passwordValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (!capital.hasMatch(value)) {
      return 'At least one uppercase required';
    } else if (!small.hasMatch(value)) {
      return 'At least one lowercase required';
    } else if (!digit.hasMatch(value)) {
      return 'At least one digit required';
    } else if (!symbols.hasMatch(value)) {
      return 'At least one symbol required';
    } else if (value.length < 6) {
      return 'Password should of at least 6 letters';
    }
    return null;
  };
  late String? Function(String?)? confirmPassword = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (password != value) {
      return '$hint should be same as password';
    }
  };
  late String? Function(String?)? emailValidation = (value) {
    if (value!.isEmpty) {
      return 'Please enter ${hint?.toLowerCase()}.';
    } else if (!email.hasMatch(value)) {
      return 'Email should be in \'xyz12@gmail.com\'';
    }
    return null;
  };
  late String? Function(String?)? phoneNumberValidation = (value) {
    if (value!.isEmpty) {
      return '${hint!} should not be empty.';
    } else if (value.length < 10) {
      return '${hint!} should be in 10 digits.';
    }
    return null;
  };
  late String? Function(String?)? ageValidation = (value) {
    if (value!.isEmpty) {
      return '${hint!} should not be empty.';
    } else if (int.tryParse(value)! < 10) {
      return 'Age should be greater then 10';
    } else if (int.tryParse(value)! > 50) {
      return 'Age should be less then 50';
    }
    return null;
  };
}
