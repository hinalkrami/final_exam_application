import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/comments/data/model/comments_model.dart';

abstract class CommentsRepository {
  Future<UserResultModel<CommentsModel>> getComments(int? id);
}
