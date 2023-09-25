

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:global_online/module/team_details/data/data_source/team_details_data_source.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/model/team_details_model.dart';

class TeamDetailsController extends GetxController{
  final ITeamDetailsDataSource _detailsDataSource;

  TeamDetailsController(this._detailsDataSource);


  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<TeamDetailsModel> rxTeamDetailsModel= TeamDetailsModel().obs;

  void setRxTeamDetailsModel(TeamDetailsModel value) => rxTeamDetailsModel.value = value;

   @override
  void onInit() {
    super.onInit();
    if(Get.arguments  != null){
      getTeamDetails(Get.arguments);
    }
  }

  void getTeamDetails(String id) async{
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, TeamDetailsModel> teamDetails =
    await _detailsDataSource.getTeamDetails(id);
    teamDetails.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxTeamDetailsModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });

  }
}