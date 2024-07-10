import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocalImage extends StatelessWidget {
  const LocalImage({
    Key? key,
    required this.path,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.blendMode,
    this.isIcon = false,
  }) : super(key: key);
  const LocalImage.icon({
    Key? key,
    required this.path,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.blendMode,
    this.isIcon = true,
  }) : super(key: key);

  final bool isIcon;
  final String path;
  final Color? color;
  final double? height, width;
  final BoxFit fit;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    if (path.isNotEmpty) {
      if (path.endsWith(".svg")) {
        return SvgPicture.asset(path, width: width ?? (isIcon ? 24.w : null), color: color, height: height ?? (isIcon ? 24.h : null), fit: fit);
      } else if (path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.gif')) {
        return Image.asset(
          path,
          width: width ?? (isIcon ? 24.w : null),
          height: height ?? (isIcon ? 24.h : null),
          fit: fit,
          color: color,
          colorBlendMode: blendMode,
        );
      } else {
        return Placeholder(fallbackHeight: height ?? (isIcon ? 24.w : 100.w), fallbackWidth: width ?? (isIcon ? 24.w : 100.w));
      }
    } else {
      return Placeholder(fallbackHeight: height ?? (isIcon ? 24.w : 100.w), fallbackWidth: width ?? (isIcon ? 24.w : 100.w));
    }
  }
}
