import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:global_online/core/bindings/home_bindings.dart';
import 'package:global_online/core/netwrok/failure.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/chat/data/models/all_contact_model.dart';
import 'package:global_online/module/chat/view/chat_list_screen.dart';

import '../../../../core/bindings/challenges_bindings.dart';
import '../../../../core/bindings/chat_bindings.dart';
import '../../../../core/bindings/map_bindings.dart';
import '../../../../core/bindings/my_team_bindings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/error_toast.dart';
import '../../../challenges/view/challenges_screen.dart';
import '../../../chat/data/data_source/chat_data_source.dart';
import '../../../home/view/home_screen.dart';
import '../../../map/view/map_screen.dart';
import '../../../my_team/view/my_team_screen.dart';

class NavBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt tabIndex = 0.obs;
  var isPressed = false.obs;
  // late Animation<double> borderRadiusAnimation;
  // late AnimationController borderRadiusAnimationController;
  // late CurvedAnimation borderRadiusCurve;
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  final IChatDataSource _chatDataSource;
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<AllContactModel> rxEventDataModel = AllContactModel().obs;

  void setRxEventDataModel(AllContactModel value) =>
      rxEventDataModel.value = value;

  NavBarController(this._chatDataSource);
  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update(['ss']);
  }

  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changePage(0);

    print('jwtToken ${Storage().jwtToken}');
    // borderRadiusAnimationController = AnimationController(
    //   duration: Duration(milliseconds: 500),
    //   vsync: this,
    // );
    // borderRadiusCurve = CurvedAnimation(
    //   parent: borderRadiusAnimationController,
    //   curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    // );
    // borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
    //   borderRadiusCurve,
    // );
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        // update();
      });

    animationController.repeat();
    getAllContact();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  // Color changeColor(int index) {
  //   if (tabIndex.value == index) {
  //     return mainColor;
  //   } else {
  //     return unselectedIconColor;
  //   }
  // }

  void changePage(int index) {
    print(tabIndex.value);
    if (tabIndex.value != index) {
      print(index);
      tabIndex.value = index;
      print(tabIndex.value);
      Get.offAllNamed(
        pages[index],
        id: 1,
      );
      // Get.keys[1]!.currentState!.pushNamed(pages[index]);
      // // Get.toNamed(
      // //   pages[index],
      // //   id: 1,
      // // );
      update(['ss']);
    }
  }

  // String getTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return AppStrings.appName;
  //     case 1:
  //       return AppStrings.notification;
  //     case 2:
  //       return AppStrings.myReports;
  //     case 3:
  //       return AppStrings.services;
  //     case 4:
  //       return AppStrings.myOrders;
  //     default:
  //       return '';
  //   }
  // }
// late final  List<SvgPicture> _svgIcons = [
//     SvgPicture.asset(
//       ImageAssets.homeIcon,
//       width: 24,
//       height: 24,
//     ),
//     SvgPicture.asset(
//       ImageAssets.calendarIcon,
//       width: 24,
//       height: 24,
//     ),
//     SvgPicture.asset(
//       ImageAssets.contactIcon,
//       width: 24,
//       height: 24,
//     ),
//     SvgPicture.asset(
//       ImageAssets.profileIcon,
//       width: 24,
//       height: 24,
//     ),
//   ];
//  late List<IconData> _icons = _svgIcons.map((icon) {
//     final pictureRecorder = PictureRecorder();
//     final canvas = Canvas(pictureRecorder);
//     icon.paint(canvas, Rect.zero);
//     final picture = pictureRecorder.endRecording();
//     final image = picture.toImage(24, 24);
//     final bytes = image.toByteData(format: ImageByteFormat.png);
//     return IconData(0xe900, fontFamily: 'CustomIcons', fontPackage: null);
//   }).toList();
//   IconData _getIcon(int index) {
//     switch (index) {
//       case 0:
//         return IconData(0xe900, fontFamily: 'CustomIcons');
//       case 1:
//         return IconData(0xe901, fontFamily: 'CustomIcons');
//       case 2:
//         return IconData(0xe902, fontFamily: 'CustomIcons');
//       default:
//         throw Exception("Invalid index");
//     }
//   }
  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Hey ${Storage().fistName} 👋';
      case 1:
        return 'my Teams';
      case 2:
        return 'Challenges';
      case 3:
        return 'Map';
      case 4:
        return 'Chats';
      default:
        return '';
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return GetPageRoute(
          settings: settings,
          // curve: Curves.easeInCirc,
          transitionDuration: const Duration(milliseconds: 200),
          transition: Transition.downToUp,

          page: () => HomeScreen(),
          binding: HomeBindings(),

          // binding: BrowseBinding(),
        );
      case '/myTeam':
        return GetPageRoute(
          settings: settings,
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 200),
          page: () => MyTeamScreen(),
          binding: MyTeamBindings(),
        );
      case '/challenges':
        return GetPageRoute(
          settings: settings,
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 200),
          page: () => ChallengesScreen(),
          binding: ChallengesBindings(),
        );
      case '/map':
        return GetPageRoute(
            settings: settings,
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 200),
            page: () => MapScreen(),
            binding: MapBindings());
      case '/chat':
        return GetPageRoute(
            settings: settings,
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 200),
            page: () => const ChatListScreen(),
            binding: ChatBindings());
      // binding: CartBinding());
      default:
        return GetPageRoute(
            settings: settings,
            transition: Transition.leftToRight,
            page: () => Container(
                  child: const Text('NO Page'),
                ));
    }
  }

  final pages = <String>[
    '/home',
    '/myTeam',
    '/challenges',
    '/map',
    '/chat',
  ];

  void getAllContact() async {
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, AllContactModel> allContact =
        await _chatDataSource.allContact();
    allContact.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {
      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxEventDataModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });
  }
}
