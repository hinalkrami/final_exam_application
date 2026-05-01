import 'dart:convert';

/// user_id : 1
/// comment : "This is amazing! 😍"

AddCommentsModel addCommentsModelFromJson(String str) =>
    AddCommentsModel.fromJson(json.decode(str));
String addCommentsModelToJson(AddCommentsModel data) => json.encode(data.toJson());

class AddCommentsModel {
  AddCommentsModel({num? userId, String? comment}) {
    _userId = userId;
    _comment = comment;
  }

  AddCommentsModel.fromJson(dynamic json) {
    _userId = json['user_id'];
    _comment = json['comment'];
  }
  num? _userId;
  String? _comment;
  AddCommentsModel copyWith({num? userId, String? comment}) =>
      AddCommentsModel(userId: userId ?? _userId, comment: comment ?? _comment);
  num? get userId => _userId;
  String? get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['comment'] = _comment;
    return map;
  }
}
