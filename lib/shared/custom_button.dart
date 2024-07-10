import 'package:breathin/utils/app_colors.dart';
import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? color;
  final double? radius;
  final String text, subtitle;
  final IconData? iconData;
  final double? iconMargin;
  final double? iconSize;
  final Widget? child;
  final Function()? onPressed;
  final FontWeight? weight;
  const CustomButton(
      {super.key, this.weight, this.backgroundColor, this.color, this.radius, this.text = "", this.onPressed, this.iconData, this.iconMargin, this.iconSize, this.subtitle = "", this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: color ?? AppColors.black,
          backgroundColor: backgroundColor ?? AppColors.primary,
          elevation: 0,
          minimumSize: Size(335.w, 50.h),
          maximumSize: Size(335.w, 50.h),
          shape: RoundedRectangleBorder(borderRadius: (radius ?? 10.r).circular),
        ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [text.parentalText(weight: weight ?? FontWeight.w700), if (subtitle.isNotEmpty) subtitle.parentalText(fontSize: 10.sp)],
                ),
                if (iconData != null)
                  Icon(
                    iconData,
                    color: color,
                    size: iconSize ?? 24.sp,
                  ).leftMargin(iconMargin ?? 10.w),
              ],
            ));
  }
}
