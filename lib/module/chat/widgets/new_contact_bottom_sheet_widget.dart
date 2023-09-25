import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/chat/controller/chat_controller.dart';

import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_textField_with_label.dart';

class NewContactBottomSheet extends StatelessWidget {
  const NewContactBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: (Get.height - 358) / Get.height,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return GetBuilder<ChatController>(builder: (logic) {
          return Container(
            padding: EdgeInsetsDirectional.only(
                start: 23.w, end: 23.w, top: 10.h),
            decoration: BoxDecoration(
                color: Color(0xffF2F3F5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(

                children: [
                  Container(
                    width: 54,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        Get.close(0);
                      },
                          child: Text('Cancel', style: getBoldStyle(
                              color: Color(0xff44327C), fontSize: 16.sp),)),
                      Center(
                          widthFactor: 2,

                          child: Text('New Contact', style: getBoldStyle(
                              color: ColorManager.blackText,
                              fontSize: 16.sp),)),
                    ],
                  ),
                  SizedBox(height: 45.h,),
                  CustomTextFieldWithLabel(
                      controller:logic.firstNameController,
                      label: 'First Name', hint: 'Enter First name'),
                  SizedBox(height: 15.h,),
                  CustomTextFieldWithLabel(
                    controller: logic.lastNameController,
                      label: 'Last Name', hint: 'Enter Last name'),
                  SizedBox(height: 15.h,),
                  CustomTextFieldWithLabel(
                    controller: logic.phoneController,
                      label: 'Phone Number', hint: '+123   |  1212397123'),
                  SizedBox(height: 55.h,),
                  CustomElevatedButton(title: 'Create'.toUpperCase(),
                    titleFontStyle: getExtraBoldItalicStyle(
                        color: ColorManager.white, fontSize: 16.sp),

                  onPressed: (){
                    logic.newContact();
                  },
                  )

                ],
              ),
            ),
          );
        });
      },);
  }
}