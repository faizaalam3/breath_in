import 'package:breathin/utils/app_fonts.dart';
import 'package:breathin/utils/app_images.dart';
import 'package:breathin/utils/enums.dart';
import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:breathin/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../shared/blurry_image.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_field.dart';
import '../../../shared/social_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/key_board.dart';
import 'links.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (_, state) {
      if (state.status == AuthStatus.successful && state.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.home, (route) => false);
      }
    }, builder: (context, state) {
      LoginCubit cubit = context.read<LoginCubit>();
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BlurryImage(height: 812.h, width: 375.w, image: AppImages.bgImage),
            GestureDetector(
              onTap: KeyBoard.dismiss,
              child: ListView(
                children: [
                  "Welcome to Breathin".text(family: AppFonts.raglika, color: AppColors.white, size: 24.sp, weight: FontWeight.w400).topMargin(47.h),
                  "Please enter your details to continue".text(color: AppColors.white, size: 16.sp, weight: FontWeight.w400).topMargin(4.h),
                  ReactiveForm(
                      formGroup: cubit.form,
                      child: Column(
                        children: [
                          const CustomField(keyboardType: TextInputType.emailAddress, formControlName: 'email', hint: "example@gmail.com", label: "Email"),
                          CustomField(
                            formControlName: 'password',
                            hint: "must be 8 characters",
                            label: "Password",
                            obscureText: state.isObscured,
                            suffixWidget: Icon(state.isObscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash, color: AppColors.black60),
                            suffixTap: cubit.togglePasswordObscuring,
                          ).topMargin(20.h),
                        ],
                      )).topMargin(67.h),
                  InkWell(onTap: () {}, child: "Forgot Password?".text(size: 14.sp, weight: FontWeight.w400)).rightAlign.topMargin(12.h),
                  Row(children: [
                    Checkbox(
                      value: state.rememberMe,
                      onChanged: cubit.toggleRemember,
                      shape: const CircleBorder(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(color: AppColors.black, width: .5.w),
                      activeColor: AppColors.black,
                    ),
                    "I accept the terms and privacy policy".text(size: 14.sp, weight: FontWeight.w400)
                  ]).topMargin(28.h),
                  CustomButton(text: "Continue", onPressed: cubit.processLoginIfValid).topMargin(22.h),
                  Row(children: [
                    Container(width: 141.w, height: 1.h, decoration: BoxDecoration(color: AppColors.white20)),
                    "or".text(color: AppColors.white, weight: FontWeight.w400).leftMargin(15.w),
                    Container(width: 141.w, height: 1.h, decoration: BoxDecoration(color: AppColors.white20)).leftMargin(15.w),
                  ]).topMargin(47.h),
                  SocialButton(onPressed: () {}, title: "Sign in with google", icon: AppImages.google).topMargin(15.h),
                  SocialButton(onPressed: () {}, title: "Sign in with apple", icon: AppImages.apple).topMargin(12.h),
                ],
              ).horizontalMargin(24.w).safe,
            ),
          ],
        ),
      );
    });
  }
}
