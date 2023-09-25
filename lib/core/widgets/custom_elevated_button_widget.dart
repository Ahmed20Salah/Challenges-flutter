import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
class CustomElevatedButton extends StatelessWidget {
  final String title;
  final TextStyle? titleFontStyle;
  final void Function()? onPressed;
  const CustomElevatedButton({
    super.key, required this.title, this.onPressed, this.titleFontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.zero,
        height: 64.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration:ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.00, 0.06),
            end: Alignment(-1, -0.06),
            colors: [Color(0xFF552D90), Color(0xFF6D55A4), Color(0xFF4A3782), Color(0xFF36256E)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50),
            borderRadius: BorderRadius.circular(AppSize.s13.r),
          ),
        ),
        child: Text(
            title,
            style: titleFontStyle ?? getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s16.sp),

        ),
      ),
    );
  }
}
