import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/assets_manager.dart';
import 'package:global_online/core/resources/resource.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (logic){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 114.w),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.24, 0.97),
              end: Alignment(-0.24, -0.97),
              colors: [
                Color(0xFF552D90),
                Color(0xFF6D55A4),
                Color(0xFF4A3782),
                Color(0xFF36256E)
              ],
            ),
          ),
          child: SvgPicture.asset(ImageAssets.splashLogo),


        );
      },
    );
  }
}
