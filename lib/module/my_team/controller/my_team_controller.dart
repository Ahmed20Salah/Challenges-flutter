

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/data_source/my_team_data_source.dart';
import '../data/models/my_team_model.dart';

class MyTeamController extends GetxController{
  final IMyTeamDataSource _myTeamDataSource;

  MyTeamController(this._myTeamDataSource);
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<MyTeamModel> rxMyTeamModel= MyTeamModel().obs;

  void setRxMyTeamModel(MyTeamModel value) => rxMyTeamModel.value = value;


  @override
  void onInit() {
    super.onInit();
    getMyTeam();

  }

  void getMyTeam()async{
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, MyTeamModel> myTeam =
    await _myTeamDataSource.getMyTeam();
    myTeam.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxMyTeamModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });
  }
}