import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/resources/assets_manager.dart';
import 'package:global_online/core/resources/color_manager.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/resources/styles_manager.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/core/widgets/custom_elevated_button_widget.dart';
import 'package:global_online/module/my_team/controller/my_team_controller.dart';
import 'package:global_online/module/my_team/view/widgets/avatar_widget.dart';
import 'package:global_online/module/my_team/view/widgets/empty_team_widget.dart';
import 'package:shimmer/shimmer.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<MyTeamController>(

          builder: (logic) {
            switch(logic.rxRequestStatus.value){
              
              case RequestStatus.LOADING:
             return Shimmer.fromColors(
               baseColor: Colors.grey.withOpacity(0.2),
               highlightColor: Colors.white.withOpacity(0.2),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 26.w, vertical: 44.h),
                     decoration: const BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(20),
                           bottomLeft: Radius.circular(20),
                         )
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('My Teams', style: getSemiBoldStyle(
                                 color: ColorManager.blackText, fontSize: 16.sp),),
                             Container(
                               width: 32,
                               height: 32,
                               decoration: const ShapeDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment(1.00, 0.00),
                                   end: Alignment(-1, 0),
                                   colors: [Color(0xFF6D55A4), Color(0xFF36256E)],
                                 ),
                                 shape: OvalBorder(),
                               ),
                               child: Icon(Icons.add, color: Colors.white,),
                             ),

                           ],
                         ),
                         ListTile(
                           onTap: () => Get.toNamed(AppRoutes.teamDetails),
                           leading: CircleAvatar(
                             radius: 20,
                           ),
                           title: Text('Inter Rafah ⚽️', style: getBoldItalicStyle(
                               color: ColorManager.blackText,
                               fontSize: FontSize.s16.sp),
                           ),
                           subtitle: Row(
                             children: [
                               SvgPicture.asset(
                                 ImageAssets.iconSpark, color: Color(0xffF99F1B),),
                               SizedBox(width: AppSize.s8.w,),
                               Text('2,345 xp', style: getRegularStyle(
                                   color: ColorManager.blackText),),

                             ],
                           ),
                           trailing: Icon(Icons.arrow_forward_ios_rounded,
                             color: ColorManager.blackText, size: 18,),
                         )
                       ],
                     ),

                   ),
                   SizedBox(height: AppSize.s24.h,),
                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 26.w),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                         Text('Invitations To You', style: getSemiBoldStyle(
                             color: ColorManager.goodMorning, fontSize: FontSize
                             .s16.sp),),


                         Container(
                           margin: EdgeInsets.only(top: 16.h),
                           padding: EdgeInsetsDirectional.only(
                               start: 24.w, end: 24.w, top: 25.h, bottom: 20.h),
                           decoration: ShapeDecoration(
                             gradient: LinearGradient(
                               end: Alignment(-0.94, -0.33),
                               begin: Alignment(0.94, 1.33),
                               colors: [
                                 Color(0xFFF99F1B),
                                 Color(0xFFFFD056),
                                 Color(0xFFF59C31),
                                 Color(0xFFF28621)
                               ],),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               ListTile(
                                 contentPadding: EdgeInsetsDirectional.zero,
                                 leading: CircleAvatar(
                                   radius: 20,
                                 ),
                                 title: Text('V-Runners 🏃🏻‍♂️',
                                   style: getBoldItalicStyle(
                                       color: ColorManager.white,
                                       fontSize: FontSize.s16.sp),),
                                 subtitle: Row(
                                   children: [
                                     SvgPicture.asset(ImageAssets.iconSpark),
                                     SizedBox(width: AppSize.s8.w,),
                                     Text('2,345 xp', style: getRegularStyle(
                                         color: ColorManager.white),),
                                   ],
                                 ),
                                 trailing: Container(
                                   width: 32.w,
                                   height: 32.h,
                                   decoration: ShapeDecoration(
                                     color: Colors.white,
                                     shape: StarBorder(
                                       innerRadiusRatio: 0.9,
                                       points: 6,

                                     ),

                                   ),
                                 ),

                               ),
                               AvatarWidget(),
                               SizedBox(height: 12.h,),
                               Text(
                                 'The BMW Runners team invites you to join their team',
                                 style: getBoldItalicStyle(
                                     color: ColorManager.white,
                                     fontSize: FontSize.s16.sp),),
                               SizedBox(height: 20.h,),
                               Row(
                                 children: [
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white.withOpacity(0.3),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Refuse',
                                         style: getSemiBoldStyle(
                                             color: ColorManager.white,
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                   Spacer(
                                     flex: 1,
                                   ),
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Accept',
                                         style: getSemiBoldStyle(
                                             color: Color(0xFFF99F1B),
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),

                         ),
                         Container(
                           margin: EdgeInsets.only(top: 16.h),
                           padding: EdgeInsetsDirectional.only(
                               start: 24.w, end: 24.w, top: 25.h, bottom: 20.h),
                           decoration: ShapeDecoration(
                             gradient: LinearGradient(
                               end: Alignment(-0.94, -0.33),
                               begin: Alignment(0.94, 1.33),
                               colors: [
                                 Color(0xFFF99F1B),
                                 Color(0xFFFFD056),
                                 Color(0xFFF59C31),
                                 Color(0xFFF28621)
                               ],),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               ListTile(
                                 contentPadding: EdgeInsetsDirectional.zero,
                                 leading: CircleAvatar(
                                   radius: 20,
                                 ),
                                 title: Text('V-Runners 🏃🏻‍♂️',
                                   style: getBoldItalicStyle(
                                       color: ColorManager.white,
                                       fontSize: FontSize.s16.sp),),
                                 subtitle: Row(
                                   children: [
                                     SvgPicture.asset(ImageAssets.iconSpark),
                                     SizedBox(width: AppSize.s8.w,),
                                     Text('2,345 xp', style: getRegularStyle(
                                         color: ColorManager.white),),
                                   ],
                                 ),
                                 trailing: Container(
                                   width: 32.w,
                                   height: 32.h,
                                   decoration: ShapeDecoration(
                                     color: Colors.white,
                                     shape: StarBorder(
                                       innerRadiusRatio: 0.9,
                                       points: 6,

                                     ),

                                   ),
                                 ),

                               ),
                               AvatarWidget(),
                               SizedBox(height: 12.h,),
                               Text(
                                 'The BMW Runners team invites you to join their team',
                                 style: getBoldItalicStyle(
                                     color: ColorManager.white,
                                     fontSize: FontSize.s16.sp),),
                               SizedBox(height: 20.h,),
                               Row(
                                 children: [
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white.withOpacity(0.3),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Refuse',
                                         style: getSemiBoldStyle(
                                             color: ColorManager.white,
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                   Spacer(
                                     flex: 1,
                                   ),
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Accept',
                                         style: getSemiBoldStyle(
                                             color: Color(0xFFF99F1B),
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),

                         ),
                         Container(
                           margin: EdgeInsets.only(top: 16.h),
                           padding: EdgeInsetsDirectional.only(
                               start: 24.w, end: 24.w, top: 25.h, bottom: 20.h),
                           decoration: ShapeDecoration(
                             gradient: LinearGradient(
                               end: Alignment(-0.94, -0.33),
                               begin: Alignment(0.94, 1.33),
                               colors: [
                                 Color(0xFFF99F1B),
                                 Color(0xFFFFD056),
                                 Color(0xFFF59C31),
                                 Color(0xFFF28621)
                               ],),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               ListTile(
                                 contentPadding: EdgeInsetsDirectional.zero,
                                 leading: CircleAvatar(
                                   radius: 20,
                                 ),
                                 title: Text('V-Runners 🏃🏻‍♂️',
                                   style: getBoldItalicStyle(
                                       color: ColorManager.white,
                                       fontSize: FontSize.s16.sp),),
                                 subtitle: Row(
                                   children: [
                                     SvgPicture.asset(ImageAssets.iconSpark),
                                     SizedBox(width: AppSize.s8.w,),
                                     Text('2,345 xp', style: getRegularStyle(
                                         color: ColorManager.white),),
                                   ],
                                 ),
                                 trailing: Container(
                                   width: 32.w,
                                   height: 32.h,
                                   decoration: ShapeDecoration(
                                     color: Colors.white,
                                     shape: StarBorder(
                                       innerRadiusRatio: 0.9,
                                       points: 6,

                                     ),

                                   ),
                                 ),

                               ),
                               AvatarWidget(),
                               SizedBox(height: 12.h,),
                               Text(
                                 'The BMW Runners team invites you to join their team',
                                 style: getBoldItalicStyle(
                                     color: ColorManager.white,
                                     fontSize: FontSize.s16.sp),),
                               SizedBox(height: 20.h,),
                               Row(
                                 children: [
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white.withOpacity(0.3),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Refuse',
                                         style: getSemiBoldStyle(
                                             color: ColorManager.white,
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                   Spacer(
                                     flex: 1,
                                   ),
                                   Expanded(
                                     flex: 2,
                                     child: Container(
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.symmetric(
                                           vertical: 8.h),
                                       decoration: ShapeDecoration(
                                         color: Colors.white,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(
                                                 8)),
                                       ),
                                       child: Text('Accept',
                                         style: getSemiBoldStyle(
                                             color: Color(0xFFF99F1B),
                                             fontSize: FontSize.s14.sp),),
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),

                         ),
                       ],
                     ),
                   ),
                   // EmptyTeamWidget()
                 ],
               ),
             );
              case RequestStatus.SUCESS:
                if(logic.rxMyTeamModel.value.userTeam == null && logic.rxMyTeamModel.value.invitations?.isEmpty == true ){
                  return EmptyTeamWidget();
                }else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.w, vertical: 44.h),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('My Teams', style: getSemiBoldStyle(
                                    color: ColorManager.blackText,
                                    fontSize: 16.sp),),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(1.00, 0.00),
                                      end: Alignment(-1, 0),
                                      colors: [
                                        Color(0xFF6D55A4),
                                        Color(0xFF36256E)
                                      ],
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                  child: Icon(Icons.add, color: Colors.white,),
                                ),

                              ],
                            ),
                            ListTile(
                              onTap: () => Get.toNamed(AppRoutes.teamDetails,arguments: logic.rxMyTeamModel.value.userTeam?.id.toString()),
                              leading: CircleAvatar(
                                radius: 20,
                                foregroundImage: CachedNetworkImageProvider(logic.rxMyTeamModel.value.userTeam?.image != null  ?API.imageUrl(logic.rxMyTeamModel.value.userTeam?.image??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
                              ),
                              title: Text(
                                '${logic.rxMyTeamModel.value.userTeam?.name ??
                                    '' }', style: getBoldItalicStyle(
                                  color: ColorManager.blackText,
                                  fontSize: FontSize.s16.sp),
                              ),
                              subtitle: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconSpark,
                                    color: Color(0xffF99F1B),),
                                  SizedBox(width: AppSize.s8.w,),
                                  Text('2,345 xp', style: getRegularStyle(
                                      color: ColorManager.blackText),),

                                ],
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,
                                color: ColorManager.blackText, size: 18,),
                            )
                          ],
                        ),

                      ),
                      SizedBox(height: AppSize.s24.h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 26.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Invitations To You', style: getSemiBoldStyle(
                                color: ColorManager.goodMorning,
                                fontSize: FontSize
                                    .s16.sp),),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: logic.rxMyTeamModel.value.invitations
                                    ?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 16.h),
                                    padding: EdgeInsetsDirectional.only(
                                        start: 24.w,
                                        end: 24.w,
                                        top: 25.h,
                                        bottom: 20.h),
                                    decoration: ShapeDecoration(
                                      gradient: LinearGradient(
                                        end: Alignment(-0.94, -0.33),
                                        begin: Alignment(0.94, 1.33),
                                        colors: [
                                          Color(0xFFF99F1B),
                                          Color(0xFFFFD056),
                                          Color(0xFFF59C31),
                                          Color(0xFFF28621)
                                        ],),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [

                                        ListTile(
                                          contentPadding: EdgeInsetsDirectional
                                              .zero,
                                          leading: CircleAvatar(
                                            radius: 20,
                                            foregroundImage: CachedNetworkImageProvider(logic.rxMyTeamModel.value
                                                .invitations?[index]
                                                .invitationData?.team?.image != null  ?API.imageUrl(logic.rxMyTeamModel.value
                                                .invitations?[index]
                                                .invitationData?.team?.image??''):'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
                                          ),
                                          title: Text(
                                            logic.rxMyTeamModel.value
                                                .invitations?[index]
                                                .invitationData?.team?.name ??
                                                '',
                                            style: getBoldItalicStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s16.sp),),
                                          subtitle: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  ImageAssets.iconSpark),
                                              SizedBox(width: AppSize.s8.w,),
                                              Text('2,345 xp',
                                                style: getRegularStyle(
                                                    color: ColorManager
                                                        .white),),
                                            ],
                                          ),
                                          trailing: Container(
                                            width: 32.w,
                                            height: 32.h,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: StarBorder(
                                                innerRadiusRatio: 0.9,
                                                points: 6,

                                              ),

                                            ),
                                          ),

                                        ),
                                        AvatarWidget(),
                                        SizedBox(height: 12.h,),
                                        Text(
                                          'The ${logic.rxMyTeamModel.value
                                              .invitations?[index]
                                              .invitationData?.team?.name ??
                                              ''} team invites you to join their team',
                                          style: getBoldItalicStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s16.sp),),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.h),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(
                                                          8)),
                                                ),
                                                child: Text('Refuse',
                                                  style: getSemiBoldStyle(
                                                      color: ColorManager.white,
                                                      fontSize: FontSize.s14
                                                          .sp),),
                                              ),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.h),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(
                                                          8)),
                                                ),
                                                child: Text('Accept',
                                                  style: getSemiBoldStyle(
                                                      color: Color(0xFFF99F1B),
                                                      fontSize: FontSize.s14
                                                          .sp),),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  );
                                }),

                          ],
                        ),
                      ),
                      // EmptyTeamWidget()
                    ],
                  );
                }
              case RequestStatus.ERROR:
                return Center(
                  child: Text('No Data',style: getBoldStyle(color: Colors.black,fontSize: 20.sp),),
                );
            }
            
          },
        ),
      ),
    );
  }
}


