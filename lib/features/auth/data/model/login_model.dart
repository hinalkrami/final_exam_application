import 'dart:convert';

/// mobile : "+971501234567"

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({String? mobile}) {
    _mobile = mobile;
  }

  LoginModel.fromJson(dynamic json) {
    _mobile = json['mobile'];
  }
  String? _mobile;
  LoginModel copyWith({String? mobile}) => LoginModel(mobile: mobile ?? _mobile);
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    return map;
  }
}
