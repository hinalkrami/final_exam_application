import 'package:dio/dio.dart';
import 'package:final_exam_application/core/api/api_endpoints.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/comments/data/model/add_comments_model.dart';
import 'package:final_exam_application/features/comments/data/model/comments_model.dart' hide User;
import 'package:final_exam_application/features/profile/data/model/profile_model.dart' hide User;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/comments_model.dart';

part 'comments_api.g.dart';

@RestApi()
abstract class CommentsApi {
  factory CommentsApi(Dio dio) = _CommentsApi;
  @GET('${ApiEndpoints.comments}/{id}/getComments')
  Future<UserResultModel<CommentsModel>> getComments(@Path() int? id);

  @POST('${ApiEndpoints.comments}/{id}/addComment')
  Future<UserResultModel<CommentsModel>> addComments(
    @Path() int? id,
    @Body() AddCommentsModel? commentedUser,
  );
}
