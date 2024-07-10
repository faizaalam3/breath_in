import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BlurryImage extends StatelessWidget {
  final String image;
  final double? height, width;
  const BlurryImage({super.key, required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: AppColors.white20),
          ),
        ));
  }
}
