
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:global_online/module/challenge_details/data/data_source/challenge_details_data_source.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/models/challenge_details_model.dart';

class ChallengeDetailsController extends GetxController{

  final IChallengeDetailsDataSource _detailsDataSource;

  ChallengeDetailsController(this._detailsDataSource);


  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<ChallengeDetailsModel> rxChallengeDetailsModel = ChallengeDetailsModel().obs;

  void setRxChallengeDetailsModel(ChallengeDetailsModel value) => rxChallengeDetailsModel.value = value;


  @override
  void onInit() {
    super.onInit();
     if(Get.arguments != null){
       getChallengesDetails(Get.arguments);
     }

  }

  Future<void> getChallengesDetails(String id) async {
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, ChallengeDetailsModel> allContact =
    await _detailsDataSource.getChallengesDetails(id);
    allContact.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxChallengeDetailsModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });
  }


}