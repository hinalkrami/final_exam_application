import 'package:final_exam_application/core/Exception/app_exception.dart';
import 'package:final_exam_application/features/auth/data/model/login_model.dart';
import 'package:final_exam_application/features/auth/presentation/page/sign_up_page.dart';
import 'package:final_exam_application/features/auth/presentation/providers/auth_provider.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_background.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_button.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:final_exam_application/values/extensions/export.dart';
import 'package:final_exam_application/values/text_style.dart';
import 'package:final_exam_application/values/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final isValidatedProvider = StateProvider<bool>((ref) => false);
  late GlobalKey<FormState> _formKey;
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumberController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      ref.read(isValidatedProvider.notifier).state = true;
    } else {
      final loginUser = LoginModel(mobile: phoneNumberController.text);
      AppException.handleApiCall(
        context: context,
        apiCall: () => ref.read(authProvider.notifier).loginData(loginUser),
        statusCode: () => ref.read(authProvider.notifier).statusCode,
        message: () => ref.read(authProvider.notifier).message,
      );
      if (ref.read(authProvider.notifier).statusCode == 200) {
        context.go('/profile');
      }
    }
  }

  void signUp() {
    ContextExt(context).push(SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    final isValidate = ref.watch(isValidatedProvider);
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          Positioned(
            top: 115.h,
            left: 130.w,
            child: SvgPicture.asset(Assets.images.logo.path, height: 1.sh * 0.15),
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
                  Text(S.of(context).login, style: AppTextStyle.boldText.copyWith(fontSize: 28.sp)),
                  CustomTextField(
                    hintText: S.of(context).phoneNumber,
                    keyboardType: .phone,
                    controller: phoneNumberController,
                    suffixIcon: Assets.icons.phoneIcon.path,
                    inputFormatter: Validators().numberFormatter,
                    validator: Validators(hint: S.of(context).phoneNumber).phoneNumberValidation,
                    isValidate: isValidate,
                  ),
                  20.verticalSpace,
                  CustomButton.elevatedButton(
                    buttonText: authState.isLoading
                        ? CustomWidgets.circularIndicator()
                        : Text(S.of(context).login),
                    onPressed: login,
                  ),
                  CustomButton.textButton(buttonText: S.of(context).singUp, onPressed: signUp),
                ],
              ).wrapPaddingAll(20),
            ),
          ),
        ],
      ),
    );
  }
}
