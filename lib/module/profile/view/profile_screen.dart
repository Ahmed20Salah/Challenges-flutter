import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/apis/config_api.dart';
import '../../../core/helpers/custom_icon_icons.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: GetBuilder<ProfileController>
        (builder: (logic) {
        switch (logic.rxRequestStatus.value) {
          case RequestStatus.LOADING:
            return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.white.withOpacity(0.2),child: StaticWidgetProfile());
          case RequestStatus.SUCESS:
          return DefaultTabController(
            length: logic.tabsRael?.length??0,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  primary: true,
                  forceElevated: true,
                  expandedHeight: 400.h,
                  title: Text('Profile', style: getBoldStyle(
                      color: ColorManager.goodMorning, fontSize: 16.sp),),
                  flexibleSpace: FlexibleSpaceBar(

                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 44,
                          foregroundImage: CachedNetworkImageProvider(logic.rxProfileModel.value.userData?.avatar != null  ?API.imageUrl(logic.rxProfileModel.value.userData?.avatar??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),

                        ),
                        SizedBox(height: 15.h,),
                        Text('${Storage().fistName}', style: getBoldItalicStyle(
                            color: ColorManager.blackText, fontSize: FontSize.s16
                            .sp),

                        ),
                        SizedBox(height: 6.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.iconSpark, color: Color(
                                0xffF99F1B),),
                            SizedBox(width: AppSize.s8.w,),
                            Text('2,345 xp', style: getRegularStyle(
                                color: ColorManager.blackText),),

                          ],
                        ),
                        SizedBox(height: 16.h,),
                        TextButton(onPressed: () {},
                          child: Text('Edit Profile', style: getRegularStyle(
                              color: Color(0xff44327C), fontSize: 12.sp),),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 21.w),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(
                                      color: Color(0xff44327C)
                                  )
                              )
                          ),)
                      ],
                    ),
                  ),
                  bottom: logic.rxProfileModel.value.challenges?.isNotEmpty == true ? TabBar(
                      controller: logic.realController,
                      labelColor: Color(0xff44327C),
                      unselectedLabelColor: Color(0xff9EA4B1),
                      indicatorColor: Color(0xff44327C),
                      indicatorWeight: 5,

                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelStyle: getBoldStyle(
                          color: Color(0xff44327C), fontSize: 16.sp),
                      unselectedLabelStyle: getRegularStyle(
                          color: Color(0xff9EA4B1), fontSize: 16.sp),
                      tabs: logic.tabsRael??[SizedBox()]):null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)
                      )
                  ),

                ),
                SliverFillRemaining(
                  child:logic.rxProfileModel.value.challenges?.isNotEmpty == true ? TabBarView(
                      controller: logic.realController,
                      children: [
                        SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 19.h),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 15.h),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Sports day Challenge',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: FontSize.s16.sp),),
                                      SizedBox(height: AppSize.s10.h,),
                                      Row(
                                        children: [
                                          Text('7,563', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s24.sp),),
                                          Text(' Steps', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),),
                                        ],
                                      ),
                                      SizedBox(height: AppSize.s8.h,),
                                      ListTile(
                                        leading: Text('01',

                                          style: getRegularStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),

                                        ),
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        title: Row(
                                          children: [
                                            CircleAvatar(radius: 16,),
                                            SizedBox(width: AppSize.s12.w,),
                                            Text('Mohammed Radwan',
                                              style: getSemiBoldItalicStyle(
                                                  color: ColorManager.blackText),)
                                          ],
                                        ),
                                        trailing: Text('3:15 hours',
                                          style: getRegularStyle(
                                              color: Color(0xffF99F1B)),),

                                      ),
                                      Divider(color: Color(0xffD1D7E4),),

                                      Row(
                                        children: [
                                          Text(
                                            '23 Jul 2023',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '6:00am',
                                            textAlign: TextAlign.center,
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            'To',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            '3:00pm',
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

                                Container(
                                  margin: EdgeInsets.only(top: 19.h),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 15.h),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Sports day Challenge',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: FontSize.s16.sp),),
                                      SizedBox(height: AppSize.s10.h,),
                                      Row(
                                        children: [
                                          Text('7,563', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s24.sp),),
                                          Text(' Steps', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),),
                                        ],
                                      ),
                                      SizedBox(height: AppSize.s8.h,),
                                      ListTile(
                                        leading: Text('01',

                                          style: getRegularStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),

                                        ),
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        title: Row(
                                          children: [
                                            CircleAvatar(radius: 16,),
                                            SizedBox(width: AppSize.s12.w,),
                                            Text('Mohammed Radwan',
                                              style: getSemiBoldItalicStyle(
                                                  color: ColorManager.blackText),)
                                          ],
                                        ),
                                        trailing: Text('3:15 hours',
                                          style: getRegularStyle(
                                              color: Color(0xffF99F1B)),),

                                      ),
                                      Divider(color: Color(0xffD1D7E4),),

                                      Row(
                                        children: [
                                          Text(
                                            '23 Jul 2023',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '6:00am',
                                            textAlign: TextAlign.center,
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            'To',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            '3:00pm',
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
                                Container(
                                  margin: EdgeInsets.only(top: 19.h),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 15.h),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Sports day Challenge',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: FontSize.s16.sp),),
                                      SizedBox(height: AppSize.s10.h,),
                                      Row(
                                        children: [
                                          Text('7,563', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s24.sp),),
                                          Text(' Steps', style: getBoldItalicStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),),
                                        ],
                                      ),
                                      SizedBox(height: AppSize.s8.h,),
                                      ListTile(
                                        leading: Text('01',

                                          style: getRegularStyle(
                                              color: ColorManager.blackText,
                                              fontSize: FontSize.s16.sp),

                                        ),
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        title: Row(
                                          children: [
                                            CircleAvatar(radius: 16,),
                                            SizedBox(width: AppSize.s12.w,),
                                            Text('Mohammed Radwan',
                                              style: getSemiBoldItalicStyle(
                                                  color: ColorManager.blackText),)
                                          ],
                                        ),
                                        trailing: Text('3:15 hours',
                                          style: getRegularStyle(
                                              color: Color(0xffF99F1B)),),

                                      ),
                                      Divider(color: Color(0xffD1D7E4),),

                                      Row(
                                        children: [
                                          Text(
                                            '23 Jul 2023',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '6:00am',
                                            textAlign: TextAlign.center,
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            'To',
                                            style: getRegularStyle(
                                              color: ColorManager.greyText,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 9.w,),
                                          Text(
                                            '3:00pm',
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

                              ],
                            ),
                          ),
                        ),
                        // SingleChildScrollView(
                        //   physics: AlwaysScrollableScrollPhysics(),
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 24.w),
                        //     child: Column(
                        //       children: [
                        //         Container(
                        //           margin: EdgeInsets.only(top: 19.h),
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 25.w, vertical: 34.h),
                        //
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment
                        //                 .spaceBetween,
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Text('3', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text(':', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text('1', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.only(top: 19.h),
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 25.w, vertical: 34.h),
                        //
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment
                        //                 .spaceBetween,
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Text('3', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text(':', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text('1', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.only(top: 19.h),
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 25.w, vertical: 34.h),
                        //
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment
                        //                 .spaceBetween,
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Text('3', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text(':', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text('1', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.only(top: 19.h),
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 25.w, vertical: 34.h),
                        //
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment
                        //                 .spaceBetween,
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Text('3', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text(':', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                   Text('1', style: getBoldItalicStyle(
                        //                       color: ColorManager.blackText,
                        //                       fontSize: 16.sp),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 54 / 2,
                        //                   ),
                        //                   SizedBox(height: 15.h,),
                        //
                        //                   Text('Kalday Team',
                        //                     style: getBoldItalicStyle(
                        //                         color: ColorManager.blackText,
                        //                         fontSize: 16.sp),
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ]):Center(child: Text("NO Challenges YET")),
                )
              ],

            ),
          );
          case RequestStatus.ERROR:
     return Center(
       child: Text('NO Data'),
     );
        }
      }),
    );
  }
}

