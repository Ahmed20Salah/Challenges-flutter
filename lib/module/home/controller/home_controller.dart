import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/netwrok/failure.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/challenges/data/data_source/challenges_data_source.dart';
import 'package:global_online/module/challenges/data/model/user_challenges_model.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/error_toast.dart';
import '../../../core/utils/services/storage.dart';
import '../data/data_source/home_data_source.dart';

class HomeController extends GetxController {
  final IHomeDataSource _homeDataSource;
  final IChallengesDataSource _challengesDataSource;
  HomeController(this._homeDataSource, this._challengesDataSource);

  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<UserChallengesModel> rxUserChallengesModel =
      UserChallengesModel().obs;

  void setRxUserChallengesModel(UserChallengesModel value) =>
      rxUserChallengesModel.value = value;

  @override
  void onInit() {
    super.onInit();
    Get.find<MainController>().getUser();
    getChallenges();
    // addContact(
    //     '+972599229320,+972599229820,+972599221120,+972598444111,+972597723826');
  }

  Future<void> addContact(String phones) async {
    final registerModel = await _homeDataSource.addContact(phones);
    registerModel.fold((l) => errorToast(l.message), (r) {
      successToast(r);
    });
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

  Widget getWidgetChallanges(UserChallenges? userchalleng) {
    switch (userchalleng?.category?.name) {
      case 'Running':
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.challengeDetails,
                arguments: userchalleng?.id.toString());
          },
          child: Container(
            margin: EdgeInsets.only(top: 19.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userchalleng?.title}',
                  style: getBoldItalicStyle(
                      color: ColorManager.blackText, fontSize: FontSize.s16.sp),
                ),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                Row(
                  children: [
                    Text(
                      '${userchalleng?.stepsNum}',
                      style: getBoldItalicStyle(
                          color: ColorManager.blackText,
                          fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      ' Steps',
                      style: getBoldItalicStyle(
                          color: ColorManager.blackText,
                          fontSize: FontSize.s16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                ListTile(
                  leading: Text(
                    '01',
                    style: getRegularStyle(
                        color: ColorManager.blackText,
                        fontSize: FontSize.s16.sp),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        foregroundImage: Storage().avatar != null
                            ? CachedNetworkImageProvider(
                                API.imageUrl(userchalleng!.image ?? ''))
                            : null,
                      ),
                      SizedBox(
                        width: AppSize.s12.w,
                      ),
                      Text(
                        '${Storage().fistName}',
                        style: getSemiBoldItalicStyle(
                            color: ColorManager.blackText),
                      )
                    ],
                  ),
                  trailing: Text(
                    '3:15 hours',
                    style: getRegularStyle(color: const Color(0xffF99F1B)),
                  ),
                ),
                const Divider(
                  color: Color(0xffD1D7E4),
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('MMM dd yyyy')
                          .format(DateTime.parse(userchalleng!.startTime!)),
                      style: getRegularStyle(
                        color: ColorManager.greyText,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat('HH:mm aa')
                          .format(DateTime.parse(userchalleng!.startTime!)),
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorManager.greyText,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'To',
                      style: getRegularStyle(
                        color: ColorManager.greyText,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      DateFormat('HH:mm aa')
                          .format(DateTime.parse(userchalleng.endTime!)),
                      style: getRegularStyle(
                        color: ColorManager.greyText,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );

      case 'Football':
        return Container(
          margin: EdgeInsets.only(top: 19.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 34.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 54 / 2,
                    foregroundImage: CachedNetworkImageProvider(userchalleng!
                                .team?.image !=
                            null
                        ? API.imageUrl(userchalleng!.team?.image ?? '')
                        : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    userchalleng!.team!.name!,
                    style: getBoldItalicStyle(
                        color: ColorManager.blackText, fontSize: 16.sp),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    userchalleng.results!.isEmpty
                        ? '0'
                        : userchalleng.results![0].resultData!
                                .replaceAll('.', ":") ??
                            "0",
                    style: getBoldItalicStyle(
                        color: ColorManager.blackText, fontSize: 16.sp),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 54 / 2,
                    foregroundImage: CachedNetworkImageProvider(userchalleng
                                .opponent?.image !=
                            null
                        ? API.imageUrl(userchalleng.opponent?.image ?? '')
                        : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    userchalleng.opponent!.name!,
                    style: getBoldItalicStyle(
                        color: ColorManager.blackText, fontSize: 16.sp),
                  )
                ],
              ),
            ],
          ),
        );

      default:
        return SizedBox();
    }
  }
}
