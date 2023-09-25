import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:global_online/core/helpers/custom_icon_icons.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/team_details/controller/team_details_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/apis/config_api.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({super.key});

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body:  GetBuilder<TeamDetailsController>(builder: (logic) {
          switch(logic.rxRequestStatus.value){
            case RequestStatus.LOADING:
              return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.white.withOpacity(0.2),
                child: DefaultTabController(
                  length: 2,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        pinned: true,
                        primary: true,
                        forceElevated: true,
                        expandedHeight: 400.h,
                        actions: [
                          IconButton(onPressed: (){}, icon:               Icon(Icons.more_vert))
                        ],

                        flexibleSpace: FlexibleSpaceBar(

                          background: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                              ),
                              SizedBox(height: 10.h,),
                              Text('Inter Rafah️',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),

                              ),
                              SizedBox(height: 4.h,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImageAssets.iconSpark,color:Color(0xffF99F1B) ,),
                                  SizedBox(width: AppSize.s8.w,),
                                  Text('2,345 xp',style:getRegularStyle(color: ColorManager.blackText) ,),

                                ],
                              ),
                              SizedBox(height: 29.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Column(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconAddUserTeam,width: 24.w,height: 24.h, ),
                                      SizedBox(height: 11.h,),
                                      Text('Add',style: getRegularStyle(color: Color(0xff464455),fontSize: 12.sp),)
                                    ],
                                  ),
                                  SizedBox(width: 37.w,),
                                  Column(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconSearch,width: 24.w,height: 24.h,),
                                      SizedBox(height: 11.h,),
                                      Text('Search',style: getRegularStyle(color: Color(0xff464455),fontSize: 12.sp),)
                                    ],
                                  ),
                                  SizedBox(width: 37.w,),

                                  Column(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconMute,width: 24.w,height: 24.h,),
                                      SizedBox(height: 11.h,),
                                      Text('Mute',style: getRegularStyle(color: Color(0xff464455),fontSize: 12.sp),)
                                    ],
                                  ),
                                  SizedBox(width: 37.w,),

                                  Column(
                                    children: [
                                      SvgPicture.asset(ImageAssets.iconLogout,color: Colors.black,width: 24.w,height: 24.h,),
                                      SizedBox(height: 11.h,),
                                      Text('Leave',style: getRegularStyle(color: Color(0xff464455),fontSize: 12.sp),)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 29.h,),
                              Container(
                                margin: EdgeInsetsDirectional.symmetric(horizontal: 50.w),
                                padding: EdgeInsetsDirectional
                                    .symmetric(
                                    horizontal: 34.w,
                                    vertical: 11.h),
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin:
                                    Alignment(-1.00, -0.07),
                                    end: Alignment(1, 0.07),
                                    colors: [
                                      Color(0xFFFFD056),
                                      Color(0xFFF59C31)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          8)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(CustomIcon.challenges,color: Colors.white,),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      'Create Challenge',
                                      style: getSemiBoldStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        bottom: TabBar(
                            controller: controller,
                            labelColor:Color(0xff44327C) ,
                            unselectedLabelColor:Color(0xff9EA4B1) ,
                            indicatorColor:Color(0xff44327C) ,
                            indicatorWeight: 5,

                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                            labelStyle: getBoldStyle(color: Color(0xff44327C),fontSize: 16.sp),
                            unselectedLabelStyle: getRegularStyle(color: Color(0xff9EA4B1),fontSize: 16.sp),
                            tabs: [
                              Tab(text: 'challenges',),
                              Tab(text: 'Members',),
                            ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r)
                            )
                        ),

                      ),
                      SliverFillRemaining(
                        child: TabBarView(
                            controller: controller,
                            children: [
                              SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 19.h),
                                        decoration: ShapeDecoration(
                                          color:Colors.white ,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Sports day Challenge',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),),
                                            SizedBox(height: AppSize.s10.h,),
                                            Row(
                                              children: [
                                                Text('7,563',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s24.sp),),
                                                Text(' Steps',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),),
                                              ],
                                            ),
                                            SizedBox(height: AppSize.s8.h,),
                                            ListTile(
                                              leading: Text('01',

                                                style: getRegularStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),

                                              ),
                                              horizontalTitleGap: 0,
                                              contentPadding: EdgeInsets.zero,
                                              title: Row(
                                                children: [
                                                  CircleAvatar(radius: 16,),
                                                  SizedBox(width: AppSize.s12.w,),
                                                  Text('Mohammed Radwan',style: getSemiBoldItalicStyle(color: ColorManager.blackText),)
                                                ],
                                              ),
                                              trailing: Text('3:15 hours',style: getRegularStyle(color: Color(0xffF99F1B)),),

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
                                          color:Colors.white ,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 34.h),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 54/2,
                                                ),
                                                SizedBox(height: 15.h,),
                                                Text('Kalday Team',
                                                  style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('3',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                                Text(':',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                                Text('1',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 54/2,
                                                ),
                                                SizedBox(height: 15.h,),

                                                Text('Kalday Team',
                                                  style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 19.h),
                                        decoration: ShapeDecoration(
                                          color:Colors.white ,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Sports day Challenge',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),),
                                            SizedBox(height: AppSize.s10.h,),
                                            Row(
                                              children: [
                                                Text('7,563',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s24.sp),),
                                                Text(' Steps',style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),),
                                              ],
                                            ),
                                            SizedBox(height: AppSize.s8.h,),
                                            ListTile(
                                              leading: Text('01',

                                                style: getRegularStyle(color: ColorManager.blackText,fontSize: FontSize.s16.sp),

                                              ),
                                              horizontalTitleGap: 0,
                                              contentPadding: EdgeInsets.zero,
                                              title: Row(
                                                children: [
                                                  CircleAvatar(radius: 16,),
                                                  SizedBox(width: AppSize.s12.w,),
                                                  Text('Mohammed Radwan',style: getSemiBoldItalicStyle(color: ColorManager.blackText),)
                                                ],
                                              ),
                                              trailing: Text('3:15 hours',style: getRegularStyle(color: Color(0xffF99F1B)),),

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
                                          color:Colors.white ,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 34.h),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 54/2,
                                                ),
                                                SizedBox(height: 15.h,),
                                                Text('Kalday Team',
                                                  style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('3',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                                Text(':',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                                Text('1',                      style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 54/2,
                                                ),
                                                SizedBox(height: 15.h,),

                                                Text('Kalday Team',
                                                  style: getBoldItalicStyle(color: ColorManager.blackText,fontSize: 16.sp),
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
                              Container(
                                color: Colors.red,
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              );
            case RequestStatus.SUCESS:
            return DefaultTabController(
              length: 2,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: true,
                    primary: true,
                    forceElevated: true,
                    expandedHeight: 400.h,
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],

                    flexibleSpace: FlexibleSpaceBar(

                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            foregroundImage: CachedNetworkImageProvider(logic.rxTeamDetailsModel.value.userTeam?.image != null  ?API.imageUrl(logic.rxTeamDetailsModel.value.userTeam?.image??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
                          ),
                          SizedBox(height: 10.h,),
                          Text(logic.rxTeamDetailsModel.value.userTeam?.name??'', style: getBoldItalicStyle(
                              color: ColorManager.blackText,
                              fontSize: FontSize.s16.sp),

                          ),
                          SizedBox(height: 4.h,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageAssets.iconSpark, color: Color(0xffF99F1B),),
                              SizedBox(width: AppSize.s8.w,),
                              Text('2,345 xp', style: getRegularStyle(
                                  color: ColorManager.blackText),),

                            ],
                          ),
                          SizedBox(height: 29.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Column(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconAddUserTeam, width: 24.w,
                                    height: 24.h,),
                                  SizedBox(height: 11.h,),
                                  Text('Add', style: getRegularStyle(
                                      color: Color(0xff464455), fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: 37.w,),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconSearch, width: 24.w,
                                    height: 24.h,),
                                  SizedBox(height: 11.h,),
                                  Text('Search', style: getRegularStyle(
                                      color: Color(0xff464455), fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: 37.w,),

                              Column(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconMute, width: 24.w,
                                    height: 24.h,),
                                  SizedBox(height: 11.h,),
                                  Text('Mute', style: getRegularStyle(
                                      color: Color(0xff464455), fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: 37.w,),

                              Column(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconLogout, color: Colors.black,
                                    width: 24.w,
                                    height: 24.h,),
                                  SizedBox(height: 11.h,),
                                  Text('Leave', style: getRegularStyle(
                                      color: Color(0xff464455), fontSize: 12.sp),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 29.h,),
                          Container(
                            margin: EdgeInsetsDirectional.symmetric(
                                horizontal: 50.w),
                            padding: EdgeInsetsDirectional
                                .symmetric(
                                horizontal: 34.w,
                                vertical: 11.h),
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin:
                                Alignment(-1.00, -0.07),
                                end: Alignment(1, 0.07),
                                colors: [
                                  Color(0xFFFFD056),
                                  Color(0xFFF59C31)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CustomIcon.challenges, color: Colors.white,),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  'Create Challenge',
                                  style: getSemiBoldStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    bottom: TabBar(
                        controller: controller,
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
                        tabs: [
                          Tab(text: 'challenges',),
                          Tab(text: 'Members',),
                        ]),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r)
                        )
                    ),

                  ),
                  SliverFillRemaining(

                    child: TabBarView(
                        controller: controller,
                        children: [
                         logic.rxTeamDetailsModel.value.challenges?.isNotEmpty ==true ? SingleChildScrollView(
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
                                            Text(' Steps',
                                              style: getBoldItalicStyle(
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
                                            Text(' Steps',
                                              style: getBoldItalicStyle(
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
                          ):Center(
                           child:  Text('NO Challenges Yet'),
                         ),
                          ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                              itemCount: logic.rxTeamDetailsModel.value.members?.length??0,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index){
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                              ),
                              title: Text(logic.rxTeamDetailsModel.value.members?[index].name??''),
                            );
                          }),
                        ]),
                  )
                ],
              ),
            );
            case RequestStatus.ERROR:
             return Center(
               child:  Text('NO DATA'),
             );
          }

        }),

    );
  }
}
