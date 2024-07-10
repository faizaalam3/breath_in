import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'custom_button.dart';
import 'local_image.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onPressed;
  const SocialButton({super.key, required this.title, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.black, width: .7.r), borderRadius: 10.r.circular),
      child: CustomButton(
          backgroundColor: AppColors.buttonBg,
          onPressed: onPressed,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center, children: [LocalImage(path: icon, height: 20.h, width: 20.w), title.text(size: 14.sp, weight: FontWeight.w400).leftMargin(14.w)])),
    );
  }
}
