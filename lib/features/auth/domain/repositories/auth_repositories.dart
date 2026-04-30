import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_model.dart';

import '../../data/model/user_result_model.dart';

abstract class AuthRepositories {
  Future<UserResultModel<UserModel>> login(LoginModel loginUser);
  Future<UserResultModel<UserModel>> signUp(UserModel userModel);
}
