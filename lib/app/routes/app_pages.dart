import 'package:g57_find_home/app/screens/detail/detail_binding.dart';
import 'package:g57_find_home/app/screens/detail/detail_screen.dart';
import 'package:g57_find_home/app/screens/home/home_binding.dart';
import 'package:g57_find_home/app/screens/home/home_screen.dart';
import 'package:g57_find_home/app/screens/signup/signup_binding.dart';
import 'package:g57_find_home/app/screens/signup/signup_screen.dart';
import 'package:get/get.dart';
import 'package:g57_find_home/app/screens/login/login_binding.dart';
import 'package:g57_find_home/app/screens/login/login_screen.dart';

import 'package:g57_find_home/app/screens/splash/splash_binding.dart';
import 'package:g57_find_home/app/screens/splash/splash_screen.dart';

import 'package:g57_find_home/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      /* transitionDuration: const Duration(seconds: 5),
      transition: Transition.fadeIn, */
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      transitionDuration: const Duration(milliseconds: 800),
      page: () => const DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
