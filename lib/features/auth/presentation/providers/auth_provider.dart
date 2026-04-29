import 'dart:async';
import 'dart:io';

import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/features/auth/data/datasource/auth_api.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/auth/data/repositories_impl/auth_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

final repositoryProvider = Provider((ref) => AuthRepositoriesImpl(authApi: locators<AuthApi>()));
final authProvider = AsyncNotifierProvider<AuthProvider, UserResultModel>(() => AuthProvider());

class AuthProvider extends AsyncNotifier<UserResultModel> {
  @override
  FutureOr<UserResultModel> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  late int statusCode = state.value!.statusCode ?? 0;
  late String message = state.value!.message ?? '';
  Future<UserResultModel> loginData(LoginModel? loginUser) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await ref.read(repositoryProvider).login(loginUser));
    return state.requireValue;
  }

  Future<UserResultModel> signUpData(UserModel? user) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await ref.read(repositoryProvider).signUp(user));
    return state.requireValue;
  }

  Future<UserResultModel> singleUserData(int? id) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await ref.read(repositoryProvider).singleUser(id));
    return state.requireValue;
  }
}
