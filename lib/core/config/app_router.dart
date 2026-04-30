import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:final_exam_application/features/auth/presentation/page/sign_up_page.dart';
import 'package:final_exam_application/features/comments/presentation/page/comments_page.dart';
import 'package:final_exam_application/features/profile/presentation/page/profile_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(path: '/', name: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/auth/signUp', name: 'signUp', builder: (context, state) => SignUpPage()),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) {
          return ProfilePage();
        },
      ),
      GoRoute(
        path: '/comments/:id',
        name: 'comments',
        builder: (context, state) {
          final commentId = state.pathParameters['id'];

          return CommentsPage(id: int.parse(commentId!));
        },
      ),
    ],
  );
}
