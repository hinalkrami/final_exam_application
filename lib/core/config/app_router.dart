import 'package:final_exam_application/core/config/app_router_path.dart';
import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:final_exam_application/features/auth/presentation/page/sign_up_page.dart';
import 'package:final_exam_application/features/comments/presentation/page/comments_page.dart';
import 'package:final_exam_application/features/profile/presentation/page/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRouterPath.login,
    routes: <RouteBase>[
      GoRoute(path: AppRouterPath.login, name: 'login', builder: (context, state) => LoginPage()),
      GoRoute(
        path: AppRouterPath.signUp,
        name: 'signUp',
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: AppRouterPath.profile,
        name: 'profile',
        builder: (context, state) {
          return ProfilePage();
        },
      ),
      GoRoute(
        path: AppRouterPath.comments,
        name: 'comments',
        builder: (context, state) {
          final commentId = state.pathParameters['id'];

          return CommentsPage(id: int.parse(commentId!));
        },
      ),
    ],
  );
});
