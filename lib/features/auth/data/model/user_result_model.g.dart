// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResultModel<T> _$UserResultModelFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) => UserResultModel<T>(
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  message: json['message'] as String?,
  statusCode: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserResultModelToJson<T>(
  UserResultModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'code': instance.statusCode,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
