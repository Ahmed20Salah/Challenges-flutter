import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'custom_text_field_widget.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel(
      {super.key,
      required this.label,
      required this.hint,
      this.suffix,
      this.labelStyle,
      this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.readOnly = false,
      this.validator, this.onTap});
  final String label;
  final String hint;
  final Widget? suffix;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s14.sp),
        ),
        SizedBox(
          height: AppSize.s8.h,
        ),
        CustomTextFieldWidget(
          onTap: onTap,
          readOnly: readOnly,
            keyboardType: keyboardType, validator: validator, controller: controller, obscureText: obscureText, suffix: suffix, hint: hint),
      ],
    );
  }
}

