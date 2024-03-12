import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:global_online/module/auth/controller/login_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:ui' as ui;
import '../../../core/widgets/custom_textField_with_label.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: Stack(
          children: [
            PositionedDirectional(
                end: 0,
                top: 0,
                child: SvgPicture.asset(ImageAssets.intersectIcon)),
            Container(
              margin: EdgeInsetsDirectional.only(
                start: AppSize.s40.w,
                end: AppSize.s40.w,
              ),
              child: GetBuilder<LoginController>(

                builder: (logic) {
                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 145,),
                          Text(AppStrings.login,
                            style: getBlackItalicStyle(
                                color: ColorManager.blackText,
                                fontSize: FontSize.s30.sp
                            ),
                          ),
                          SizedBox(height: 14.h,),
                          Text(AppStrings.loginDesc,
                            style: getMediumStyle(color: ColorManager.greyText,
                                fontSize: FontSize.s16.sp
                            ),),
                          SizedBox(height: 53.h,),

                          Text(
                            AppStrings.phoneNumber,
                            style: getRegularStyle(
                                color: ColorManager.black, fontSize: FontSize.s14
                                .sp),
                          ),
                          SizedBox(height: 8.h,),
                          IntlPhoneField(
                            controller: logic.numberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.s10.r),
                                  borderSide: BorderSide.none),
                              filled: true,
                              contentPadding: EdgeInsets.only(
                                  left: AppSize.s16.w,
                                  top: AppSize.s18.h,
                                  right: AppSize.s12.w,
                                  bottom: AppSize.s18.h),
                              fillColor: ColorManager.white,
                              hintStyle: getRegularStyle(
                                  color: ColorManager.hintColor,
                                  fontSize: FontSize.s16.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.s10.r),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.s10.r),
                                  borderSide: BorderSide.none),
                              // suffix: suffix,
                              // suffixIcon: suffix,
                              hintText: AppStrings.phoneNumber,
                            ),
                            initialCountryCode: 'PS',
                            keyboardType: TextInputType.number,
                            onSubmitted: (p0) {
                              print(p0);
                            },
                            onChanged: (phone) {

                                print(phone.completeNumber);
                                logic.loginNumberController.text = phone.completeNumber;
                              
                            },
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.dontHaveAcc,
                                    style: getRegularStyle(
                                        color: ColorManager.black.withOpacity(0.7),
                                        fontSize: FontSize.s14.sp),
                                    children: [
                                      TextSpan(
                                        text: AppStrings.signUp.toUpperCase(),
                                        recognizer:logic.signUpRecognizer,
                                        style: getExtraBoldItalicStyle(
                                            color: ColorManager.authText,
                                            fontSize: FontSize.s14.sp),
                                      )
                                    ]),
                              ])),
                          SizedBox(height: 53.h,),
                          CustomElevatedButton(title: 'Log in',
                            titleFontStyle: getExtraBoldItalicStyle(
                                color: ColorManager.white, fontSize: FontSize.s16
                                .sp),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              logic.login("9URhz8KAhKOXQF56YfPvG719MV63");
                              // logic.verifyPhone(logic.loginNumberController.text.trim());
                            }
                          }),


                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.058495, size.height * -2.148760);
    path_0.cubicTo(
        size.width * 0.7056604, size.height * -1.100041, size.width * 0.3528307,
        size.height * -0.05111884, 0, size.height * 0.9975950);
    path_0.lineTo(size.width * 1.744762, size.height * -1.141463);
    path_0.cubicTo(
        size.width * 1.872950, size.height * -1.298521, size.width * 2.001386,
        size.height * -1.460620, size.width * 2.130327,
        size.height * -1.627769);
    path_0.cubicTo(
        size.width * 2.266069, size.height * -1.803950, size.width * 2.395772,
        size.height * -1.977826, size.width * 2.519673,
        size.height * -2.148760);
    path_0.lineTo(size.width * 1.058495, size.height * -2.148760);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 1.739069, size.height * -3.121868);
    path_1.lineTo(size.width * -1.742693, size.height * -1.173777);
    path_1.lineTo(size.width * 0.7813287, size.height * 1.970289);
    path_1.lineTo(size.width * 4.263099, size.height * 0.02220777);
    path_1.lineTo(size.width * 1.739069, size.height * -3.121868);
    path_1.close();

    Paint paint_1_fill = Paint()
      ..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2014931, size.height * -185.5008),
        Offset(size.width * 1.616772, size.height * -9.259421), [
      Color(0xffF99F1B).withOpacity(1),
      Color(0xffFFD056).withOpacity(1),
      Color(0xffF59C31).withOpacity(1),
      Color(0xffF28621).withOpacity(1)
    ], [0, 0.31, 0.76, 1]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}