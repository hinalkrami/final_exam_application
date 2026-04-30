import 'dart:convert';

/// user_id : 1

LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));
String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  LogoutModel({num? userId}) {
    _userId = userId;
  }

  LogoutModel.fromJson(dynamic json) {
    _userId = json['user_id'];
  }
  num? _userId;
  LogoutModel copyWith({num? userId}) => LogoutModel(userId: userId ?? _userId);
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    return map;
  }
}
