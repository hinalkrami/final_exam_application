import 'package:final_exam_application/core/config/app_router.dart';
import 'package:final_exam_application/core/locators/locators.dart';
import 'package:final_exam_application/core/services/app_notification.dart';
import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:final_exam_application/values/colors.dart';
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

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [S.delegate],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,

          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.primaryColor.withAlpha(80),
            selectionHandleColor: AppColors.primaryColor,
            cursorColor: AppColors.primaryColor,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
