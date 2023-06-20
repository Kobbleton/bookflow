import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/light_sign_up_step_five_screen/light_sign_up_step_five_screen.dart';
import '../presentation/light_sign_up_step_four_screen/light_sign_up_step_four_screen.dart';
import '../presentation/light_splash_screen/light_splash_screen.dart';
import '../presentation/light_welcome_screen/light_welcome_screen.dart';


class AppRoutes {
  static const String lightSignUpStepFourScreen =
      '/light_sign_up_step_four_screen';

  static const String lightSplashScreen = '/light_splash_screen';

  static const String lightWelcomeScreen = '/light_welcome_screen';

  static const String lightSignUpStepFiveScreen =
      '/light_sign_up_step_five_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    lightSignUpStepFourScreen: (context) => LightSignUpStepFourScreen(),
    lightSplashScreen: (context) => const LightSplashScreen(),
    lightWelcomeScreen: (context) => LightWelcomeScreen(),
    lightSignUpStepFiveScreen: (context) => const LightSignUpStepFiveScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen()
  };
}