class StaticWidgetProfile extends StatelessWidget {
  const StaticWidgetProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return DefaultTabController(
        length: logic.tabs.length,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              primary: true,
              forceElevated: true,
              expandedHeight: 400.h,
              title: Text('Profile', style: getBoldStyle(
                  color: ColorManager.goodMorning, fontSize: 16.sp),),
              flexibleSpace: FlexibleSpaceBar(

                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 44,
                    ),
                    SizedBox(height: 15.h,),
                    Text('${Storage().fistName}', style: getBoldItalicStyle(
                        color: ColorManager.blackText, fontSize: FontSize.s16
                        .sp),

                    ),
                    SizedBox(height: 6.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageAssets.iconSpark, color: Color(
                            0xffF99F1B),),
                        SizedBox(width: AppSize.s8.w,),
                        Text('2,345 xp', style: getRegularStyle(
                            color: ColorManager.blackText),),

                      ],
                    ),
                    SizedBox(height: 16.h,),
                    TextButton(onPressed: () {},
                      child: Text('Edit Profile', style: getRegularStyle(
                          color: Color(0xff44327C), fontSize: 12.sp),),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 21.w),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                  color: Color(0xff44327C)
                              )
                          )
                      ),)
                  ],
                ),
              ),
              bottom: TabBar(
                  controller: logic.controller,
                  labelColor: Color(0xff44327C),
                  unselectedLabelColor: Color(0xff9EA4B1),
                  indicatorColor: Color(0xff44327C),
                  indicatorWeight: 5,

                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                  labelStyle: getBoldStyle(
                      color: Color(0xff44327C), fontSize: 16.sp),
                  unselectedLabelStyle: getRegularStyle(
                      color: Color(0xff9EA4B1), fontSize: 16.sp),
                  tabs: logic.tabs),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)
                  )
              ),

            ),
            SliverFillRemaining(
              child: TabBarView(
                  controller: logic.controller,
                  children: [
                    SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 15.h),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sports day Challenge',
                                    style: getBoldItalicStyle(
                                        color: ColorManager.blackText,
                                        fontSize: FontSize.s16.sp),),
                                  SizedBox(height: AppSize.s10.h,),
                                  Row(
                                    children: [
                                      Text('7,563', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s24.sp),),
                                      Text(' Steps', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.s8.h,),
                                  ListTile(
                                    leading: Text('01',

                                      style: getRegularStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),

                                    ),
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.zero,
                                    title: Row(
                                      children: [
                                        CircleAvatar(radius: 16,),
                                        SizedBox(width: AppSize.s12.w,),
                                        Text('Mohammed Radwan',
                                          style: getSemiBoldItalicStyle(
                                              color: ColorManager.blackText),)
                                      ],
                                    ),
                                    trailing: Text('3:15 hours',
                                      style: getRegularStyle(
                                          color: Color(0xffF99F1B)),),

                                  ),
                                  Divider(color: Color(0xffD1D7E4),),

                                  Row(
                                    children: [
                                      Text(
                                        '23 Jul 2023',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '6:00am',
                                        textAlign: TextAlign.center,
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        'To',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        '3:00pm',
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

                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 15.h),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sports day Challenge',
                                    style: getBoldItalicStyle(
                                        color: ColorManager.blackText,
                                        fontSize: FontSize.s16.sp),),
                                  SizedBox(height: AppSize.s10.h,),
                                  Row(
                                    children: [
                                      Text('7,563', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s24.sp),),
                                      Text(' Steps', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.s8.h,),
                                  ListTile(
                                    leading: Text('01',

                                      style: getRegularStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),

                                    ),
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.zero,
                                    title: Row(
                                      children: [
                                        CircleAvatar(radius: 16,),
                                        SizedBox(width: AppSize.s12.w,),
                                        Text('Mohammed Radwan',
                                          style: getSemiBoldItalicStyle(
                                              color: ColorManager.blackText),)
                                      ],
                                    ),
                                    trailing: Text('3:15 hours',
                                      style: getRegularStyle(
                                          color: Color(0xffF99F1B)),),

                                  ),
                                  Divider(color: Color(0xffD1D7E4),),

                                  Row(
                                    children: [
                                      Text(
                                        '23 Jul 2023',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '6:00am',
                                        textAlign: TextAlign.center,
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        'To',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        '3:00pm',
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
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 15.h),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sports day Challenge',
                                    style: getBoldItalicStyle(
                                        color: ColorManager.blackText,
                                        fontSize: FontSize.s16.sp),),
                                  SizedBox(height: AppSize.s10.h,),
                                  Row(
                                    children: [
                                      Text('7,563', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s24.sp),),
                                      Text(' Steps', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.s8.h,),
                                  ListTile(
                                    leading: Text('01',

                                      style: getRegularStyle(
                                          color: ColorManager.blackText,
                                          fontSize: FontSize.s16.sp),

                                    ),
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.zero,
                                    title: Row(
                                      children: [
                                        CircleAvatar(radius: 16,),
                                        SizedBox(width: AppSize.s12.w,),
                                        Text('Mohammed Radwan',
                                          style: getSemiBoldItalicStyle(
                                              color: ColorManager.blackText),)
                                      ],
                                    ),
                                    trailing: Text('3:15 hours',
                                      style: getRegularStyle(
                                          color: Color(0xffF99F1B)),),

                                  ),
                                  Divider(color: Color(0xffD1D7E4),),

                                  Row(
                                    children: [
                                      Text(
                                        '23 Jul 2023',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '6:00am',
                                        textAlign: TextAlign.center,
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        'To',
                                        style: getRegularStyle(
                                          color: ColorManager.greyText,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 9.w,),
                                      Text(
                                        '3:00pm',
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

                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 34.h),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),
                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('3', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text(':', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text('1', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),

                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 34.h),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),
                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('3', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text(':', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text('1', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),

                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 34.h),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),
                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('3', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text(':', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text('1', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),

                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 19.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 34.h),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),
                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('3', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text(':', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                      Text('1', style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 54 / 2,
                                      ),
                                      SizedBox(height: 15.h,),

                                      Text('Kalday Team',
                                        style: getBoldItalicStyle(
                                            color: ColorManager.blackText,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )
          ],

        ),
      );
    });
  }
}
