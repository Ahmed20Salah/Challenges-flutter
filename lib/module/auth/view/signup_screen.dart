import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/module/auth/controller/login_controller.dart';
import 'package:global_online/module/auth/controller/signup_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/helpers/validator.dart';
import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_textField_with_label.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
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
                child: GetBuilder<SignUpController>(
                  builder: (logic) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 145,
                          ),
                          Text(
                            AppStrings.createAccount,
                            style: getBlackItalicStyle(
                                color: ColorManager.blackText,
                                fontSize: FontSize.s30.sp),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(
                            AppStrings.loginDesc,
                            style: getMediumStyle(
                                color: ColorManager.greyText,
                                fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomTextFieldWithLabel(
                            label: 'User Name',
                            hint: 'User Name',
                            controller: logic.nameRegisterController,
                            validator: (p0) => Validator.validateName(p0!),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomTextFieldWithLabel(
                            label: 'Email',
                            hint: 'Email',
                            controller: logic.emailRegisterController,
                            validator: (p0) =>
                                Validator.validateEmail(p0 ?? ''),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppStrings.phoneNumber,
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10.r),
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
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10.r),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10.r),
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
                              logic.numberRegisterController.text =
                                  phone.completeNumber;
                            },
                          ),
                          CustomTextFieldWithLabel(
                            label: AppStrings.password,
                            hint: AppStrings.passwordHint,
                            obscureText: logic.showPass,
                            controller: logic.passwordRegisterController,
                            validator: (p0) =>
                                Validator.validatePassword(p0 ?? ''),
                            suffix: IconButton(
                              onPressed: () => logic.showPassword(),
                              icon: Icon(
                                logic.showPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                size: AppSize.s20.h,
                                color: ColorManager.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          CustomTextFieldWithLabel(
                            label: AppStrings.confirmPassword,
                            hint: AppStrings.repeatPassword,
                            obscureText: logic.showConfPass,
                            controller: logic.passwordConfirmRegisterController,
                            validator: (p0) =>
                                Validator.validateConfirmPassword(p0 ?? '',
                                    logic.passwordRegisterController.text),
                            suffix: IconButton(
                              onPressed: () => logic.showConfPassword(),
                              icon: Icon(
                                logic.showConfPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                size: AppSize.s20.h,
                                color: ColorManager.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.doHaveAcc,
                                    style: getRegularStyle(
                                        color:
                                            ColorManager.black.withOpacity(0.7),
                                        fontSize: FontSize.s14.sp),
                                    children: [
                                      TextSpan(
                                        text: AppStrings.signIn.toUpperCase(),
                                        recognizer: logic.signUpRecognizer,
                                        style: getExtraBoldItalicStyle(
                                            color: ColorManager.authText,
                                            fontSize: FontSize.s14.sp),
                                      )
                                    ]),
                              ])),
                          SizedBox(
                            height: 22.h,
                          ),
                          CustomElevatedButton(
                            title: 'Sign up'.toUpperCase(),
                            titleFontStyle: getExtraBoldItalicStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s16.sp),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                logic.verifyPhone(logic.numberRegisterController.text);
                              }
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
