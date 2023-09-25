import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/login_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    return  Scaffold(
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 145,),
                      Text(AppStrings.verifyAccount.toUpperCase(),
                        style: getBlackItalicStyle(
                            color: ColorManager.blackText,
                            fontSize: FontSize.s30.sp
                        ),
                      ),
                      SizedBox(height: 14.h,),
                      Text('Please enter the 6 digit code sent to your Phone',
                        style: getMediumStyle(color: ColorManager.greyText,
                            fontSize: FontSize.s16.sp
                        ),),
                      SizedBox(height: 60.h,),


                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          length: 6,
                          controller: logic.otpController,
                          obscureText: false,
                          backgroundColor: Colors.transparent,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          animationType: AnimationType.fade,
                          autoDisposeControllers: false,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 45.sp,
                            fieldWidth: 45.sp,
                            borderRadius: BorderRadius.circular(10),
                            borderWidth: 0,
                            fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                            errorBorderColor:Colors.white,
                            activeColor: Colors.white,
                            activeFillColor:Colors.white,

                            selectedColor: Colors.white,
                            selectedFillColor:Colors.white,
                            inactiveColor:Colors.white,
                            inactiveFillColor: Colors.white,
                          ),

                          textStyle: const TextStyle(color: Colors.black),
                          animationDuration: const Duration(milliseconds: 300),

                          keyboardType: TextInputType.number,
                          onCompleted: (v) {},
                          onSubmitted: (code){
                             otp = code;
                             logic.verifyOTP(otp);
                          },
                          onChanged: (value) {
                            /*logic.otpController.text =
                                        replaceArabicNumber(value);
                                    logic.otpController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                            logic.otpController.text.length));
                                    */
                            logic.sendCode = logic.otpController.text;
                            logic.errorText = "";
                            logic.update();
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                          appContext: context,
                        ),
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: AppStrings.didntrecive,
                                style: getRegularStyle(
                                    color: ColorManager.black.withOpacity(0.7),
                                    fontSize: FontSize.s14.sp),
                                children: [
                                  TextSpan(
                                    text: AppStrings.resendCode.toUpperCase(),
                                    recognizer: logic.signUpRecognizer,
                                    style: getSemiBoldStyle(
                                        color: Color(0xff36256E),
                                        fontSize: FontSize.s14.sp),
                                  )
                                ]),
                          ])),
                      SizedBox(height: AppSize.s14.h,),
                      Text('By continuing you’re indicating that you accept our Terms of Use and our Privacy Policy',
                      
                      style: getMediumStyle(color: Color(0xff9EA4B1)),
                      ),
                      SizedBox(height: 53.h,),
                      CustomElevatedButton(title: 'Verify'.toUpperCase() ,
                        titleFontStyle: getExtraBoldItalicStyle(
                            color: ColorManager.white, fontSize: FontSize.s16
                            .sp),
                        onPressed: (){
                          logic.verifyOTP(logic.otpController.text);

                        },

                      )
                    ],
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
