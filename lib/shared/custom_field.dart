import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../utils/app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {Key? key,
      required this.formControlName,
      this.label,
      this.hint,
      this.height,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.maxLines,
      this.minLines,
      this.inputFormatters,
      this.textCapitalization = TextCapitalization.none,
      this.prefixTap,
      this.suffixTap,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixPadding,
      this.contentPadding,
      this.validationMessages,
      this.fillColor,
      this.readOnly = false,
      this.forceColors = false,
      this.obscureText = false,
      this.autofocus = false,
      this.isMultiline = false,
      this.disabledBorder = false,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.onTap,
      this.onChanged,
      this.onSubmitted,
      this.valueTransformer,
      this.floatingLabelBehavior,
      this.hintStyle,
      this.style,
      this.textAlign,
      this.floatingLabelStyle,
      this.labelStyle,
      this.controller})
      : super(key: key);
  final Function(FormControl)? onTap, onChanged, onSubmitted;
  final String formControlName;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? style, hintStyle, labelStyle, floatingLabelStyle;
  final String? label;
  final String? hint;
  final double? height;
  final bool obscureText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines, minLines;
  final TextCapitalization textCapitalization;
  final Widget? prefixWidget, suffixWidget;
  final Function()? prefixTap, suffixTap;
  final Function(dynamic)? valueTransformer;
  final EdgeInsetsGeometry? contentPadding, prefixPadding;
  final Map<String, String Function(Object)>? validationMessages;
  final Color? fillColor;
  final bool autofocus;
  final bool readOnly, forceColors;
  final bool isMultiline;
  final bool disabledBorder;
  final TextAlign? textAlign;
  final InputBorder? focusedBorder, enabledBorder, errorBorder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label.toString(), style: labelStyle ?? TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: AppColors.black)).bottomMargin(6.h),
        ReactiveTextField(
          formControlName: formControlName,
          validationMessages: validationMessages,
          obscureText: obscureText,
          autocorrect: false,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: isMultiline ? TextInputType.multiline : keyboardType,
          textInputAction: textInputAction ?? TextInputAction.done,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          autofocus: autofocus,
          style: style ?? TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp, color: AppColors.black),
          readOnly: readOnly,
          onTap: onTap,
          maxLines: isMultiline ? maxLines : 1,
          minLines: minLines ?? 1,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: isMultiline ? TextAlignVertical.top : null,
          cursorColor: AppColors.black50,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? AppColors.white20,
            hintText: hint,
            hintStyle: hintStyle ?? TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.black50),
            contentPadding: contentPadding,
            border: enabledBorder ?? OutlineInputBorder(borderRadius: 10.r.circular, borderSide: BorderSide(width: 1.w, color: AppColors.white)),
            enabledBorder: enabledBorder ?? OutlineInputBorder(borderRadius: 10.r.circular, borderSide: BorderSide(width: 1.w, color: AppColors.white)),
            focusedBorder: focusedBorder ?? OutlineInputBorder(borderRadius: 10.r.circular, borderSide: BorderSide(width: 1.w, color: AppColors.white)),
            errorBorder: errorBorder ?? OutlineInputBorder(borderRadius: 10.r.circular, borderSide: BorderSide(width: 1.w, color: AppColors.red)),
            focusedErrorBorder: errorBorder ?? OutlineInputBorder(borderRadius: 10.r.circular, borderSide: BorderSide(width: 1.w, color: AppColors.red)),
            prefixIcon: prefixWidget != null
                ? GestureDetector(behavior: HitTestBehavior.deferToChild, onTap: prefixTap, child: Padding(padding: prefixPadding ?? 20.r.horizontalPadding, child: prefixWidget))
                : null,
            prefixIconConstraints: BoxConstraints(maxHeight: height ?? 50.h),
            suffixIcon: suffixWidget != null
                ? GestureDetector(behavior: HitTestBehavior.deferToChild, onTap: suffixTap, child: Padding(padding: 18.sp.horizontalPadding, child: suffixWidget))
                : null,
            suffixIconConstraints: BoxConstraints(maxHeight: height ?? 50.h),
          ),
        ),
      ],
    );
  }
}
