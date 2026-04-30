import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/profile/data/model/logout_model.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<UserResultModel<ProfileModel>> getSingleUserData(int? id);
  Future<UserResultModel> logOut(LogoutModel? id);
}
