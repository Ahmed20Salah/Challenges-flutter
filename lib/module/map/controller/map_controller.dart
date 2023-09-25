

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../data/data_source/map_data_source.dart';
import '../data/model/healthy_place_model.dart';

class MapController extends GetxController{
    Position? myLocation;
  late BitmapDescriptor myIcon;
   final IMapDatasource _mapDatasource;

    MapController(this._mapDatasource);

  bool isLoadingPostion = false;
    final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
    void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
    final Rx<HealthyPlaceModel> rxHealthyPlaceModel= HealthyPlaceModel().obs;

    void setRxHealthyPlaceModel(HealthyPlaceModel value) => rxHealthyPlaceModel.value = value;


    @override
  void onInit() {
    super.onInit();
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(5, 5)), 'assets/images/icon_marker.png')
        .then((onValue) {
      myIcon = onValue;
    });
    getlocation();
    getHealthyPlace();

  }


    void getHealthyPlace()async{
      setRxRequestStatus(RequestStatus.LOADING);
      final Either<Failure, HealthyPlaceModel> myTeam =
      await _mapDatasource.getHealthyPlace(myLocation?.latitude.toString() ?? Storage().latitude??'', myLocation?.longitude.toString() ?? Storage().longitude??'');
      myTeam.fold((l) {
        setRxRequestStatus(RequestStatus.ERROR);

        log(l.message.toString());
        log(l.code.toString());
        errorToast(l.message);
      }, (r) {

        // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
        //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
        setRxHealthyPlaceModel(r);
        setRxRequestStatus(RequestStatus.SUCESS);
        update();
      });
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
    isLoadingPostion = true;
    update();
    //position stream?
  }
  // void updatePosition(CameraPosition _position) {
  //   lat = _position.target.latitude;
  //   long = _position.target.longitude;
  //
  //   update();
  // }
}