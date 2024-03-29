import 'package:get/get.dart';
import 'package:global_online/core/bindings/blog_bindings.dart';
import 'package:global_online/module/auth/view/signup_screen.dart';
import 'package:global_online/module/blogs/views/blogs_screen.dart';
import 'package:global_online/module/challenge_details/view/challenge_details_screen.dart';
import 'package:global_online/module/chat/view/chat_screen.dart';
import 'package:global_online/module/create_challenges/view/create_challenges_screen.dart';
import 'package:global_online/module/team_details/view/team_details_screen.dart';

import '../../module/auth/view/login_screen.dart';
import '../../module/nav_bar/presentation/pages/nav_bar_screen.dart';
import '../../module/profile/view/profile_screen.dart';
import '../../module/splash/view/splash_screen.dart';
import '../bindings/challenges_details_bindings.dart';
import '../bindings/chat_bindings.dart';
import '../bindings/create_challenge_bindings.dart';
import '../bindings/login_bindings.dart';
import '../bindings/nav_bar_bindings.dart';
import '../bindings/profile_bindings.dart';
import '../bindings/signup_bindings.dart';
import '../bindings/team_details_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: AppRoutes.navBar,
      page: () => const CustomDrawer(),
      binding: NavBarBindings(),
    ),
    GetPage(
      name: AppRoutes.createChallenges,
      page: () => CreateChallenges(),
      binding: CreateChallengeBinding(),
    ),
    GetPage(
      name: AppRoutes.teamDetails,
      page: () => const TeamDetailsScreen(),
      binding: TeamDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: AppRoutes.challengeDetails,
      page: () => const ChallengesDetailsScreen(),
      binding: ChallengesDetailsBindings(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatScreen(),
      binding: ChatBindings(),
    ),
    GetPage(
      name: AppRoutes.blogs,
      page: () => const BlogsScreen(),
      binding: BlogBindings(),
    ),
  ];
}
