import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_exam_application/core/Exception/app_exception.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:final_exam_application/features/comments/data/model/add_comments_model.dart';
import 'package:final_exam_application/features/comments/data/model/comments_model.dart';
import 'package:final_exam_application/features/comments/presentation/providers/comments_provider.dart';
import 'package:final_exam_application/features/profile/presentation/providers/profile_providers.dart';
import 'package:final_exam_application/values/colors.dart';
import 'package:final_exam_application/values/extensions/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../values/text_style.dart';

class CommentsPage extends ConsumerStatefulWidget {
  CommentsPage({super.key, this.id});
  int? id;

  @override
  ConsumerState createState() => _CommentsPageState();
}

class _CommentsPageState extends ConsumerState<CommentsPage> {
  late TextEditingController commentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentController = TextEditingController();
    Future.microtask(() {
      getComments();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentController.dispose();
  }

  Future<void> getComments() async {
    try {
      AppException.handleApiCall(
        context: context,
        apiCall: () async => await ref.read(commentsProvider.notifier).getComments(widget.id),
        statusCode: () => ref.read(commentsProvider.notifier).statusCode,
        message: () => ref.read(commentsProvider.notifier).message,
      );
    } catch (e) {
      debugPrint('Comment page get comments error:$e');
    }
  }

  Future<void> addComments(int id, AddCommentsModel user) async {
    try {
      AppException.handleApiCall(
        context: context,
        apiCall: () async => await ref.read(commentsProvider.notifier).addComments(id, user),
        statusCode: () => ref.read(commentsProvider.notifier).statusCode,
        message: () => ref.read(commentsProvider.notifier).message,
      );
    } catch (e) {
      debugPrint('Comment page add comments error:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final commentData = ref.watch(commentsProvider);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: SvgPicture.asset(Assets.icons.backArrowIcon.path),
        ),
        title: Text(S.of(context).comments),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTextStyle.mediumText.copyWith(color: Colors.black),
      ),
      body: commentData.when(
        data: (data) {
          final comments = data.data?.comments;
          if (comments == null) {
            return Center(child: Text(S.of(context).noDataAvailable));
          }
          return Column(
            children: [
              customListTile(
                image: AssetImage(Assets.images.profileImage.path),
                comment:
                    '"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage." - Lao Tzu',
              ),
              10.verticalSpace,
              Divider(color: AppColors.dividerColor, height: 0),
              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) => customListTile(
                    image: CachedNetworkImageProvider(comments[index].user!.profileImage!),
                    name: comments[index].user!.fullName ?? 'No Name',
                    timing: comments[index].commentTiming,
                    comment: comments[index].comment!,
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => Center(child: Text(S.of(context).dataNotFound)),
        loading: () => Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
      ),
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: .start,
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.primaryColor,
              controller: commentController,
              textCapitalization: .sentences,
              keyboardType: .text,
              textInputAction: .send,
              maxLines: 1,
              autocorrect: true,
              enableInteractiveSelection: true,
              keyboardAppearance: .light,
              decoration: InputDecoration(
                filled: true,
                hintStyle: AppTextStyle.regularText.copyWith(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                fillColor: AppColors.circleBoarderColor,
                hintText: S.of(context).comment,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              addComments(widget.id!, AddCommentsModel(userId: 1, comment: commentController.text));
              commentController.clear();
            },
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            mini: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: commentData.isLoading
                ? CustomWidgets.circularIndicator()
                : SvgPicture.asset(Assets.icons.sendIcon.path),
          ),
        ],
      ).wrapPaddingOnly(left: 30.w),
    );
  }

  Widget customListTile({ImageProvider? image, String? name, String? comment, String? timing}) {
    return ListTile(
      leading: Container(
        width: 1.sw * 0.13,
        height: 1.sh * 0.1,
        decoration: BoxDecoration(
          shape: .circle,
          image: DecorationImage(image: image!, fit: .cover),
        ),
      ),
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(name ?? '', style: AppTextStyle.mediumText),
          Text(
            timing ?? '',
            style: AppTextStyle.regularText.copyWith(color: Colors.grey, fontSize: 12.sp),
          ),
        ],
      ),
      subtitle: Text(
        comment ?? 'No comments',
        style: AppTextStyle.regularText.copyWith(
          color: AppColors.commentTextColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
