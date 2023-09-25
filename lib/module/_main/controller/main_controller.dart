

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/_main/data/main_data_source.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../model/all_categories_model.dart';
import '../model/user_model.dart';

class MainController extends GetxController{
  final IMainDataSource _mainDataSource;

  MainController(this._mainDataSource);
  Position? myLocation;

  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<AllCategoriesModel> rxAllCategoriesModel= AllCategoriesModel().obs;

  void setRxAllCategoriesModel(AllCategoriesModel value) => rxAllCategoriesModel.value = value;

  AllCategories? selectedValue;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getlocation();
    if(Storage().jwtToken != null){
      getUser();
    }
  }
  getlocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("location service is not enabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //do stuff here
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //stuff
        return Future.error("location permissions denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permissions permanently denied");
    }
    myLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     Storage().latitude = myLocation?.latitude.toString();
     Storage().longitude = myLocation?.longitude.toString();
    //position stream?
  }

  void getUser() async {
    final Either<Failure,UserModel> userData = await _mainDataSource.getUser();

    userData.fold((l) {
      log(l.message.toString());
      log(l.code.toString());
    }
  , (r) {
          Storage().type= r.userData?.type;
          Storage().teamDocument= r.userData?.team?.firebaseDocument;
  });

  }
  void getAllCategories()async{
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, AllCategoriesModel> myTeam =
    await _mainDataSource.getAllCategories();
    myTeam.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxAllCategoriesModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update(['AllCategories']);
    });
  }


  void selectedCategories(AllCategories? value){
    selectedValue = value;
    update(['AllCategories']);
  }
}