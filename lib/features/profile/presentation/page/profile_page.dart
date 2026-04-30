import 'package:final_exam_application/core/Exception/app_exception.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/presentation/providers/auth_provider.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_button.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:final_exam_application/features/profile/data/model/logout_model.dart';
import 'package:final_exam_application/features/profile/data/model/profile_model.dart';
import 'package:final_exam_application/features/profile/presentation/page/about_page.dart';
import 'package:final_exam_application/features/profile/presentation/page/feeds_page.dart';
import 'package:final_exam_application/features/profile/presentation/providers/profile_providers.dart';
import 'package:final_exam_application/values/colors.dart';
import 'package:final_exam_application/values/extensions/export.dart';
import 'package:final_exam_application/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'package:video_player/video_player.dart';

import '../../../../values/button_style.dart';
import '../../../auth/presentation/page/login_page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  ProfilePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ProfilePage> {
  final aboutTextBgColorProvider = StateProvider<Color>((ref) => AppColors.primaryColor);
  final feedTextBgColorProvider = StateProvider<Color>((ref) => Colors.grey);
  final isProfileImageVisibleProvider = StateProvider<bool>((ref) => true);

  late final tabBodyProvider = StateProvider<Widget>((ref) => AboutPage());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      getSingleUser(6);
    });
  }

  Future<void> logout(LogoutModel id) async {
    try {
      await AppException.handleApiCall(
        context: context,
        apiCall: () async => await ref.read(profileProvider.notifier).logOut(id),
        statusCode: () => ref.read(profileProvider.notifier).statusCode,
        message: () => ref.read(profileProvider.notifier).message,
      );
      Future.delayed(Duration(seconds: 2), () {
        if (!mounted) return;
        context.goNamed('login');
      });
    } catch (e) {
      debugPrint('Profile Page logout Error:${e.toString()}');
    }
  }

  Future<void> getSingleUser(int id) async {
    try {
      await AppException.handleApiCall(
        context: context,
        apiCall: () async => await ref.read(profileProvider.notifier).singleUserData(id),
        statusCode: () => ref.read(profileProvider.notifier).statusCode,
        message: () => ref.read(profileProvider.notifier).message,
      );
    } catch (e) {
      debugPrint('Profile Page Error:${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileProvider);
    final aboutTextBgColor = ref.watch(aboutTextBgColorProvider);
    final feedTextBgColor = ref.watch(feedTextBgColorProvider);
    final tabBody = ref.watch(tabBodyProvider);
    final isProfileImageVisible = ref.watch(isProfileImageVisibleProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profilePage),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        actions: [
          TextButton.icon(
            onPressed: () => logout(LogoutModel(userId: profileData.value!.data!.user!.id)),
            label: Text(
              'LogOut',
              style: AppTextStyle.mediumText.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
        titleTextStyle: AppTextStyle.mediumText.copyWith(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: profileData.when(
          data: (data) {
            if (data.data == null) {
              return Center(child: Text(S.of(context).dataNotFound));
            }
            return Center(
              child: Column(
                children: [
                  Visibility(
                    visible: isProfileImageVisible,
                    child: Stack(
                      alignment: .center,
                      children: [
                        SvgPicture.asset(Assets.images.profileBgCircle.path),
                        Container(
                          height: 1.sh * 0.28,
                          width: 1.sw * 0.33,
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
                            image: DecorationImage(
                              image: AssetImage(Assets.images.profileImage.path),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.circleBoarderColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              S.of(context).complete25,
                              style: AppTextStyle.mediumText.copyWith(fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            ref.read(aboutTextBgColorProvider.notifier).state = Color(0XFFE50C54);
                            ref.read(feedTextBgColorProvider.notifier).state = Colors.grey;
                            ref.read(tabBodyProvider.notifier).state = AboutPage();
                            ref.read(isProfileImageVisibleProvider.notifier).state = true;
                          },
                          child: Text(
                            S.of(context).about,
                            style: TextStyle(color: aboutTextBgColor),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.sh * 0.04,
                        width: 1.sw * 0.005,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            ref.read(feedTextBgColorProvider.notifier).state = Color(0XFFE50C54);
                            ref.read(aboutTextBgColorProvider.notifier).state = Colors.grey;
                            ref.read(tabBodyProvider.notifier).state = FeedsPage();
                            ref.read(isProfileImageVisibleProvider.notifier).state = false;
                          },
                          child: Text(S.of(context).feed, style: TextStyle(color: feedTextBgColor)),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  tabBody,
                ],
              ),
            ).wrapPaddingAll(10);
          },
          error: (error, stackTrace) => Text('No data found:$error'),
          loading: () => Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
        ),
      ),
    );
  }

  Widget elevatedButton({Widget? buttonText, void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.elevatedButtonStyle,
      child: buttonText,
    );
  }
}
