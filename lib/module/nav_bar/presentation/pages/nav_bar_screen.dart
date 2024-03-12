import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:global_online/core/helpers/show_bottom_sheet/show_bottom_sheet_input.dart';
import 'package:global_online/core/resources/color_manager.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/home/view/home_screen.dart';

import '../../../../core/helpers/custom_icon_icons.dart';
import '../../../../core/helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../../../../core/widgets/custom_text_field_widget.dart';
import '../../../chat/widgets/new_chat_widget.dart';
import '../manager/nav_bar_controller.dart';

class NavBarScreen extends StatefulWidget {
  NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return GetBuilder<NavBarController>(
        id: 'ss',
        builder: (controller) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorManager.background,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              title: Text(
                controller.getTitle(controller.tabIndex.value),
                style: getBoldStyle(
                    color: ColorManager.goodMorning, fontSize: 16.sp),
              ),
              elevation: 0,
              shape: controller.tabIndex.value != 1
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)))
                  : null,
              leading: IconButton(
                onPressed: () {
                  controller.toggleDrawer();
                },
                icon: Icon(
                  CustomIcon.menu,
                  color: ColorManager.goodMorning,
                  size: 20,
                ),
              ),
            ),
            extendBody: true,
            // backgroundColor: Colors.transparent,
            body: Navigator(
              key: Get.nestedKey(1),
              initialRoute: '/home',
              onGenerateRoute: controller.onGenerateRoute,
            ),
            //destination screen
            floatingActionButton:
                controller.tabIndex.value == 2 || controller.tabIndex.value == 4
                    ? GestureDetector(
                        onTap: () {
                          if (controller.tabIndex.value == 2) {
                            Get.toNamed(AppRoutes.createChallenges);
                          } else {
                            Get.find<IShowBottomSheetHelper>()
                                .showBottomSheet(ShowBottomSheetInput(
                              const NewChatWidget(),
                              isScrollControlled: true,
                            ));
                          }
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.70, -0.72),
                              end: Alignment(0.7, 0.72),
                              colors: [Color(0xFFFFD056), Color(0xFFF59C31)],
                            ),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x44F99F1B),
                                blurRadius: 14,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : null,
            bottomNavigationBar:
                (controller.zoomDrawerController.isOpen == true &&
                        controller.zoomDrawerController.isOpen != null)
                    ? null
                    : DotNavigationBar(
                        currentIndex: controller.tabIndex.value,
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        marginR: EdgeInsets.symmetric(horizontal: 20),
                        paddingR: const EdgeInsets.only(bottom: 6, top: 6),

                        onTap: (index) {
                          // log(controller.tabIndex.value.toString());
                          controller.changePage(index);
                        },
                        // dotIndicatorColor: Colors.black,
                        items: [
                          DotNavigationBarItem(
                              icon: Icon(CustomIcon.home),
                              unselectedColor: Color(0xffD1D7E4),
                              selectedColor: Color(0xff212121)),
                          DotNavigationBarItem(
                              icon: Icon(CustomIcon.myTeam),
                              unselectedColor: Color(0xffD1D7E4),
                              selectedColor: Color(0xff212121)),
                          DotNavigationBarItem(
                              icon: Icon(CustomIcon.challenges),
                              unselectedColor: Color(0xffD1D7E4),
                              selectedColor: Color(0xff212121)),
                          DotNavigationBarItem(
                              icon: Icon(CustomIcon.map),
                              unselectedColor: Color(0xffD1D7E4),
                              selectedColor: Color(0xff212121)),
                          DotNavigationBarItem(
                              icon: Icon(CustomIcon.chat),
                              unselectedColor: Color(0xffD1D7E4),
                              selectedColor: Color(0xff212121)),
                        ],
                      ),
          );
        });
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
        id: 'ss',
        builder: (logic) {
          return ZoomDrawer(
            controller: logic.zoomDrawerController,
            style: DrawerStyle.defaultStyle,
            menuScreen: Material(
              color: Color(0xFF36256E),
              child: Container(
                padding: EdgeInsetsDirectional.only(start: 15.w, top: 10.h),
                child: ListView(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 55 / 2,
                        foregroundImage:
                            AssetImage('assets/images/profile_avatar.png'),
                      ),
                      title: Text(
                        '${Storage().fistName}',
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16.sp),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.iconSpark,
                            color: Color(0xffF99F1B),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          Text(
                            '2,345 xp',
                            style: getRegularStyle(color: ColorManager.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ListTile(
                      onTap: () {
                        logic.toggleDrawer();
                        logic.changePage(0);
                      },
                      leading: Icon(
                        CustomIcon.home,
                        color: Colors.white,
                      ),
                      horizontalTitleGap: 10,
                      title: Text(
                        'Home',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        logic.toggleDrawer();
                        Get.toNamed(AppRoutes.profile);
                      },
                      leading: SvgPicture.asset(ImageAssets.iconProfile),
                      horizontalTitleGap: 10,
                      title: Text(
                        'Profile',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        logic.toggleDrawer();
                        logic.changePage(1);
                      },
                      leading: Icon(
                        CustomIcon.myTeam,
                        color: Colors.white,
                      ),
                      horizontalTitleGap: 10,
                      title: Text(
                        'My Teams',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        logic.toggleDrawer();
                        logic.changePage(2);
                      },
                      leading: Icon(
                        CustomIcon.challenges,
                        color: Colors.white,
                      ),
                      horizontalTitleGap: 10,
                      title: Text(
                        'My Cahllenges',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ImageAssets.iconBlog),
                      horizontalTitleGap: 10,
                      title: Text(
                        'Blog',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ImageAssets.iconContactUs),
                      horizontalTitleGap: 10,
                      title: Text(
                        'Contact us',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Storage().erase();
                        Get.offAllNamed(AppRoutes.login);
                      },
                      leading: SvgPicture.asset(ImageAssets.iconLogout),
                      horizontalTitleGap: 10,
                      title: Text(
                        'Logout',
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            menuBackgroundColor: Color(0xFF36256E),
            shrinkMainScreen: false,
            mainScreen: NavBarScreen(),
            borderRadius: 24.0,
            showShadow: true,
            angle: -3.0,
            drawerShadowsBackgroundColor: Colors.grey,
            slideWidth: MediaQuery.of(context).size.width * 0.65,
          );
        });
  }
}
