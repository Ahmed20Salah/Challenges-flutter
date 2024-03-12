import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/color_manager.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/constant.dart';
import '../../challenges/view/demo.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: GetBuilder<HomeController>(builder: (logic) {
        return Container(
          padding: EdgeInsets.only(
              left: AppSize.s25.w,
              right: AppSize.s25.w,
              top: AppSize.s11.h,
              bottom: AppSize.s40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Next challenge',
                  style: getSemiBoldStyle(
                      color: ColorManager.goodMorning,
                      fontSize: FontSize.s16.sp),
                ),
                SizedBox(
                  height: 12.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const WalkingScreen());
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-0.94, -0.33),
                        end: Alignment(0.94, 0.33),
                        colors: [
                          Color(0xFFF99F1B),
                          Color(0xFFFFD056),
                          Color(0xFFF59C31),
                          Color(0xFFF28621)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                            ),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'July Running Challenge',
                              style: getBoldItalicStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s16.sp),
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s8.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '3,999',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 64.sp),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Text(
                              'step',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 16.sp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '8:40 am',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 16.sp),
                            ),
                            Text(
                              '-',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 16.sp),
                            ),
                            Text(
                              '3:40 pm',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 16.sp),
                            ),
                            Text(
                              '23 Jul 2023',
                              style: getBlackItalicStyle(
                                  color: ColorManager.white, fontSize: 16.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                Text(
                  'Last challenges',
                  style: getSemiBoldStyle(
                      color: ColorManager.goodMorning,
                      fontSize: FontSize.s16.sp),
                ),
                Container(
                  margin: EdgeInsets.only(top: 19.h),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sports day Challenge',
                        style: getBoldItalicStyle(
                            color: ColorManager.blackText,
                            fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        height: AppSize.s10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '7,563',
                            style: getBoldItalicStyle(
                                color: ColorManager.blackText,
                                fontSize: FontSize.s24.sp),
                          ),
                          Text(
                            ' Steps',
                            style: getBoldItalicStyle(
                                color: ColorManager.blackText,
                                fontSize: FontSize.s16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      ListTile(
                        leading: Text(
                          '01',
                          style: getRegularStyle(
                              color: ColorManager.blackText,
                              fontSize: FontSize.s16.sp),
                        ),
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                            ),
                            SizedBox(
                              width: AppSize.s12.w,
                            ),
                            Text(
                              'Mohammed Radwan',
                              style: getSemiBoldItalicStyle(
                                  color: ColorManager.blackText),
                            )
                          ],
                        ),
                        trailing: Text(
                          '3:15 hours',
                          style:
                              getRegularStyle(color: const Color(0xffF99F1B)),
                        ),
                      ),
                      const Divider(
                        color: Color(0xffD1D7E4),
                      ),
                      Row(
                        children: [
                          Text(
                            '23 Jul 2023',
                            style: getRegularStyle(
                              color: ColorManager.greyText,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '6:00am',
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              color: ColorManager.greyText,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            'To',
                            style: getRegularStyle(
                              color: ColorManager.greyText,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
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
                GetBuilder<HomeController>(builder: (logic) {
                  switch (logic.rxRequestStatus.value) {
                    case RequestStatus.LOADING:
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.2),
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 19.h),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                padding: EdgeInsetsDirectional.only(
                                    top: 24.h,
                                    bottom: 20.h,
                                    start: 18.w,
                                    end: 18.w),
                                child: Column(
                                  children: [
                                    Text(
                                      '23 Jul 2023',
                                      style: getBoldItalicStyle(
                                          color: ColorManager.blackText,
                                          fontSize: 16.sp),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const CircleAvatar(
                                              radius: 54 / 2,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Text(
                                              'Kalday Team',
                                              style: getBoldStyle(
                                                  color: ColorManager.blackText,
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  ImageAssets.iconSpark,
                                                  color:
                                                      const Color(0xffF99F1B),
                                                ),
                                                SizedBox(
                                                  width: AppSize.s8.w,
                                                ),
                                                Text(
                                                  '2,345 xp',
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .blackText),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '18:00',
                                              style: getBoldStyle(
                                                  color: ColorManager.blackText,
                                                  fontSize: 16.sp),
                                            ),
                                            Text(
                                              '2 days',
                                              style: getMediumStyle(
                                                  color: ColorManager.blackText,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const CircleAvatar(
                                              radius: 54 / 2,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Text(
                                              'Lansing Team',
                                              style: getBoldStyle(
                                                  color: ColorManager.blackText,
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  ImageAssets.iconSpark,
                                                  color:
                                                      const Color(0xffF99F1B),
                                                ),
                                                SizedBox(
                                                  width: AppSize.s8.w,
                                                ),
                                                Text(
                                                  '2,345 xp',
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .blackText),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        Text(
                                          'City Stad, city, street 1234',
                                          style: getMediumStyle(
                                              color: ColorManager.goodMorning,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
                    case RequestStatus.SUCESS:
                      // return SizedBox();
                      return ListView.builder(
                          itemCount: logic.rxUserChallengesModel.value
                                  .userchallenges?.length ??
                              0,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return logic.getWidgetChallanges(logic
                                .rxUserChallengesModel
                                .value
                                .userchallenges?[index]);
                          });
                    case RequestStatus.ERROR:
                      return const Center(
                        child: Text('NO Challenges'),
                      );
                  }
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xffFFFFFF);
    path = Path();
    path.lineTo(0, size.height * 0.43);
    path.cubicTo(size.width * 0.06, size.height * 0.34, size.width / 5,
        size.height * 0.12, size.width * 0.35, -0.09);
    path.cubicTo(size.width * 0.51, -0.33, size.width * 0.67, -0.57,
        size.width * 0.67, -0.57);
    path.cubicTo(size.width * 0.67, -0.57, size.width * 0.47,
        size.height * 0.15, size.width * 0.46, size.height * 0.18);
    path.cubicTo(size.width * 0.46, size.height * 0.18, size.width,
        size.height * 0.18, size.width, size.height * 0.18);
    path.cubicTo(size.width * 0.94, size.height * 0.27, size.width * 0.89,
        size.height * 0.35, size.width * 0.83, size.height * 0.43);
    path.cubicTo(size.width * 0.56, size.height * 0.43, size.width * 0.28,
        size.height * 0.43, 0, size.height * 0.43);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
