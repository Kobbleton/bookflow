import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/signup_two_screen/sign_up_step_two_screen.dart';
import '../presentation/signup_one_screen/sign_up_step_one_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String signUpStepOneScreen = '/light_sign_up_step_four_screen';

  static const String splashScreen = '/light_splash_screen';

  static const String welcomeScreen = '/light_welcome_screen';

  static const String signUpStepTwoScreen = '/light_sign_up_step_five_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    signUpStepOneScreen: (context) => SignUpStepOneScreen(),
    splashScreen: (context) => const SplashScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    signUpStepTwoScreen: (context) => const SignUpStepTwoScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen()
  };
}
