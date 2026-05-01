import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_exam_application/features/comments/presentation/page/comments_page.dart';
import 'package:final_exam_application/features/comments/presentation/providers/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../values/colors.dart';
import '../../../../values/text_style.dart';
import '../providers/profile_providers.dart';

class FeedsPage extends ConsumerStatefulWidget {
  const FeedsPage({super.key});

  @override
  ConsumerState createState() => _FeedsPageState();
}

class _FeedsPageState extends ConsumerState<FeedsPage> {
  final videoPlayerProvider = FutureProvider.autoDispose.family<VideoPlayerController, String?>((
    ref,
    url,
  ) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(url!));
    await controller.initialize();
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  });
  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileProvider);
    return profileData.when(
      data: (data) {
        final feeds = data.data!.feed;
        if (data.data == null) {
          return Center(child: Text(S.of(context).dataNotFound));
        }
        Widget feedsHeader(int index) {
          return ListTile(
            leading: Container(
              height: 1.sh * 0.6,
              width: 1.sw * 0.13,
              decoration: BoxDecoration(
                shape: .circle,
                boxShadow: [BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 3)],
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
                image: DecorationImage(
                  fit: .cover,
                  image: CachedNetworkImageProvider(feeds![index].user!.profileImage!),
                ),
              ),
            ),
            title: Text(
              feeds[index].user!.fullName!,
              style: AppTextStyle.mediumText.copyWith(fontSize: 17.sp),
            ),
            subtitle: Text(
              feeds[index].postTiming!,
              style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 14.sp),
            ),
            trailing: PopupMenuButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              icon: Icon(Icons.more_vert, color: Colors.black),
              itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  padding: EdgeInsets.only(right: 50.w, left: 10.w, top: 0, bottom: 0),
                  height: 10,
                  child: Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(Assets.icons.editIconBlack.path),
                      Text(
                        S.of(context).edit,
                        style: AppTextStyle.regularText.copyWith(fontSize: 17.sp),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  enabled: false,
                  height: 0,
                  padding: EdgeInsets.all(0),
                  child: Divider(color: Colors.grey.shade300),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.only(right: 50.w, left: 10.w, top: 0, bottom: 0),
                  height: 10,
                  child: Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(Assets.icons.deleteIcon.path),
                      Text(
                        S.of(context).delete,
                        style: AppTextStyle.regularText.copyWith(
                          color: Colors.red,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        Widget feedsBodyText(int index) {
          return Text(
            feeds![index].caption ?? 'No Caption Available',
            style: AppTextStyle.regularText,
          );
        }

        Widget feedsMedia(int index) {
          Widget feedVideo(int index) {
            final videoPlayController = ref.watch(videoPlayerProvider(feeds![index].videoUrl!));
            return videoPlayController.when(
              data: (data) {
                data.play();
                return AspectRatio(
                  aspectRatio: data.value.aspectRatio,
                  child: Container(
                    clipBehavior: .antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () => data.value.isPlaying ? data.pause() : data.play(),
                      child: Stack(
                        alignment: .center,
                        children: [
                          VideoPlayer(data),
                          Visibility(
                            visible: !data.value.isPlaying,
                            child: SvgPicture.asset(Assets.icons.playIcon.path),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Text(S.of(context).dataNotFound),
              loading: () =>
                  Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
            );
          }

          return feeds![index].imageUrl != null
              ? Container(
                  clipBehavior: .antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: CachedNetworkImage(imageUrl: feeds[index].imageUrl!),
                )
              : feeds[index].videoUrl != null
              ? feedVideo(index)
              : Container();
        }

        Widget feedsLikeComments(int index) {
          return Row(
            spacing: 5.w,
            children: [
              SvgPicture.asset(Assets.icons.likeIcon.path),
              Text(
                feeds![index].likesCount!.toString(),
                style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 14.sp),
              ),
              InkWell(
                onTap: () => context.push('/comments/${feeds[index].id.toString()}'),
                child: SvgPicture.asset(Assets.icons.chatIcon.path),
              ),
              Text(
                feeds[index].commentsCount!.toString(),
                style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 14.sp),
              ),
            ],
          );
        }

        Widget feedContainer(int index) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.circleBoarderColor),
            ),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: .start,
              children: [
                feedsHeader(index),
                feedsMedia(index),
                feedsBodyText(index),
                feedsLikeComments(index),
              ],
            ),
          );
        }

        return Column(
          spacing: 20.h,
          children: List<Widget>.generate(feeds!.length, (index) => feedContainer(index)),
        );
      },
      error: (error, stackTrace) => Text(S.of(context).dataNotFound),
      loading: () => Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
    );
  }
}
