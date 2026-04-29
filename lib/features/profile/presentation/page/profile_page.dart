import 'package:final_exam_application/core/Exception/app_exception.dart';
import 'package:final_exam_application/features/auth/presentation/providers/auth_provider.dart';
import 'package:final_exam_application/values/colors.dart';
import 'package:final_exam_application/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class ProfilePage extends ConsumerStatefulWidget {
  ProfilePage({super.key, required this.id});
  int id;

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSingleUser(widget.id);
  }

  void getSingleUser(int id) {
    AppException.handleApiCall(
      context: context,
      apiCall: () => ref.read(authProvider.notifier).singleUserData(id),
      statusCode: () => ref.read(authProvider.notifier).statusCode,
      message: () => ref.read(authProvider.notifier).message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profilePage),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTextStyle.mediumText.copyWith(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 1.sw * 0.49,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: .circle,
                border: Border.all(color: AppColors.circleBoarderColor, width: 7),
              ),
              child: Stack(
                alignment: .bottomCenter,
                children: [
                  Container(
                    height: 1.sh * 0.35,
                    width: 1.sw * 0.35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.black.withAlpha(30),
                        ),
                      ],
                      shape: .circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      image: DecorationImage(image: AssetImage(Assets.images.profileImage.path)),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.circleBoarderColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        S.of(context).complete25,
                        style: AppTextStyle.mediumText.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
