import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../core/helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../../../core/helpers/show_bottom_sheet/show_bottom_sheet_input.dart';
import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_text_field_widget.dart';
import '../controller/chat_controller.dart';
import '../data/models/all_contact_model.dart';
import 'new_contact_bottom_sheet_widget.dart';
import 'new_team_details_bottom_sheet_widget.dart';

class NewTeamBottomSheetWidget extends GetView<ChatController> {
  const NewTeamBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: (Get.height - 358) / Get.height,
        maxChildSize: 0.85,
        builder: (context, scrollController) {
          return Container(
            padding:
                EdgeInsetsDirectional.only(start: 23.w, end: 23.w, top: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        'Add Participants',
                        style: getBoldStyle(
                            color: ColorManager.blackText, fontSize: 16.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            // Get.close(0);
                            Get.find<IShowBottomSheetHelper>()
                                .showBottomSheet(ShowBottomSheetInput(
                              const NewTeamDetailsBottomSheet(),
                              isScrollControlled: true,
                            ));
                          },
                          child: Text(
                            'Next',
                            style: getBoldStyle(
                                color: const Color(0xff44327C),
                                fontSize: 16.sp),
                          )),
                    ],
                  ),
                  GetBuilder<ChatController>(builder: (logic) {
                    switch (logic.rxRequestStatus.value) {
                      case RequestStatus.LOADING:
                        return const Center(child: CircularProgressIndicator());
                      case RequestStatus.SUCESS:
                        return Column(
                          children: [
                            Text(
                              '1/${logic.rxEventDataModel.value.data!.length}',
                              style: getRegularStyle(
                                  color: const Color(0xff44327C),
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            CustomTextFieldWidget(
                              hint: 'search here',
                              colorFilled:
                                  const Color(0xffD1D7E4).withOpacity(0.7),
                              prefix: const Icon(
                                Icons.search,
                                color: Color(0xFF464455),
                              ),
                              hintStyle: getRegularStyle(
                                  color: const Color(0xFF464455),
                                  fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GroupedListView<Data, String>(
                              shrinkWrap: true,
                              elements: logic.rxEventDataModel.value.data ?? [],
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
                                    : Obx(() {
                                        return Checkbox(
                                          checkColor: Colors.white,
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xffD9D9D9)),
                                          value: element.isCheck.value,
                                          activeColor: const Color(0xffFB84A7),
                                          shape: const CircleBorder(),
                                          onChanged: (bool? value) {
                                            logic.isCheck(element);
                                          },
                                        );
                                      }),
                              ),
                              // itemComparator: (item1, item2) =>
                              //     controller.seprator(item2, item2), // optional
                              useStickyGroupSeparators: false, // optional
                              floatingHeader: false,
                              order: GroupedListOrder.ASC, // optional
                            ),
                          ],
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
