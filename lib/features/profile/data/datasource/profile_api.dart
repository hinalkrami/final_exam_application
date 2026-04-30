import 'package:dio/dio.dart';
import 'package:final_exam_application/features/profile/data/model/logout_model.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../auth/data/model/user_result_model.dart';
part 'profile_api.g.dart';

@RestApi()
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET('${ApiEndpoints.getSingleUser}/{id}')
  Future<UserResultModel<ProfileModel>> getSingleUser(@Path() int? id);

  @POST(ApiEndpoints.logout)
  Future<UserResultModel> logOut(@Body() LogoutModel? id);
}
