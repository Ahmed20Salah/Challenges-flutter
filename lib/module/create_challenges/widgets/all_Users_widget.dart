import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/create_challenges/controller/create_challenge_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/apis/config_api.dart';
import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../core/widgets/custom_text_field_widget.dart';
import '../data/model/all_team_model.dart';
import '../data/model/all_users_model.dart';

class AllUsersWidget extends StatelessWidget {
  const AllUsersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: (Get.height - 358) / Get.height,
        maxChildSize: 0.85,
        builder: (context, scrollController) {
          return GetBuilder<CreateChallengeController>(builder: (logic) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))
              ),
              padding: EdgeInsetsDirectional.only(
                  start: 23.w, end: 32.w, top: 10.h),
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
                            borderRadius: BorderRadius
                                .circular(4)),
                      ),
                    ),
                    SizedBox(height: 28.h,),
                    CustomTextFieldWidget(
                      hint: 'search here',
                      colorFilled: Color(0xffD1D7E4),
                      prefix: Icon(Icons.search,
                        color: Color(0xFF464455),),
                      hintStyle: getRegularStyle(
                          color: Color(0xFF464455),
                          fontSize: 14.sp),),
                    SizedBox(height: 20.h,),
                   switch(logic.rxRequestStatusAllTeam.value){

                     // TODO: Handle this case.
                     RequestStatus.LOADING => Shimmer.fromColors(
                         baseColor: Colors.grey.withOpacity(0.2),
                         highlightColor: Colors.white.withOpacity(0.2),
                         child:ListView.separated(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                           return ListTile(

                               leading: CircleAvatar(
                                 radius: 20,
                               ),
                               title: Text('Inter Rafah ⚽️',
                                 style: getBoldItalicStyle(
                                     color: ColorManager
                                         .blackText,
                                     fontSize: FontSize.s16
                                         .sp),
                               ),
                               subtitle: Row(
                                 children: [
                                   SvgPicture.asset(
                                     ImageAssets.iconSpark,
                                     color: Color(
                                         0xffF99F1B),),
                                   SizedBox(
                                     width: AppSize.s8.w,),
                                   Text('2,345 xp',
                                     style: getRegularStyle(
                                         color: ColorManager
                                             .blackText),),

                                 ],
                               ),
                               trailing: Radio<bool>(
                                 value: false,
                                 groupValue: true,
                                 onChanged: (bool? value) {},)
                           );
                         },
                         separatorBuilder: (context, index) {
                           return Divider();
                         },
                         itemCount: 6)),
                     // TODO: Handle this case.
                     RequestStatus.SUCESS => ListView.separated(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemCount: logic.rxAllUsers?.length??0,
                         itemBuilder: (context, index) {
                           return ListTile(

                               leading: CircleAvatar(
                                 radius: 20,
                                 foregroundImage: CachedNetworkImageProvider(logic.rxAllUsers?[index].avatar != null  ?API.imageUrl(logic.rxAllUsers?[index].avatar??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                               ),
                               title: Text(logic.rxAllUsers?[index].name ?? '',
                                 style: getBoldItalicStyle(
                                     color: ColorManager
                                         .blackText,
                                     fontSize: FontSize.s16
                                         .sp),
                               ),
                               subtitle: Row(
                                 children: [
                                   SvgPicture.asset(
                                     ImageAssets.iconSpark,
                                     color: Color(
                                         0xffF99F1B),),
                                   SizedBox(
                                     width: AppSize.s8.w,),
                                   Text('2,345 xp',
                                     style: getRegularStyle(
                                         color: ColorManager
                                             .blackText),),

                                 ],
                               ),
                               trailing: Radio<AllUsers>(
                                 value: logic.rxAllUsers?[index]??AllUsers(),
                                 groupValue: logic.refereeUser,
                                 onChanged: (AllUsers? value) {
                                   logic.onChangeRadioRefereeUser(value);
                                   // print(logic.rxAllTeamModel.value.data?[index].isSelected);
                                   // logic.rxAllTeamModel.value.data?[index].isSelected ! ;
                                   // logic.update();
                                 },)
                           );
                         },
                         separatorBuilder: (context, index) {
                           return Divider();
                         },
                    ),

                     RequestStatus.ERROR => Center(
                       child: Text('NO TEAM '),
                     ),
                   },

                    if(logic.rxAllTeamModel?.isNotEmpty == true)
                    CustomElevatedButton(
                        title: 'Select'.toUpperCase(),
                    onPressed: (){
                          if(logic.refereeUser!=null){
                            logic.refereeUserController.text = logic.refereeUser?.name ?? logic.refereeUser?.phone??'';
                            Get.close(0);
                          }
                    },
                    ),
                    SizedBox(height: 50,)


                  ],
                ),
              ),
            );
          });
        }
    );
  }
}