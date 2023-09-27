

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/module/challenges/data/data_source/challenges_data_source.dart';
import 'package:intl/intl.dart';

import '../../../core/config/apis/config_api.dart';
import '../../../core/netwrok/failure.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/model/user_challenges_model.dart';

class ChallengesController extends GetxController{
  final IChallengesDataSource _challengesDataSource;

  ChallengesController(this._challengesDataSource);



  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<UserChallengesModel> rxUserChallengesModel = UserChallengesModel().obs;

  void setRxUserChallengesModel(UserChallengesModel value) => rxUserChallengesModel.value = value;


  @override
  void onInit() {
    super.onInit();
    getChallenges();

  }

  Future<void> getChallenges() async {
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, UserChallengesModel> allContact =
        await _challengesDataSource.getChallenges();
    allContact.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxUserChallengesModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });
  }



  Widget getWidgetChallanges(UserChallenges? userChallenges ){
    if(userChallenges == null) return SizedBox();
    switch (userChallenges.category?.name){
      case 'Running':
        return Container(

          margin: EdgeInsets.only(top: 19.h),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.94, -0.33),
              end: Alignment(0.94, 0.33),
              colors: [Color(0xFFF99F1B), Color(0xFFFFD056), Color(
                  0xFFF59C31), Color(0xFFF28621)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          padding: EdgeInsets.symmetric(
              horizontal: 25.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 16,),
                  SizedBox(width: 17.w,),
                  Text('${userChallenges.title}',
                    style: getBoldItalicStyle(color: ColorManager.white,
                        fontSize: FontSize.s16.sp),)
                ],
              ),
              SizedBox(height: AppSize.s8.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${userChallenges.stepsNum}', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 64.sp),),
                  SizedBox(width: 21.w,),
                  Text('step', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 16.sp),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${DateFormat('h:mm a').format(DateTime.parse(userChallenges.startTime?? ''))}', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 16.sp),),
                  Text('-', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 16.sp),),
                  Text('${DateFormat('h:mm a').format(DateTime.parse(userChallenges.endTime?? ''))}', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 16.sp),),
                  Text('${DateFormat('dd MMM yyyy').format(DateTime.parse(userChallenges.startTime?? ''))}', style: getBlackItalicStyle(
                      color: ColorManager.white, fontSize: 16.sp),),
                ],
              )
            ],
          ),
        );
      case 'Football':
        return GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.challengeDetails,arguments: userChallenges.id.toString());
          },
          child: Container(
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
                Text(DateFormat('dd MMM yyyy').format(DateTime.parse(userChallenges.startTime?? '')), style: getBoldItalicStyle(
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
                           foregroundImage: CachedNetworkImageProvider(userChallenges.team?.image != null  ?API.imageUrl(userChallenges.team?.image ??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                         ),
                        SizedBox(height: 15.h,),
                        Text(userChallenges.team?.name??'',
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
                        Text(DateFormat('HH:mm').format(DateTime.parse(userChallenges.startTime?? '')), style: getBoldStyle(
                            color: ColorManager.blackText, fontSize: 16.sp),
                        ),

                        Text('${(DateTime.parse(userChallenges.startTime?? '').difference(DateTime.now()).inHours / 24).toStringAsFixed(0)} days ', style: getMediumStyle(
                            color: ColorManager.blackText, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 54 / 2,
                          foregroundImage: CachedNetworkImageProvider(userChallenges.opponent?.image != null  ?API.imageUrl(userChallenges.opponent?.image ??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                        ),
                        SizedBox(height: 15.h,),

                        Text(userChallenges.opponent?.name??'',
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
          ),
        );
      default:
        return SizedBox();
    }

  }
}