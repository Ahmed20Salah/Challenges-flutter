import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/chat/controller/chat_controller.dart';

import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_textField_with_label.dart';

class NewTeamDetailsBottomSheet extends StatelessWidget {
  const NewTeamDetailsBottomSheet({
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
            padding:
                EdgeInsetsDirectional.only(start: 23.w, end: 23.w, top: 10.h),
            decoration: BoxDecoration(
                color: const Color(0xffF2F3F5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    width: 54,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.close(0);
                          },
                          child: Text(
                            'Cancel',
                            style: getBoldStyle(
                                color: const Color(0xff44327C),
                                fontSize: 16.sp),
                          )),
                      const Spacer(),
                      Text(
                        'New Team',
                        style: getBoldStyle(
                            color: ColorManager.blackText, fontSize: 16.sp),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      logic.pickImageTeamAvatar();
                    },
                    child: logic.havePickImage == true
                        ? Container(
                            height: 82.h,
                            width: 82.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(
                                      File(logic.filePickImage!.path),
                                    ),
                                    fit: BoxFit.fill)),
                            child: DottedBorder(
                              color: const Color(0xFFD1D7E4),
                              strokeWidth: 1,
                              borderType: BorderType.Circle,
                              // padding: EdgeInsets.all(22.w),
                              child: const SizedBox(),
                            ))
                        : Container(
                            height: 82.h,
                            width: 82.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: DottedBorder(
                              color: const Color(0xFFD1D7E4),
                              strokeWidth: 1,
                              borderType: BorderType.Circle,
                              // padding: EdgeInsets.all(22.w),
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                color: Color(0xFFD1D7E4),
                              )),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    'Team Avatar',
                    style:
                        getRegularStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  CustomTextFieldWithLabel(
                      controller: logic.teamNameController,
                      label: 'Team Name',
                      hint: 'Enter Team name'),
                  SizedBox(
                    height: 39.h,
                  ),
                  CustomElevatedButton(
                    title: 'Create'.toUpperCase(),
                    titleFontStyle: getExtraBoldItalicStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                    onPressed: () {
                      logic.createTeam();
                    },
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
