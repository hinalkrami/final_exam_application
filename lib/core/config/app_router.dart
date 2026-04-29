import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:final_exam_application/features/auth/presentation/page/sign_up_page.dart';
import 'package:final_exam_application/features/profile/presentation/page/profile_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: '/auth/signUp', builder: (context, state) => SignUpPage()),
      GoRoute(
        path: '/profile/:id',
        builder: (context, state) {
          return ProfilePage(id: int.parse(state.pathParameters['id']!));
        },
      ),
    ],
  );
}
