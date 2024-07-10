import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../services/navigation_service.dart';

extension WidgetExtensionOnString on String {
  Widget text({String? family, Color? color, double? size, FontStyle? style, double? height, FontWeight? weight, TextAlign? textAlign, TextDecoration? decoration}) => Text(this,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: family, fontStyle: style, height: height, decoration: decoration, fontSize: size ?? 16.sp, fontWeight: weight ?? FontWeight.w500, color: color ?? AppColors.black));
  Widget parentalText({FontWeight? weight, String? family, Color? color, FontStyle? style, double? fontSize, TextAlign? textAlign}) =>
      Text(this, textAlign: textAlign ?? TextAlign.center, style: TextStyle(fontFamily: family, fontStyle: style, fontSize: fontSize, fontWeight: weight, color: color));

  void get showMessage => ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(SnackBar(
      content: text(color: AppColors.white20, size: 12.sp),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      showCloseIcon: true,
      shape: RoundedRectangleBorder(borderRadius: 15.r.circular)));
}

extension WidgetExtension on Widget {
  Widget get safe => SafeArea(child: this);
  Widget get expanded => Expanded(child: this);
  // Widget appendBottomNav({int index = 0, bool absorbing = false}) => Column(
  //       children: [Expanded(child: this), AbsorbPointer(absorbing: absorbing, child: BottomNav(index: index))],
  //     );
  Widget allMargin(double value) => Container(margin: value.allPadding, child: this);
  Widget horizontalMargin(double value) => Container(margin: value.horizontalPadding, child: this);
  Widget verticalMargin(double value) => Container(margin: value.verticalPadding, child: this);
  Widget topMargin(double value) => Container(margin: value.topPadding, child: this);
  Widget bottomMargin(double value) => Container(margin: value.bottomPadding, child: this);
  Widget leftMargin(double value) => Container(margin: value.leftPadding, child: this);
  Widget rightMargin(double value) => Container(margin: value.rightPadding, child: this);
  Widget get centerAlign => Align(alignment: Alignment.center, child: this);
  Widget get topCenterAlign => Align(alignment: Alignment.topCenter, child: this);
  Widget get rightAlign => Align(alignment: Alignment.centerRight, child: this);
  Widget get leftAlign => Align(alignment: Alignment.centerLeft, child: this);
}

extension PaddingAndRadius on double {
  EdgeInsets get allPadding => EdgeInsets.all(this);
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get topPadding => EdgeInsets.only(top: this);
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);
  EdgeInsets get leftPadding => EdgeInsets.only(left: this);
  EdgeInsets get rightPadding => EdgeInsets.only(right: this);
  BorderRadius get circular => BorderRadius.circular(this);
  BorderRadius get topCircular => BorderRadius.vertical(top: Radius.circular(this));
}
