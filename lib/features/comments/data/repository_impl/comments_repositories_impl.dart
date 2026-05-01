import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/comments/data/datasource/comments_api.dart';
import 'package:final_exam_application/features/comments/data/model/add_comments_model.dart';
import 'package:final_exam_application/features/comments/data/model/comments_model.dart';
import 'package:final_exam_application/features/comments/domain/repositories/comments_repository.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart' hide User;

class CommentsRepositoriesImpl extends CommentsRepository {
  final CommentsApi _commentsApi;
  CommentsRepositoriesImpl(this._commentsApi);
  @override
  Future<UserResultModel<CommentsModel>> getComments(int? id) async {
    final response = await _commentsApi.getComments(id);
    return UserResultModel(
      data: response.data,
      message: response.message,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<UserResultModel<CommentsModel>> addComments(int? id, AddCommentsModel? user) async {
    final response = await _commentsApi.addComments(id, user!);
    return UserResultModel(message: response.message, statusCode: response.statusCode);
  }
}
