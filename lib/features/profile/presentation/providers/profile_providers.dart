import 'dart:async';

import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/profile/data/datasource/profile_api.dart';
import 'package:final_exam_application/features/profile/data/model/logout_model.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart';
import 'package:final_exam_application/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:final_exam_application/features/profile/domain/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepositoryImpl>(
  (ref) => ProfileRepositoryImpl(locators<ProfileApi>()),
);
final profileProvider = AsyncNotifierProvider<ProfileProviders, UserResultModel<ProfileModel>>(
  () => ProfileProviders(),
);

class ProfileProviders extends AsyncNotifier<UserResultModel<ProfileModel>> {
  @override
  FutureOr<UserResultModel<ProfileModel>> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  late int statusCode = state.value!.statusCode ?? 0;
  late String message = state.value!.message ?? '';

  Future<UserResultModel<ProfileModel>> singleUserData(int? id) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await ref.read(profileRepositoryProvider).getSingleUserData(id),
    );
    return state.requireValue;
  }

  Future<UserResultModel<ProfileModel>> logOut(LogoutModel? id) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await ref.read(profileRepositoryProvider).logOut(id),
    );
    return state.requireValue;
  }
}
