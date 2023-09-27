import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/challenge_details/controller/challenge_details_controller.dart';
import 'package:intl/intl.dart';

import '../../../core/config/apis/config_api.dart';


class ChallengesDetailsScreen extends StatelessWidget {
  const ChallengesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: GetBuilder<ChallengeDetailsController>(builder: (logic) {

        switch(logic.rxRequestStatus.value){

          case RequestStatus.LOADING:
          return Center(
            child: CircularProgressIndicator(),
          );
          case RequestStatus.SUCESS:
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                primary: true,
                forceElevated: true,
                expandedHeight: 312.h,
                title: Text(logic.rxChallengeDetailsModel.value.data?.title??'', style: getBoldStyle(
                    color: ColorManager.goodMorning, fontSize: 16.sp),),
                flexibleSpace: FlexibleSpaceBar(

                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 19.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        padding: EdgeInsetsDirectional.only(
                            start: 32.w, end: 32.w),

                        child: Column(
                          children: [
                            Text(DateFormat('dd MMM yyyy').format(
                                DateTime.parse(logic.rxChallengeDetailsModel.value.data?.startTime ?? '')),
                              style: getBoldItalicStyle(
                                  color: ColorManager.blackText, fontSize: 16.sp),
                            ),
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 54 / 2,
                                      foregroundImage: CachedNetworkImageProvider(
                                          logic.rxChallengeDetailsModel.value.data?.team?.image != null
                                              ? API.imageUrl(
                                              logic.rxChallengeDetailsModel.value.data?.team?.image ?? '')
                                              : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                                    ),
                                    SizedBox(height: 15.h,),
                                    Text(logic.rxChallengeDetailsModel.value.data?.team?.name ?? '',
                                      style: getBoldStyle(
                                          color: ColorManager.blackText,
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
                                    Text(DateFormat('HH:mm').format(
                                        DateTime.parse(
                                            logic.rxChallengeDetailsModel.value.data?.startTime ?? '')),
                                      style: getBoldStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                    ),

                                    Text('${(DateTime
                                        .parse(logic.rxChallengeDetailsModel.value.data?.startTime ?? '')
                                        .difference(DateTime.now())
                                        .inHours / 24).toStringAsFixed(0)} days ',
                                      style: getMediumStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 54 / 2,
                                      foregroundImage: CachedNetworkImageProvider(
                                          logic.rxChallengeDetailsModel.value.data?.opponent?.image != null
                                              ? API.imageUrl(
                                              logic.rxChallengeDetailsModel.value.data?.opponent?.image ??
                                                  '')
                                              : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                                    ),
                                    SizedBox(height: 15.h,),

                                    Text(logic.rxChallengeDetailsModel.value.data?.opponent?.name ?? '',
                                      style: getBoldStyle(
                                          color: ColorManager.blackText,
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

                          ],
                        ),
                      )

                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r)
                    )
                ),

              ),
              SliverFillRemaining(
                child: Container(),
              )
            ],

          );
          case RequestStatus.ERROR:
            return Center(
              child: CircularProgressIndicator(),
            );
        }

      }),
    );
  }
}
