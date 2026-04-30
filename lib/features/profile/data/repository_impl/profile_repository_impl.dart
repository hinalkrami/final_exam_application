import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/profile/data/datasource/profile_api.dart';
import 'package:final_exam_application/features/profile/data/model/logout_model.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart';
import 'package:final_exam_application/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _profileApi;
  ProfileRepositoryImpl(this._profileApi);

  @override
  Future<UserResultModel<ProfileModel>> getSingleUserData(int? id) async {
    final userResponse = await _profileApi.getSingleUser(id);
    return UserResultModel(
      data: userResponse.data!,
      message: userResponse.message,
      statusCode: userResponse.statusCode,
    );
  }

  @override
  Future<UserResultModel<ProfileModel>> logOut(LogoutModel? id) async {
    final response = await _profileApi.logOut(id);
    return UserResultModel(message: response.message, statusCode: response.statusCode);
  }
}
