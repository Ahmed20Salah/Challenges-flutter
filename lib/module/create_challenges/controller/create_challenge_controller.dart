


import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/create_challenges/data/data_source/create_challenge_data_source.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/helpers/date_time_picker.dart';
import '../../../core/helpers/show_dialog_helper/i_show_dialog_helper.dart';
import '../../../core/helpers/show_dialog_helper/show_dialog_input.dart';
import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/date_format_extensions.dart';
import '../../../core/utils/error_toast.dart';
import '../../../core/widgets/custom_elevated_button_widget.dart';
import '../../_main/data/main_data_source.dart';
import '../../_main/model/all_categories_model.dart';
import '../data/model/all_team_model.dart';
import '../data/model/all_users_model.dart';
import '../data/model/create_challenge_model.dart';

class CreateChallengeController extends GetxController{
  final IMainDataSource _mainDataSource;
  final ICreateChallengeDataSource _challengeDataSource;
  CreateChallengeController(this._mainDataSource, this._challengeDataSource,);

  TextEditingController titleController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController stepsNumController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController refereeUserController = TextEditingController();


  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<AllCategoriesModel> rxAllCategoriesModel= AllCategoriesModel().obs;

  void setRxAllCategoriesModel(AllCategoriesModel value) => rxAllCategoriesModel.value = value;
  final Rx<RequestStatus> rxRequestStatusAllTeam = RequestStatus.LOADING.obs ;
  void setRxRequestStatusAllTeam(RequestStatus value) => rxRequestStatusAllTeam.value = value;
  final RxList<TeamModel>? rxAllTeamModel= <TeamModel>[].obs ;

  void setRxAllTeamModel(List<TeamModel> value) => rxAllTeamModel?.value=  value  ;
  final Rx<RequestStatus> rxRequestStatusAUser = RequestStatus.LOADING.obs ;
  void setRxRequestStatusAllUser(RequestStatus value) => rxRequestStatusAUser.value = value;
  final RxList<AllUsers>? rxAllUsers= <AllUsers>[].obs ;
  void setRxAllUsers(List<AllUsers> value) => rxAllUsers?.value=  value ;


  AllCategories? selectedValue;
  TeamModel? selectedTeam;
  AllUsers? refereeUser;

  String? lat;
  String? long;
  String? startTime;
  String? endTime;
  String? date;
 @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getAllTeams();
    getAllUsers();
 }
  void getAllCategories() async{
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
      update();
    });
  }
  void selectedCategories(AllCategories? value){
    selectedValue = value;
    update();
  }
  void getAllTeams() async{
    setRxRequestStatusAllTeam(RequestStatus.LOADING);
    final Either<Failure, AllTeamModel> allTeams =
    await _challengeDataSource.getAllTeams();
    allTeams.fold((l) {
      setRxRequestStatusAllTeam(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {
      List<TeamModel>?  items = r.data;
      var itemAllProduct =
      items?.firstWhere((element) => element.firebaseDocument == Storage().teamDocument);
      items?.remove(itemAllProduct);
      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));

      setRxAllTeamModel(items??[]);
      setRxRequestStatusAllTeam(RequestStatus.SUCESS);
      update();
    });
  }
  void setLocation(LatLng latLng){
   lat = latLng.latitude.toString();
   long = latLng.latitude.toString();
   update();
  }
  void onChangeRadioTeam(TeamModel? selected ){
   selectedTeam = selected ;
   update();
  }
  void onChangeRadioRefereeUser(AllUsers? selected ){
    refereeUser = selected ;
    update();
  }
  void addShiftToList(BuildContext context)async{
    List<DateTime>? dateTimeList =await DateTimePicker.datePicker(context: context);
    if(dateTimeList?[0] != null && dateTimeList?[1] != null){
      startTime = DateTimeToString(DateTime.parse(dateTimeList?[0].toString()??'')).formatDateToString();
      date = DateFromattoString(DateTime.parse(dateTimeList?[0].toString()??'')).formatToString();
      endTime = DateTimeToString(DateTime.parse(dateTimeList?[1].toString()??'')).formatDateToString();
      dateController.text = '${DateFormatNotificationTimeToString(DateTime.parse(dateTimeList?[0].toString()??'')).formatDateToString()} To ${DateFormatNotificationTimeToString(DateTime.parse(dateTimeList?[1].toString()??'')).formatDateToString()}' ?? '';
      print(startTime);
      print(dateTimeList?[1]);
    }
  }

  void getAllUsers() async{
    setRxRequestStatusAllUser(RequestStatus.LOADING);
    final Either<Failure, AllUsersModel> allUsers =
    await _challengeDataSource.getAllUsers();
    allUsers.fold((l) {
      setRxRequestStatusAllUser(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {
      List<AllUsers>?  items = r.data;
      var itemAllProduct =
      items?.firstWhere((element) => element.firebaseUid == Storage().firebaseUID);
      items?.remove(itemAllProduct);
      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxAllUsers(items??[]);
      setRxRequestStatusAllUser(RequestStatus.SUCESS);
      update();
    });
  }



  void createChallenge(BuildContext context)async{
    final Either<Failure, CreateChallengeModel> createChallenge =
    await _challengeDataSource.createChallenge(titleController.text, refereeUser?.id.toString(), selectedValue?.id.toString(), startTime, endTime, distanceController.text, stepsNumController.text, selectedTeam?.firebaseDocument, lat, long,date);
    createChallenge.fold((l) =>     errorToast(l.message), (r) {
      successToast(r.message??'');
      Get.find<IShowDialogHelper>().showDialog(
        ShowDialogInput(builder: (context) {
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              padding: EdgeInsetsDirectional.only(
                  top: 55.h,
                  start: 35.w,
                  end: 35.w,
                  bottom: 26.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.iconSucsess, scale: 4,),
                  SizedBox(height: 36.h,),
                  Text('Challenge Created\n Successfully',
                      style: getBoldItalicStyle(
                          color: ColorManager.blackText,
                          fontSize: 16.sp),
                      textAlign: TextAlign.center),
                  SizedBox(height: 15.h,),
                  Text(
                    'The challenge has been created successfully. You will be notified when the request is \n approved',
                    style: getRegularStyle(
                        color: ColorManager.blackText,
                        fontSize: 12.sp),
                    maxLines: 3,
                    textAlign: TextAlign.center,),
                  SizedBox(height: 44.h,),
                  CustomElevatedButton(
                      title: 'view Challenges'.toUpperCase()),
                  SizedBox(height: 10.h,),
                  TextButton(onPressed: () {
                    Get.close(2);
                  },
                      child: Text(
                        'Home Page', style: getMediumStyle(
                          color: Color(0xffF99F1B),
                          fontSize: 16.sp),))
                ],
              ),
            ),
          );
        }, useSafeArea: true, context: context,),);
    });
  }
}