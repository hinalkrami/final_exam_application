import 'dart:async';

import 'package:dio/dio.dart';
import 'package:final_exam_application/core/api/api_endpoints.dart';
import 'package:final_exam_application/features/comments/data/datasource/comments_api.dart';
import 'package:final_exam_application/features/profile/data/datasource/profile_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/auth/data/datasource/auth_api.dart';
import '../locators/locators.dart';

class DioClient {
  Future<void> provider() async {
    final dio = await setUp();
    locators.registerSingleton(dio);
    locators.registerSingleton(AuthApi(dio));
    locators.registerSingleton(ProfileApi(dio));
    locators.registerSingleton(CommentsApi(dio));
  }

  static FutureOr<Dio> setUp() async {
    final Dio dio = Dio()
      ..options = BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: Duration(seconds: 120),
        receiveTimeout: Duration(seconds: 120),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "access-control-allow-origin": "*",
          "connection": "keep-alive",
          "x-powered-by": "Express",
        },
      )
      ..interceptors.add(
        PrettyDioLogger(
          error: true,
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    return dio;
  }
}
