import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/challenges/controller/challenges_controller.dart';
import 'package:shimmer/shimmer.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: GetBuilder<ChallengesController>(builder: (logic) {
        switch(logic.rxRequestStatus.value){

          case RequestStatus.LOADING:
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.2),
              highlightColor: Colors.white.withOpacity(0.2),
              child: ListView.builder(

                  itemCount: 4,
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 19.h),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      padding: EdgeInsetsDirectional.only(
                          top: 24.h, bottom: 20.h, start: 18.w, end: 18.w),

                      child: Column(
                        children: [
                          Text('23 Jul 2023', style: getBoldItalicStyle(
                              color: ColorManager.blackText, fontSize: 16.sp),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 54 / 2,
                                  ),
                                  SizedBox(height: 15.h,),
                                  Text('Kalday Team',
                                    style: getBoldStyle(color: ColorManager.blackText,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconSpark,
                                        color: Color(0xffF99F1B),),
                                      SizedBox(width: AppSize.s8.w,),
                                      Text('2,345 xp', style: getRegularStyle(
                                          color: ColorManager.blackText),),

                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('18:00', style: getBoldStyle(
                                      color: ColorManager.blackText, fontSize: 16.sp),
                                  ),

                                  Text('2 days', style: getMediumStyle(
                                      color: ColorManager.blackText, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 54 / 2,
                                  ),
                                  SizedBox(height: 15.h,),

                                  Text('Lansing Team',
                                    style: getBoldStyle(color: ColorManager.blackText,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconSpark,
                                        color: Color(0xffF99F1B),),
                                      SizedBox(width: AppSize.s8.w,),
                                      Text('2,345 xp', style: getRegularStyle(
                                          color: ColorManager.blackText),),

                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                'City Stad, city, street 1234', style: getMediumStyle(
                                  color: ColorManager.goodMorning, fontSize: 12.sp),)
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          case RequestStatus.SUCESS:
          return ListView.builder(

              itemCount: logic.rxUserChallengesModel.value.userchallenges?.length??0,
              padding: EdgeInsets.only(left: 26.w,right: 26.w,bottom: 120.h),
              itemBuilder: (context, index) {
                return logic.getWidgetChallanges(logic.rxUserChallengesModel.value.userchallenges?[index] );
              });
          case RequestStatus.ERROR:
            return Center(
              child: Text('NO Challenges'),
            );
        }

      }),
    );
  }
}
