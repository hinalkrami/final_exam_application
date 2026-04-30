import 'dart:async';

import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/features/auth/data/model/user_result_model.dart';
import 'package:final_exam_application/features/comments/data/datasource/comments_api.dart';
import 'package:final_exam_application/features/comments/data/model/comments_model.dart';
import 'package:final_exam_application/features/comments/data/repository_impl/comments_repositories_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentsRepositoryProvider = Provider(
  (ref) => CommentsRepositoriesImpl(locators<CommentsApi>()),
);
final commentsProvider = AsyncNotifierProvider<CommentsProvider, UserResultModel<CommentsModel>>(
  () => CommentsProvider(),
);

class CommentsProvider extends AsyncNotifier<UserResultModel<CommentsModel>> {
  @override
  FutureOr<UserResultModel<CommentsModel>> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  late int statusCode = state.value!.statusCode ?? 0;
  late String message = state.value!.message ?? '';
  Future<UserResultModel<CommentsModel>> getComments(int? id) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await ref.read(commentsRepositoryProvider).getComments(id),
    );
    return state.requireValue;
  }
}
