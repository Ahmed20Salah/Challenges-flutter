import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_online/module/challenges/view/demo.dart';

import 'core/bindings/main_bindings.dart';
import 'core/resources/resource.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/get_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // if (Firebase.apps.isEmpty) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  // } else {
  //   Firebase.app(); // if already initialized, use that one
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return GetMaterialApp(
            theme: ThemeData(fontFamily: 'Montserrat',appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: ColorManager.goodMorning))),
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            initialBinding: MainBindings(),
            initialRoute: AppRoutes.splash,
          // home: WalkingScreen(),
          );
        }
        ),

    );
  }
}