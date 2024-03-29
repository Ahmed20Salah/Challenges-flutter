import 'package:flutter/material.dart';
import 'package:global_online/core/resources/resource.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.keyboardType,
    this.validator,
    this.controller,
    this.onTap,
    this.obscureText,
    this.readOnly,
    this.suffix,
    required this.hint,
    this.colorFilled,
    this.prefix,
    this.hintStyle,
    this.onChange,
    this.lines = 1,
  });

  final TextInputType? keyboardType;
  final String? Function(String? p1)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final String hint;
  final Color? colorFilled;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChange,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      maxLines: lines,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s10.r),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.only(
              left: AppSize.s16.w,
              top: AppSize.s18.h,
              right: AppSize.s12.w,
              bottom: AppSize.s18.h),
          fillColor: colorFilled ?? ColorManager.white,
          hintStyle: hintStyle ??
              getRegularStyle(
                  color: ColorManager.hintColor, fontSize: FontSize.s16.sp),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s10.r),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s10.r),
              borderSide: BorderSide.none),
          // suffix: suffix,
          suffixIcon: suffix,
          prefixIcon: prefix,
          hintText: hint),
    );
  }
}
