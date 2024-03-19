import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:global_online/core/widgets/custom_textField_with_label.dart';
import 'package:global_online/module/chat/data/models/all_contact_model.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../core/helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../../../core/helpers/show_bottom_sheet/show_bottom_sheet_input.dart';
import '../../../core/resources/resource.dart';
import '../../../core/utils/constant.dart';
import '../../../core/widgets/custom_text_field_widget.dart';
import '../controller/chat_controller.dart';
import 'new_contact_bottom_sheet_widget.dart';
import 'new_team_bottom_sheet_widget.dart';

class NewChatWidget extends GetView<ChatController> {
  const NewChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: (Get.height - 200) / Get.height,
        maxChildSize: 0.85,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            padding:
                EdgeInsetsDirectional.only(start: 23.w, end: 23.w, top: 10.h),
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
                  Text(
                    'New Chat',
                    style: getBoldStyle(
                        color: ColorManager.blackText, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextFieldWidget(
                    hint: 'search here',
                    colorFilled: const Color(0xffD1D7E4).withOpacity(0.7),
                    prefix: const Icon(
                      Icons.search,
                      color: Color(0xFF464455),
                    ),
                    hintStyle: getRegularStyle(
                        color: const Color(0xFF464455), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.close(0);
                          Get.find<IShowBottomSheetHelper>()
                              .showBottomSheet(ShowBottomSheetInput(
                            const NewContactBottomSheet(),
                            isScrollControlled: true,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 34.w, vertical: 11.h),
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(-1.00, -0.07),
                              end: Alignment(1, 0.07),
                              colors: [Color(0xFFFFD056), Color(0xFFF59C31)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.iconAddUser),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'New Contact',
                                style: getSemiBoldStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.close(0);
                          Get.find<IShowBottomSheetHelper>()
                              .showBottomSheet(ShowBottomSheetInput(
                            const NewTeamBottomSheetWidget(),
                            isScrollControlled: true,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 34.w, vertical: 11.h),
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(-1.00, -0.07),
                              end: Alignment(1, 0.07),
                              colors: [Color(0xFFFFD056), Color(0xFFF59C31)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.iconAddTeam),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'New Team',
                                style: getSemiBoldStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  GetBuilder<ChatController>(builder: (logic) {
                    switch (logic.rxRequestStatus.value) {
                      case RequestStatus.LOADING:
                        return const Center(child: CircularProgressIndicator());
                      case RequestStatus.SUCESS:
                        return GroupedListView<Data, String>(
                          shrinkWrap: true,
                          elements: logic.rxEventDataModel.value.data!,
                          groupBy: (element) => element.status ?? '',
                          groupSeparatorBuilder: (String groupByValue) =>
                              logic.groupSeparatorBuilder(groupByValue),
                          itemBuilder: (context, Data element) => ListTile(
                            leading: const CircleAvatar(
                              radius: 20,
                              foregroundImage: AssetImage(
                                  'assets/images/profile_avatar.png'),
                            ),
                            title: Text(
                              '${element.userData?.name ?? element.phone}',
                              style: getBoldItalicStyle(
                                  color: ColorManager.blackText,
                                  fontSize: FontSize.s16.sp),
                            ),
                            trailing: element.userData == null
                                ? TextButton(
                                    onPressed: () {},
                                    child: const Text('Invite'))

                                // : Obx(() {
                                //     return Checkbox(
                                //       checkColor: Colors.white,
                                //       overlayColor: MaterialStateProperty.all(
                                //           const Color(0xffD9D9D9)),
                                //       value: element.isCheck.value,
                                //       activeColor: const Color(0xffFB84A7),
                                //       shape: const CircleBorder(),
                                //       onChanged: (bool? value) {
                                //         logic.isCheck(element);

                                //       },
                                //     );
                                //   }),

                                : null,
                            onTap: () {
                              if (element.userData != null) {
                                controller.createIndiviualRoomChat(
                                    element.userData!, context);
                              }
                            },
                          ),
                          // itemComparator: (item1, item2) =>
                          //     controller.seprator(item2, item2), // optional
                          useStickyGroupSeparators: false, // optional
                          floatingHeader: false,
                          order: GroupedListOrder.ASC, // optional
                        );
                      case RequestStatus.ERROR:
                        return const Center(child: CircularProgressIndicator());
                    }
                  }),
                ],
              ),
            ),
          );
        });
  }
}
