import 'package:breathin/models/audio_model.dart';
import 'package:breathin/utils/app_colors.dart';
import 'package:breathin/utils/app_fonts.dart';
import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:breathin/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioBox extends StatelessWidget {
  final AudioModel audio;
  const AudioBox({super.key, required this.audio});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoute.listening, arguments: audio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 102.h, width: 127.w, decoration: BoxDecoration(borderRadius: 10.r.circular, image: DecorationImage(image: NetworkImage(audio.preview), fit: BoxFit.fill))),
          audio.title.text(family: AppFonts.raglika, size: 14.sp, weight: FontWeight.w400).topMargin(6.h),
          Row(
            children: [
              "${audio.length} Sec".text(color: AppColors.grey, weight: FontWeight.w400, size: 10.sp),
              CircleAvatar(radius: 3.r, backgroundColor: AppColors.black).leftMargin(10.w),
              "${audio.category} Sec".text(color: AppColors.black, weight: FontWeight.w400, size: 10.sp).leftMargin(10.w),
            ],
          ).topMargin(6.h)
        ],
      ),
    );
  }
}
