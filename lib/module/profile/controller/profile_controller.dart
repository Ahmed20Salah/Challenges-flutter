
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/netwrok/failure.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/data_source/profile_data_source.dart';
import '../data/model/profile_model.dart';

class ProfileController extends GetxController with GetTickerProviderStateMixin{
  final IProfileDataSource  _profileDataSource;

  ProfileController(this._profileDataSource);

  late TabController controller;
  late TabController realController;
  List<Widget> tabs = [
    Tab(text: 'Running',),
    Tab(text: 'Football',),
  ];
  List<Widget>? tabsRael ;
  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
    realController = TabController(length: tabsRael?.length ?? 0, vsync: this);


    getProfile();
  }
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<ProfileModel> rxProfileModel= ProfileModel().obs;

  void setRxProfileModel(ProfileModel value) => rxProfileModel.value = value;
  void getProfile() async{
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, ProfileModel> teamDetails =
    await _profileDataSource.getProfile();
    teamDetails.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      setRxProfileModel(r);
      gettTab( r.challenges??[]);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });

  }



  gettTab(List<Challenges> challenges){
    challenges.forEach((element) {
      print(element.category);
      tabsRael?.add(Tab(text: element.category?.name??'',));

    });
    update();
  }
}