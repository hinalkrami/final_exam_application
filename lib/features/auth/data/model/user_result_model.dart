import 'package:json_annotation/json_annotation.dart';

part 'user_result_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, anyMap: true, explicitToJson: true)
class UserResultModel<T> {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'code')
  int? statusCode;

  @JsonKey(name: 'data')
  T? data;

  UserResultModel({this.data, this.message, this.statusCode});

  factory UserResultModel.fromJson(Map<String, dynamic> json, T Function(Object? value) fromJson) =>
      _$UserResultModelFromJson(json, fromJson);

  Map<String, dynamic> toJson(Object Function(T value) toJson) =>
      _$UserResultModelToJson(this, toJson);
}
