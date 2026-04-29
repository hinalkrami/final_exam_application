import 'dart:io';

import 'package:final_exam_application/features/auth/data/datasource/auth_api.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthApi authApi;
  AuthRepositoriesImpl({required this.authApi});
  @override
  Future<UserResultModel<UserModel>> login(LoginModel? loginUser) async {
    final userResponse = await authApi.loginData(loginUser);
    return UserResultModel(
      data: UserModel.fromJson(userResponse.data),
      message: userResponse.message,
      statusCode: userResponse.statusCode,
    );
  }

  @override
  Future<UserResultModel<UserModel>> signUp(UserModel? user) async {
    final userResponse = await authApi.signUp(user);
    return UserResultModel(
      data: UserModel.fromJson(userResponse.data),
      message: userResponse.message,
      statusCode: userResponse.statusCode,
    );
  }

  @override
  Future<UserResultModel<UserModel>> singleUser(int? id) async {
    final userResponse = await authApi.getSingleUser(id);
    return UserResultModel(
      data: UserModel.fromJson(userResponse.data),
      message: userResponse.message,
      statusCode: userResponse.statusCode,
    );
  }
}
