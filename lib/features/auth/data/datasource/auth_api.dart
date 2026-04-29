import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_exam_application/core/api/api_endpoints.dart';
import 'package:final_exam_application/core/api/dio_client.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user_model.dart';
part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;
  @POST(ApiEndpoints.login)
  Future<UserResultModel> loginData(@Body() LoginModel? loginUser);

  @POST(ApiEndpoints.signUp)
  Future<UserResultModel> signUp(@Body() UserModel? user);

  @GET('${ApiEndpoints.getSingleUser}/{id}')
  Future<UserResultModel> getSingleUser(@Path() int? id);
}
