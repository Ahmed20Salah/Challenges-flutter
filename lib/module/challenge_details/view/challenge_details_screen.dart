import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:global_online/module/challenge_details/controller/challenge_details_controller.dart';
import 'package:global_online/module/challenges/view/demo.dart';
import 'package:intl/intl.dart';

import '../../../core/config/apis/config_api.dart';
import '../../../core/helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../../../core/helpers/show_bottom_sheet/show_bottom_sheet_input.dart';
import '../../create_challenges/widgets/all_teams_widget.dart';


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
                expandedHeight: 300.h,
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
                           logic.rxChallengeDetailsModel.value.data?.category?.name == 'Running'?Container(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Text('${logic.rxChallengeDetailsModel.value.data?.stepsNum}', style: getBoldItalicStyle(
                                         color: ColorManager.black, fontSize: 40.sp),),
                                     SizedBox(width: 21.w,),
                                     Text('Steps', style: getBoldItalicStyle(
                                         color: ColorManager.black, fontSize: 16.sp),),
                                   ],
                                 ),
                                 SizedBox(height: 49.h,),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 40),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text('${DateFormat('h:mm a').format(DateTime.parse(logic.rxChallengeDetailsModel.value.data?.startTime?? ''))}', style: getRegularStyle(
                                           color: ColorManager.black, fontSize: 16.sp),),
                                       Text('TO', style: getRegularStyle(
                                           color: ColorManager.black, fontSize: 16.sp),),
                                       Text('${DateFormat('h:mm a').format(DateTime.parse(logic.rxChallengeDetailsModel.value.data?.endTime?? ''))}', style: getRegularStyle(
                                           color: ColorManager.black, fontSize: 16.sp),),

                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ): Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                ),
                                Expanded(
                                  child: Column(
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
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        textAlign: TextAlign.center,

                                      ),
                                      SizedBox(height: 5.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Container(
                  
                  padding: EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child:      logic.rxChallengeDetailsModel.value.data?.category?.name == 'Running' ?Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ranking',style: getBoldItalicStyle(color: ColorManager.goodMorning,fontSize: 15.sp),),
                        CustomElevatedButton(title: 'Start Challenge'.toUpperCase(),onPressed: (){
                          Get.to(()=>WalkingScreen());
                        },)

                      ],
                    ):Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Challenge Award',style: getSemiBoldStyle(color: ColorManager.goodMorning,fontSize: 15.sp),),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 11.w,vertical: 13),
                          margin: EdgeInsets.only(top: 13.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(imageUrl: 'https://www.jiomart.com/images/product/original/rvrgwpjvsp/bruton-trendy-sports-shoes-for-men-blue-product-images-rvrgwpjvsp-0-202209021256.jpg?im=Resize=(1000,1000)',

                                 height: 72.h,
                                width: 76.w,

                              ),
                              SizedBox(width: 10.w,),
                              Flexible(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
        children: [

                                Text('Nike shoes',style: getBoldStyle(color: ColorManager.goodMorning,fontSize: 16.sp),),
                                Text('dolor sit amet, consectetur adipiscing elit. Nunc vulputate.!',style: getRegularStyle(color: ColorManager.black,fontSize: 12.sp),),
                              ],))
                            ],
                          ),
                        ),

                        SizedBox(height: 29.h,),
                        Text('Location',style: getSemiBoldStyle(color: ColorManager.goodMorning,fontSize: 15.sp),),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 22),
                          margin: EdgeInsets.only(top: 13.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/images/map.png'),
                              SizedBox(height: 16.h,),
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
                        SizedBox(height: 31.h,),
                        CustomElevatedButton(title: 'End Challenge'.toUpperCase(),
                        onPressed: (){
                          Get.find<IShowBottomSheetHelper>().showBottomSheet(
                              ShowBottomSheetInput(DraggableScrollableSheet(
        initialChildSize: (Get.height - 520) / Get.height,
        maxChildSize: 0.85,
        builder: (context, scrollController) {

          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))
            ),
            padding: EdgeInsetsDirectional.only(
                start: 23.w, end: 32.w, top: 10.h),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    width: 54,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .circular(4)),
                    ),
                  ),
                  SizedBox(height: 34.h,),
                  Text('Enter Match Result ',style: getBoldStyle(color: ColorManager.black,fontSize: 16.sp),),
                   SizedBox(height: 12.h,),
                   Text('Please pick up the final match result',style: getRegularStyle(color: ColorManager.black,fontSize: 16.sp),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Column(
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


                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SpinBox(
                          min: 0,
                          max: 50,
                          value: logic.footballResultData,
                         incrementIcon: Icon(Icons.keyboard_arrow_up),

                         decrementIcon: Icon(Icons.keyboard_arrow_down),
                         direction: Axis.vertical,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          onChanged: (value) => logic.resultDataMyTeam(value),
                        ),
                      ),
                      Flexible(child: Text(':',style: getRegularStyle(color: Color(0xff454545),fontSize: 18.sp),)),
                      Flexible(
                        flex: 1,
                        child: SpinBox(
                          min: 0,
                          max: 50,
                          value: logic.opponentResult,
                         incrementIcon: Icon(Icons.keyboard_arrow_up),
                         decrementIcon: Icon(Icons.keyboard_arrow_down),
                         direction: Axis.vertical,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          onChanged: (value) => logic.opponentResultTeam(value),
                        ),
                      ),
                      Flexible(child: Column(
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
                          
                        ],
                      ),)
                    ],
                  ),
                  SizedBox(height: 19.h,),
                  CustomElevatedButton(title: 'Select'.toUpperCase(),onPressed: (){
                    logic.resultChallenge(Storage().teamId??'', logic.rxChallengeDetailsModel.value.data?.id.toString()??'', logic.footballResultData.toString(), null, null, logic.opponentResult.toString());
                    Get.close(0);
                  },)
                ],
              ),
            ),
          );
        }),

                                isScrollControlled: true,

                              ));
                        },)
                      ],
                    ),
                  ),
                ),
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
