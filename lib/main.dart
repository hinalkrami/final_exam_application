import 'package:final_exam_application/core/config/app_router.dart';
import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/core/services/app_notification.dart';
import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await AppNotification().initialize();
  await AppNotification().requestPermission();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [S.delegate],
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        routerConfig: _router,
      ),
    );
  }
}
