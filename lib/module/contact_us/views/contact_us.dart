import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_online/core/widgets/custom_text_field_widget.dart';
import 'package:global_online/module/contact_us/controller/contact_us_controller.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/resource.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_textField_with_label.dart';

class ContactUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: getBoldStyle(color: ColorManager.goodMorning, fontSize: 16.sp),
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r))),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.goodMorning,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.iconNotification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Container(
            // height: 200,
            color: ColorManager.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  ImageAssets.contactUs,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ContactUsController>(builder: (logic) {
              return Column(
                children: [
                  SizedBox(height: 45.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: CustomTextFieldWithLabel(
                      label: 'Message title',
                      hint: 'Enter Title',
                      color: ColorManager.white,
                      controller:logic. title,
                      // colorFilled: ColorManager.lightGrey.withOpacity(0.2),
                      // prefix: Padding(
                      //   padding: const EdgeInsets.all(12.0),
                      //   child: SvgPicture.asset(
                      //     ImageAssets.iconSearch,
                      //     width: 5.w,
                      //     height: 5.h,
                      //   ),
                      // ),
                      // hintStyle: getRegularStyle(
                      //     color: ColorManager.darkGrey, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: CustomTextFieldWithLabel(
                      label: 'Message',
                      hint: 'Enter Message',
                      color: ColorManager.white,
                      controller:logic. message,
                      lines: 5,
                      // colorFilled: ColorManager.lightGrey.withOpacity(0.2),
                      // prefix: Padding(
                      //   padding: const EdgeInsets.all(12.0),
                      //   child: SvgPicture.asset(
                      //     ImageAssets.iconSearch,
                      //     width: 5.w,
                      //     height: 5.h,
                      //   ),
                      // ),
                      // hintStyle: getRegularStyle(
                      //     color: ColorManager.darkGrey, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 51.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomElevatedButton(
                      title: 'SEND',
                      onPressed: () {
                        logic.sendMessage();
                      },
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
