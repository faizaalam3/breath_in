import 'package:breathin/utils/app_colors.dart';
import 'package:breathin/utils/app_fonts.dart';
import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/blurry_image.dart';
import '../../utils/app_images.dart';
import 'cubit.dart';

class ListeningView extends StatelessWidget {
  const ListeningView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningState>(builder: (_, state) {
      ListeningCubit cubit = context.read<ListeningCubit>();
      return Scaffold(
        appBar: AppBar(title: state.audio.title.text(family: AppFonts.raglika)),
        body: Stack(
          children: [
            BlurryImage(height: 812.h, width: 375.w, image: AppImages.bgImage),
            Column(
              children: [
                InkWell(
                    onTap: cubit.onPlay, child: Icon(state.isPaused ? CupertinoIcons.play_arrow_solid : CupertinoIcons.pause_solid, color: AppColors.black60, size: 100.r).topMargin(67.h)),
                "${state.duration} / ${state.audio.length}".text(color: AppColors.black).topMargin(40.h),
              ],
            ).horizontalMargin(24.w).safe,
          ],
        ),
      );
    });
  }
}
