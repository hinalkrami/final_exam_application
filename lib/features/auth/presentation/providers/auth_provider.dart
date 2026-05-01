import 'dart:async';
import 'dart:io';

import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/features/auth/data/datasource/auth_api.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_model.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/auth/data/repositories_impl/auth_repositories_impl.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../core/networking/internet_connectivity.dart';

final repositoryProvider = Provider((ref) => AuthRepositoriesImpl(authApi: locators<AuthApi>()));
final authProvider = AsyncNotifierProvider<AuthProvider, UserResultModel>(() => AuthProvider());

class AuthProvider extends AsyncNotifier<UserResultModel> {
  late final checkInternet = ref.watch(internetStatusProvider);

  late int statusCode = state.value?.statusCode ?? 0;
  late String message = state.value?.message ?? '';
  Future<UserResultModel> loginData(LoginModel? loginUser) async {
    checkInternet.whenData((value) {
      if (value == InternetStatus.disconnected) {
        return CustomWidgets.internetConnectivityMsg();
      }
    });
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await ref.read(repositoryProvider).login(loginUser));
    return state.requireValue;
  }

  Future<UserResultModel> signUpData(UserModel? user) async {
    checkInternet.whenData((value) {
      if (value == InternetStatus.disconnected) {
        return CustomWidgets.internetConnectivityMsg();
      }
    });
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await ref.read(repositoryProvider).signUp(user));
    return state.requireValue;
  }

  @override
  FutureOr<UserResultModel<dynamic>> build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
