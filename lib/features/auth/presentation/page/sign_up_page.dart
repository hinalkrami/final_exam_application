import 'dart:io';

import 'package:final_exam_application/core/Exception/app_exception.dart';
import 'package:final_exam_application/features/auth/data/model/user_model.dart';
import 'package:final_exam_application/features/auth/presentation/providers/auth_provider.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:final_exam_application/values/colors.dart';
import 'package:final_exam_application/values/extensions/context_ext.dart';
import 'package:final_exam_application/values/extensions/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../values/text_style.dart';
import '../../../../values/validators.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState createState() => _SingUpPageState();
}

class _SingUpPageState extends ConsumerState<SignUpPage> {
  late GlobalKey<FormState> _formKey;

  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  final isValidatedProvider = StateProvider<bool>((ref) => false);
  final checkBoxValueProvider = StateProvider<bool>((ref) => false);

  final pickedImage = ImagePicker();
  final image = StateProvider<XFile?>((ref) => null);
  Future<void> getGalleryImage() async {
    final XFile? pickImage = await pickedImage.pickImage(source: .gallery);
    ref.read(image.notifier).state = pickImage;
    if (!mounted) return;
    context.pop();
  }

  Future<void> getCameraImage() async {
    final XFile? pickImage = await pickedImage.pickImage(source: .camera);
    ref.read(image.notifier).state = pickImage;
    if (!mounted) return;
    context.pop();
  }

  void _onTap() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => SizedBox(
        width: 1.sw,
        child: Column(
          spacing: 20,
          mainAxisSize: .min,
          children: [
            _customBottomSheetButton(
              label: S.of(context).chooseFromGallery,
              icon: Icons.photo_library_sharp,
              onPressed: getGalleryImage,
            ),
            _customBottomSheetButton(
              label: S.of(context).takePhoto,
              icon: Icons.camera_alt_sharp,
              onPressed: getCameraImage,
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumberController = TextEditingController();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995),
      lastDate: DateTime.now(),
    );
    String formattedDate = DateFormat('MMMM dd,yyyy').format(pickedDate!);
    dobController.text = formattedDate;
  }

  void signUp() {
    if (!_formKey.currentState!.validate()) {
      ref.read(isValidatedProvider.notifier).state = true;
    } else {
      UserModel? user = UserModel(
        mobile: phoneNumberController.text,
        username: userNameController.text,
        email: emailController.text,
        dob: dobController.text,
        fullName: fullNameController.text,
      );
      AppException.handleApiCall(
        context: context,
        apiCall: () => ref.read(authProvider.notifier).signUpData(user),
        statusCode: () => ref.read(authProvider.notifier).statusCode!,
        message: () => ref.read(authProvider.notifier).message!,
      );
      Future.delayed(Duration(seconds: 3), () {
        if (!mounted) return;
        context.pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isValidate = ref.watch(isValidatedProvider);
    final selectedImage = ref.watch(image);
    final checkBoxValue = ref.watch(checkBoxValueProvider);
    final authState = ref.watch(authProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: context.pop,
          icon: SvgPicture.asset(Assets.icons.backArrowIcon.path),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          child: Stack(
            children: [
              CustomBackground(),
              Positioned(
                top: 50.h,
                left: 120.w,
                width: 1.sw * 0.5,
                child: InkWell(
                  onTap: _onTap,
                  child: Stack(
                    children: [
                      Container(
                        height: 1.sh * 0.35,
                        width: 1.sw * 0.35,
                        decoration: BoxDecoration(
                          shape: .circle,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                          image: selectedImage != null
                              ? DecorationImage(
                                  fit: .cover,
                                  image: FileImage(File(selectedImage.path)),
                                )
                              : DecorationImage(
                                  fit: .cover,
                                  image: FileImage(File(Assets.images.profileImage.path)),
                                ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        right: 35.h,
                        child: Container(
                          height: 1.sh * 0.13,
                          width: 1.sw * 0.12,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: .circle,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 2.r,
                                color: Colors.black.withAlpha(10),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(Assets.icons.editIcon.path),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 260.h,
                width: 1.sw,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    spacing: 10.h,
                    children: [
                      Text(
                        S.of(context).signUp,
                        style: AppTextStyle.boldText.copyWith(fontSize: 28.sp),
                      ),
                      CustomTextField(
                        hintText: S.of(context).fullName,
                        keyboardType: .name,
                        controller: fullNameController,
                        suffixIcon: Assets.icons.userIcon.path,
                        inputFormatter: Validators().nameFormatter,
                        validator: Validators(hint: S.of(context).fullName).basicValidation,
                        isValidate: isValidate,
                      ),
                      CustomTextField(
                        hintText: S.of(context).userName,
                        keyboardType: .text,
                        controller: userNameController,
                        suffixIcon: Assets.icons.atIcon.path,
                        isValidate: isValidate,
                      ),
                      CustomTextField(
                        hintText: S.of(context).dob,
                        onTap: _selectDate,
                        readOnly: true,
                        controller: dobController,
                        suffixIcon: Assets.icons.calanderIcon.path,
                        isValidate: isValidate,
                      ),
                      CustomTextField(
                        hintText: S.of(context).phoneNumber,
                        keyboardType: .phone,
                        controller: phoneNumberController,
                        suffixIcon: Assets.icons.phoneIcon.path,
                        inputFormatter: Validators().numberFormatter,
                        validator: Validators(
                          hint: S.of(context).phoneNumber,
                        ).phoneNumberValidation,
                        isValidate: isValidate,
                      ),
                      CustomTextField(
                        hintText: S.of(context).email,
                        keyboardType: .emailAddress,
                        controller: emailController,
                        suffixIcon: Assets.icons.atIcon.path,
                        validator: Validators(hint: S.of(context).email).emailValidation,
                        isValidate: isValidate,
                      ),
                      CheckboxListTile(
                        value: checkBoxValue,
                        onChanged: (value) =>
                            ref.read(checkBoxValueProvider.notifier).state = value!,
                        controlAffinity: .leading,
                        activeColor: AppColors.primaryColor,
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By clicking Sign Up, you accept our terms of ',
                                style: AppTextStyle.regularText.copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'privacy policy ',
                                style: AppTextStyle.boldText.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 12,
                                  decoration: .underline,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: AppTextStyle.regularText.copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'user agreement.',
                                style: AppTextStyle.boldText.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 12,
                                  decoration: .underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton.elevatedButton(
                        buttonText: authState.isLoading
                            ? CustomWidgets.circularIndicator()
                            : Text(S.of(context).signUp),
                        onPressed: signUp,
                      ),
                    ],
                  ),
                ).wrapPaddingAll(10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customBottomSheetButton({String? label, IconData? icon, void Function()? onPressed}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor.withAlpha(90),
        foregroundColor: Colors.white,
        fixedSize: Size(1.sw * 0.7, 1.sh * 0.06),
        textStyle: AppTextStyle.mediumText.copyWith(color: Colors.white),
      ),
      onPressed: onPressed,
      label: Text(label!),
      icon: Icon(icon),
    );
  }
}
