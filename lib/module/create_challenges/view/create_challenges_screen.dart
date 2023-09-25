import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/helpers/custom_icon_icons.dart';
import 'package:global_online/core/helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import 'package:global_online/core/helpers/show_bottom_sheet/show_bottom_sheet_input.dart';
import 'package:global_online/core/helpers/show_dialog_helper/show_dialog_input.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:global_online/core/widgets/custom_textField_with_label.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/create_challenges/widgets/all_Users_widget.dart';

import '../../../core/config/apis/config_api.dart';
import '../../../core/helpers/show_dialog_helper/i_show_dialog_helper.dart';
import '../../../core/widgets/custom_text_field_widget.dart';
import '../../_main/model/all_categories_model.dart';
import '../controller/create_challenge_controller.dart';
import '../widgets/all_teams_widget.dart';
import 'map_create_challenge_screen.dart';

class CreateChallenges extends StatelessWidget {
  CreateChallenges({super.key});

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  AllCategories? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,

      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text('Create Challenge',
          style: getBoldStyle(
              color: ColorManager.goodMorning, fontSize: 16.sp),

        ),

        elevation: 0,
      ),
      body: GetBuilder<CreateChallengeController>(

          builder: (controller) {
        return SingleChildScrollView(
          child: Column(

            children: [
              if(controller.selectedValue
                  ?.name != 'Running')Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r)
                    ),
                    color: Colors.white
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opponent Team',
                      style: getRegularStyle(
                          color: Colors.black, fontSize: 14.sp),),
                    SizedBox(height: 16.h,),
                    GestureDetector(
                      onTap: () {
                        Get.find<IShowBottomSheetHelper>().showBottomSheet(
                            ShowBottomSheetInput(AllTeamsWidget(),

                              isScrollControlled: true,

                            ));
                      },
                      child:controller.selectedTeam == null ?DottedBorder(
                        color: Color(0xFFD1D7E4),
                        strokeWidth: 1,
                        borderType: BorderType.Circle,
                        padding: EdgeInsets.all(22.w),
                        child: Icon(Icons.add, color: Color(0xFFD1D7E4),),
                      ):Container(
                          height: 82.h,
                          width: 82.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(image:
                              CachedNetworkImageProvider(controller.selectedTeam?.image!= null  ?API.imageUrl(controller.selectedTeam?.image??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                                  fit: BoxFit.fill
                              )
                          ),
                          child :DottedBorder(
                            color: Color(0xFFD1D7E4),
                            strokeWidth: 1,
                            borderType: BorderType.Circle,
                            // padding: EdgeInsets.all(22.w),
                            child:SizedBox() ,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomTextFieldWithLabel(
                      controller: controller.titleController,
                        label: 'Challenge Title', hint: 'Challenge Title'),
                    SizedBox(height: 15.h,),


                    // CustomTextFieldWithLabel(
                    //   label: 'Challenge Type', hint: 'Challenge Type',
                    //   suffix: Icon(Icons.keyboard_arrow_down_sharp),
                    //
                    //
                    // ),
                    Text(
                      'Challenge Type',
                      style:
                      getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      height: AppSize.s8.h,
                    ),
                     DropdownButtonHideUnderline(
                            child: DropdownButton2<AllCategories?>(
                              isExpanded: true,
                              hint: Text(
                                'Challenge Type',
                                style: getRegularStyle(
                                    color: ColorManager.hintColor,
                                    fontSize: FontSize.s16.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: controller.rxAllCategoriesModel.value.data != null
                                  ?
                              controller.rxAllCategoriesModel.value.data!.map((
                                  AllCategories item) =>
                                  DropdownMenuItem<AllCategories>(
                                    value: item,
                                    child: Text(
                                      item.name ?? '',
                                      style: getRegularStyle(
                                          color: ColorManager.black,
                                          fontSize: FontSize.s16.sp),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                                  .toList()
                                  : [],
                              value: controller.selectedValue,
                              onChanged: (value) {
                                controller.selectedCategories(value);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50.h,

                                padding: const EdgeInsets.only(
                                    left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),

                                  color: Colors.white,
                                ),

                              ),
                              iconStyleData: const IconStyleData(
                                  icon: Icon(Icons.keyboard_arrow_down_sharp)
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility: MaterialStateProperty.all(
                                      true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),

                    SizedBox(height: 15.h,),
                    if(controller.selectedValue
                        ?.name != 'Running')
                      CustomTextFieldWithLabel(
                        readOnly: true,
                          onTap: (){
                            Get.find<IShowBottomSheetHelper>().showBottomSheet(
                                ShowBottomSheetInput(AllUsersWidget(),

                                  isScrollControlled: true,

                                ));
                          },
                          controller: controller.refereeUserController,
                          keyboardType: TextInputType.number,
                          label: 'Referee User', hint: 'Referee User'),
                    if(controller.selectedValue
                        ?.name == 'Running')
                      CustomTextFieldWithLabel(
                          controller: controller.distanceController,
                          keyboardType: TextInputType.number,
                          label: 'Distance', hint: 'Distance'),

                    if(controller.selectedValue
                        ?.name == 'Running')
                      SizedBox(height: 15.h,),

                    if(controller.selectedValue
                        ?.name == 'Running')
                      CustomTextFieldWithLabel(
                          controller: controller.stepsNumController,
                          keyboardType: TextInputType.number,
                          label: 'Steps Number', hint: 'Steps Number'),

                    SizedBox(height: 15.h,),
                    CustomTextFieldWithLabel(readOnly: true,
                      onTap: ()=>  controller.addShiftToList(context),
                      label: 'Date', hint: 'Select Date & Time',
                      controller: controller.dateController,
                      suffix: Container(
                        height: 24.h,
                        width: 24.w,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(ImageAssets.iconCalender),
                      ),


                    ),
                    SizedBox(height: 15.h,),
                    CustomTextFieldWithLabel(
                      readOnly: true,
                      onTap: (){
                        Get.to(()=>MapCreateScreen());
                      },
                      label: 'Location', hint: 'Add location',
                      suffix: Container(
                        height: 24.h,
                        width: 24.w,
                        alignment: Alignment.center,
                        child: Icon(
                          CustomIcon.map, color: ColorManager.goodMorning,),
                      ),


                    ),
                    SizedBox(height: 64.h,),
                    CustomElevatedButton(
                      title: 'Create'.toUpperCase(), onPressed: () {print(Storage().teamDocument);
                      controller.createChallenge(context);

                    },)
                  ],),
              )

            ],
          ),
        );
      }),
    );
  }
}


