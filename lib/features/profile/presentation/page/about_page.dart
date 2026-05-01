import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_exam_application/features/auth/presentation/page/login_page.dart';
import 'package:final_exam_application/values/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Exception/app_exception.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../values/colors.dart';
import '../../../../values/text_style.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/custom_widgets.dart';
import '../../data/model/logout_model.dart';
import '../providers/profile_providers.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileProvider);
    TextStyle headingTextStyle = AppTextStyle.mediumText.copyWith(fontSize: 16.sp);
    return profileData.when(
      data: (data) {
        final user = data.data!.user;
        if (data.data == null) {
          return Center(child: Text(S.of(context).dataNotFound));
        }
        Widget bio() {
          return Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${user!.fullName!.split(' ').first}, ',
                        style: AppTextStyle.boldText.copyWith(fontSize: 28.sp),
                        overflow: .ellipsis,
                      ),
                      Text(
                        user.age.toString(),
                        overflow: .ellipsis,
                        style: AppTextStyle.regularText.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(S.of(context).editProfile),
                    icon: SvgPicture.asset(Assets.icons.editIcon.path),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      textStyle: AppTextStyle.mediumText,
                    ),
                  ),
                ],
              ),
              Text(
                user.username!,
                style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 17.sp),
              ),
              Row(
                spacing: 5.w,
                children: [
                  SvgPicture.asset(Assets.icons.location.path),
                  Text(
                    S.of(context).losAngeles20MileAway,
                    style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 17.sp),
                  ),
                ],
              ),
              Text(
                '🙎‍♀️ ${user.gender}',
                style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 17.sp),
              ),
            ],
          );
        }

        Widget interset() {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List<Widget>.generate(
              user!.interests!.length,
              (index) => _interestContainers(user.interests![index]),
            ),
          );
        }

        Widget profileImage() {
          return StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: _profileImageContainer(data.data!.posts![0].imageUrl!),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: _profileImageContainer(data.data!.posts![1].imageUrl!),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.5,
                child: _profileImageContainer(data.data!.posts![2].imageUrl!),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.5,
                child: _profileImageContainer(data.data!.posts![3].imageUrl!),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.5,
                child: _profileImageContainer(data.data!.posts![4].imageUrl!),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.5,
                child: _profileImageContainer(data.data!.posts![4].imageUrl!),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: .start,
          children: [
            bio(),
            20.verticalSpace,
            Text(S.of(context).interest, style: headingTextStyle),
            10.verticalSpace,
            interset(),
            20.verticalSpace,
            Text(S.of(context).imLookingFor, style: headingTextStyle),
            10.verticalSpace,
            _interestContainers(S.of(context).aBoyfriend),
            20.verticalSpace,
            Text(S.of(context).relationshipStatus, style: headingTextStyle),
            10.verticalSpace,
            _interestContainers(S.of(context).imDating),
            20.verticalSpace,
            Text(S.of(context).aboutMe, style: headingTextStyle),
            10.verticalSpace,
            Text(user!.bio!, style: AppTextStyle.regularText.copyWith(color: Colors.grey)),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(S.of(context).portfolioPicture, style: headingTextStyle),
                TextButton.icon(
                  onPressed: () {},
                  iconAlignment: .end,
                  label: Text(S.of(context).seeAll),
                  icon: SvgPicture.asset(Assets.icons.nextIcon.path),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0XFFEF4765),
                    textStyle: AppTextStyle.regularText,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            profileImage(),
          ],
        );
      },
      error: (error, stackTrace) => Text(S.of(context).dataNotFound),
      loading: () => Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
    );
  }

  Widget _interestContainers(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Text(text),
    );
  }

  Widget _profileImageContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: CachedNetworkImageProvider(imagePath), fit: .fill),
      ),
    );
  }
}
