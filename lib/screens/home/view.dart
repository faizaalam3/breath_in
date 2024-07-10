import 'package:breathin/shared/audio_box.dart';
import 'package:breathin/utils/app_fonts.dart';
import 'package:breathin/utils/enums.dart';
import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/key_board.dart';
import 'links.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = context.read<HomeCubit>();
      return Scaffold(
        body: GestureDetector(
          onTap: KeyBoard.dismiss,
          child: Column(
            children: [
              "Breathin".text(family: AppFonts.raglika, color: AppColors.black, size: 20.sp, weight: FontWeight.w400).topMargin(47.h),
              Container(
                height: 142.h,
                width: 350.w,
                alignment: Alignment.centerLeft,
                child: state.status == CrudStatus.reading
                    ? "Loading audios".text()
                    : state.status == CrudStatus.error
                        ? state.message.text(color: AppColors.red)
                        : state.audios.isEmpty
                            ? "No audios found".text()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.audios.length,
                                itemBuilder: (_, index) => AudioBox(audio: state.audios[index]).leftMargin(index == 0 ? 0 : 15.w),
                              ),
              ).topMargin(47.h)
            ],
          ).horizontalMargin(24.w).safe,
        ),
      );
    });
  }
}
